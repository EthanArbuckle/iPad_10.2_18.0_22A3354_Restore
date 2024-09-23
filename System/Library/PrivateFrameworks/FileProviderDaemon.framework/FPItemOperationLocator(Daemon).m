@implementation FPItemOperationLocator(Daemon)

- (id)startAccessingLocator
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a1, "asFPItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 && objc_msgSend(v2, "startAccessingSecurityScopedResource"))
  {
    v3 = (void *)MEMORY[0x1E0CAABE8];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__FPItemOperationLocator_Daemon__startAccessingLocator__block_invoke;
    v6[3] = &unk_1E8C75E48;
    v7 = v2;
    objc_msgSend(v3, "tokenWithBlock:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)annotateWithPersonaSandboxIfNeeded:()Daemon
{
  id v4;
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
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[5];
  NSObject *v41;
  _BYTE buf[12];
  __int16 v43;
  NSObject *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "asFPItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "asFPItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domainFromItemID:reason:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentPersona");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0;
    objc_msgSend(v11, "userPersonaUniqueString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nsDomain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "personaIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == v14)
    {

    }
    else
    {
      objc_msgSend(v9, "nsDomain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "personaIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v12, "isEqualToString:", v16);

      if ((v17 & 1) == 0 && voucher_process_can_use_arbitrary_personas())
      {
        v38 = 0;
        v18 = (void *)objc_msgSend(v11, "copyCurrentPersonaContextWithError:", &v38);
        v19 = v38;
        v20 = v39;
        v39 = v18;

        if (v19)
        {
          fp_current_or_default_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[FPItemOperationLocator(Daemon) annotateWithPersonaSandboxIfNeeded:].cold.2((uint64_t)v19, v21, v22);

        }
        objc_msgSend(v9, "nsDomain");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "personaIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "generateAndRestorePersonaContextWithPersonaUniqueString:", v24);
        v25 = objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          fp_current_or_default_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v9, "nsDomain");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "personaIdentifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v37;
            v43 = 2112;
            v44 = v25;
            _os_log_error_impl(&dword_1CF55F000, v26, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

          }
        }
        goto LABEL_19;
      }
    }
    v25 = 0;
LABEL_19:
    v33 = *MEMORY[0x1E0C80008];
    *(_QWORD *)buf = 0;
    v34 = v6;
    objc_msgSend(v34, "fp_issueSandboxExtensionOfClass:report:error:", v33, 0, buf);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CAACB8], "assembleURL:sandbox:physicalURL:physicalSandbox:", v34, v35, 0, 0);

    _FPRestorePersona();
    goto LABEL_20;
  }
  fp_current_or_default_log();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    -[FPItemOperationLocator(Daemon) annotateWithPersonaSandboxIfNeeded:].cold.1(a1, v27);

  if (v9)
  {
    v28 = dispatch_group_create();
    dispatch_group_enter(v28);
    objc_msgSend(v9, "defaultBackend");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "asFPItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "itemID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __69__FPItemOperationLocator_Daemon__annotateWithPersonaSandboxIfNeeded___block_invoke;
    v40[3] = &unk_1E8C782C0;
    v40[4] = a1;
    v41 = v28;
    v25 = v28;
    objc_msgSend(v29, "URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:forBookmarkResolution:request:completionHandler:", v31, 1, 1, 0, v32, v40);

    dispatch_group_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
LABEL_20:

  }
}

- (void)annotateWithPersonaSandboxIfNeeded:()Daemon .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "asFPItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, v4, "[ERROR] Copied item %@ unexpectedly doesn't have a URL, fetching one", (uint8_t *)&v5);

}

- (void)annotateWithPersonaSandboxIfNeeded:()Daemon .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, a3, "[ERROR] won't restore persona: %@", (uint8_t *)&v3);
}

@end
