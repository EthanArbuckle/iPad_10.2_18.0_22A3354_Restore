@implementation NSURL(FPConflictWinner)

- (BOOL)shouldBeForwardedToFileProvider
{
  void *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "fp_fpfsRootURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2 && !CloudDocsLibrary_0())
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[GSAddition(FPVersions) shouldBeForwardedToFileProvider].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  return v2 != 0;
}

- (id)fp_lastEditorDeviceName
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if ((objc_msgSend(a1, "shouldBeForwardedToFileProvider") & 1) != 0)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__20;
    v10 = __Block_byref_object_dispose__20;
    v11 = 0;
    +[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__NSURL_FPConflictWinner__fp_lastEditorDeviceName__block_invoke;
    v5[3] = &unk_1E444E338;
    v5[4] = &v6;
    objc_msgSend(v2, "itemForURL:completionHandler:", a1, v5);

    v3 = (id)v7[5];
    _Block_object_dispose(&v6, 8);

    return v3;
  }
  else
  {
    objc_msgSend(a1, "br_lastEditorDeviceName");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)fp_lastEditorNameComponents
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if ((objc_msgSend(a1, "shouldBeForwardedToFileProvider") & 1) != 0)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__20;
    v10 = __Block_byref_object_dispose__20;
    v11 = 0;
    +[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__NSURL_FPConflictWinner__fp_lastEditorNameComponents__block_invoke;
    v5[3] = &unk_1E444E338;
    v5[4] = &v6;
    objc_msgSend(v2, "itemForURL:completionHandler:", a1, v5);

    v3 = (id)v7[5];
    _Block_object_dispose(&v6, 8);

    return v3;
  }
  else
  {
    objc_msgSend(a1, "br_lastEditorNameComponents");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)fp_addTestConflictLoserFromItemAtURL:()FPConflictWinner lastEditorDeviceName:lastEditorUserName:error:
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSFileProviderItemVersion *v14;
  void *v15;
  void *v16;
  void *v17;
  FPConflictLoser *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  id v31;
  FPConflictLoser *v33;
  id v34;
  id v35;
  NSFileProviderItemVersion *v36;
  _QWORD v37[4];
  NSObject *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _QWORD v53[4];
  _QWORD v54[4];
  const __CFString *v55;
  void *v56;
  _QWORD v57[2];
  _QWORD v58[4];

  v58[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v34 = a4;
  v35 = a5;
  CloudDocsLibrary_0();
  objc_msgSend(MEMORY[0x1E0D25D48], "manager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "permanentStorageForItemAtURL:allocateIfNone:error:", a1, 1, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0CB3850]);
  v14 = [NSFileProviderItemVersion alloc];
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[NSFileProviderItemVersion initWithContentVersion:metadataVersion:](v14, "initWithContentVersion:metadataVersion:", v15, v16);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [FPConflictLoser alloc];
  objc_msgSend(v10, "lastPathComponent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[FPFileVersion initWithVersion:displayName:originalURL:physicalURL:identifier:modificationDate:lastEditorNameComponents:size:](v18, "initWithVersion:displayName:originalURL:physicalURL:identifier:modificationDate:lastEditorNameComponents:size:", v36, v19, v10, 0, 0, v17, v13, 0);

  v20 = MEMORY[0x1E0C9AAB0];
  v56 = v17;
  v57[0] = CFSTR("isFPFS");
  v57[1] = CFSTR("NSDocumentInfo");
  v58[0] = MEMORY[0x1E0C9AAB0];
  v55 = CFSTR("modificationDate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v53[0] = *MEMORY[0x1E0D25CD0];
  objc_msgSend(v10, "lastPathComponent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x1E0D25CC8];
  v54[0] = v23;
  v54[1] = v20;
  v25 = *MEMORY[0x1E0D25CF8];
  v53[1] = v24;
  v53[2] = v25;
  v53[3] = *MEMORY[0x1E0D25CD8];
  v26 = *MEMORY[0x1E0D25D30];
  v54[2] = v22;
  v54[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = dispatch_group_create();
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__20;
  v51 = __Block_byref_object_dispose__20;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__20;
  v45 = __Block_byref_object_dispose__20;
  v46 = 0;
  objc_msgSend(v12, "prepareAdditionCreationWithItemAtURL:byMoving:creationInfo:error:", v10, 1, v27, a6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v28);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __110__NSURL_FPConflictWinner__fp_addTestConflictLoserFromItemAtURL_lastEditorDeviceName_lastEditorUserName_error___block_invoke;
  v37[3] = &unk_1E444E360;
  v39 = &v41;
  v40 = &v47;
  v30 = v28;
  v38 = v30;
  objc_msgSend(v12, "createAdditionStagedAtURL:creationInfo:completionHandler:", v29, v27, v37);
  dispatch_group_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
  if (a6)
    *a6 = objc_retainAutorelease((id)v42[5]);
  v31 = (id)v48[5];

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v31;
}

@end
