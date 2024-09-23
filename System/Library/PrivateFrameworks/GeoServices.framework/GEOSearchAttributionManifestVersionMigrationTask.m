@implementation GEOSearchAttributionManifestVersionMigrationTask

void __115___GEOSearchAttributionManifestVersionMigrationTask_initWithMigrator_newSearchAttributionManifestURL_oldTileGroup___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancel");

}

void __94___GEOSearchAttributionManifestVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke(id *a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  GEOSearchAttributionManifest *v16;
  _QWORD *v17;
  void *v18;
  GEOSearchAttributionManifest *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t BOOL;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _QWORD *v38;
  void *v39;
  _QWORD v40[5];
  uint8_t buf[16];

  v2 = objc_msgSend(a1[6], "copy");
  v3 = a1[4];
  v4 = (void *)v3[6];
  v3[6] = v2;

  objc_storeStrong((id *)a1[4] + 7, a1[5]);
  objc_msgSend(*((id *)a1[4] + 5), "urlInfoSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchAttributionManifestURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nsURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *((id *)a1[4] + 4);
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "isEqual:", v7))
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_INFO, "[SearchAttributionManifest] Search attribution manifest URL is unchanged.", buf, 2u);
      }

      +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 30);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 30);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v11);
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = -[GEOSearchAttributionManifest initWithData:]([GEOSearchAttributionManifest alloc], "initWithData:", v15);
          if (v16)
          {
            v17 = a1[4];
            v18 = (void *)v17[12];
            v17[12] = v16;
            v19 = v16;

            objc_msgSend(a1[4], "_completeWithError:", 0);
LABEL_21:

            goto LABEL_22;
          }
        }
      }
      else
      {
        GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "[SearchAttributionManifest] Search attribution manifest URL is unchanged, but file is gone!. Will re-download.", buf, 2u);
        }
      }

    }
    GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_INFO, "[SearchAttributionManifest] Updating search attribution manifest", buf, 2u);
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39E0]), "initWithURL:", v9);
    v22 = (void *)MEMORY[0x1E0CB39E0];
    +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isInternalInstall"))
      BOOL = GEOConfigGetBOOL(GeoServicesConfig_AllowNonEVCerts, (uint64_t)off_1EDF4CFE8);
    else
      BOOL = 0;

    objc_msgSend(v11, "URL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "host");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAllowsAnyHTTPSCertificate:forHost:", BOOL, v26);

    objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v15);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = a1[4];
    v29 = (void *)v28[9];
    v28[9] = v27;

    v30 = a1[4];
    v31 = (void *)v30[9];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __94___GEOSearchAttributionManifestVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_86;
    v40[3] = &unk_1E1C14C80;
    v40[4] = v30;
    objc_msgSend(v31, "dataTaskWithRequest:completionHandler:", v11, v40);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = a1[4];
    v34 = (void *)v33[10];
    v33[10] = v32;

    +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "requestCounterTicketForType:auditToken:traits:", 2, v36, 0);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = a1[4];
    v39 = (void *)v38[11];
    v38[11] = v37;

    objc_msgSend(*((id *)a1[4] + 11), "startingRequestWithTask:", *((_QWORD *)a1[4] + 10));
    objc_msgSend(*((id *)a1[4] + 10), "resume");
    goto LABEL_21;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_INFO, "[SearchAttributionManifest] No search attribution manifest URL. Done.", buf, 2u);
  }

  objc_msgSend(a1[4], "_completeWithError:", 0);
LABEL_22:

}

void __94___GEOSearchAttributionManifestVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_86(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 16);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __94___GEOSearchAttributionManifestVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_2;
  v15[3] = &unk_1E1C00898;
  v15[4] = v10;
  v16 = v8;
  v17 = v7;
  v18 = v9;
  v12 = v9;
  v13 = v7;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __94___GEOSearchAttributionManifestVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleResponse:withData:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __59___GEOSearchAttributionManifestVersionMigrationTask_cancel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "cancel");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "cancel");
}

uint64_t __72___GEOSearchAttributionManifestVersionMigrationTask__completeWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
