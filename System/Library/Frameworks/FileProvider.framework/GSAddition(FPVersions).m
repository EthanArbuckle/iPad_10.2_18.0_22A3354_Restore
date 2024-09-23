@implementation GSAddition(FPVersions)

- (uint64_t)shouldBeForwardedToFileProvider
{
  void *v2;
  void *v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((FPIsCloudDocsWithFPFSEnabled() & 1) != 0)
    return 1;
  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isFPFS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  if (!CloudDocsLibrary_0())
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[GSAddition(FPVersions) shouldBeForwardedToFileProvider].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return 0;
}

- (uint64_t)fp_markResolvedWithError:()FPVersions
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if ((objc_msgSend(a1, "shouldBeForwardedToFileProvider") & 1) == 0)
    return objc_msgSend(a1, "br_markResolvedWithError:", a3);
  objc_msgSend(a1, "markSavedConflictAsResolved:error:", 1, a3);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__20;
  v15 = __Block_byref_object_dispose__20;
  v16 = 0;
  +[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__GSAddition_FPVersions__fp_markResolvedWithError___block_invoke;
  v10[3] = &unk_1E444BE98;
  v10[4] = &v11;
  objc_msgSend(v5, "resolveConflictAtURL:completionHandler:", v7, v10);

  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v8 = v12[5] == 0;

  _Block_object_dispose(&v11, 8);
  return v8;
}

- (id)fp_lastEditorDeviceName
{
  void *v2;
  void *v3;

  if ((objc_msgSend(a1, "shouldBeForwardedToFileProvider") & 1) != 0)
  {
    objc_msgSend(a1, "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", fpVersionLastEditorDeviceNameKey);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "br_lastEditorDeviceName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)fp_lastEditorNameComponents
{
  void *v2;
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  if ((objc_msgSend(a1, "shouldBeForwardedToFileProvider") & 1) != 0)
  {
    objc_msgSend(a1, "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", fpVersionLastEditorNameComponentsKey);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v4 = (objc_class *)MEMORY[0x1E0CB3710];
      v5 = v3;
      v6 = (void *)objc_msgSend([v4 alloc], "initForReadingFromData:error:", v5, 0);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    objc_msgSend(a1, "br_lastEditorNameComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)fp_etag
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPFileVersion parseEtag:](FPFileVersion, "parseEtag:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)shouldBeForwardedToFileProvider
{
  OUTLINED_FUNCTION_37(&dword_1A0A34000, a1, a3, "[ERROR] Failed to dlopen CloudDocs Private Framework, process will most likely crash!", a5, a6, a7, a8, 0);
}

@end
