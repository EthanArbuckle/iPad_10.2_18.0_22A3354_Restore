@implementation FPCKTask

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_0);
  return (id)sharedManager_sharedManager;
}

void __25__FPCKTask_sharedManager__block_invoke()
{
  FPCKTask *v0;
  void *v1;

  v0 = objc_alloc_init(FPCKTask);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (FPCKTask)init
{
  FPCKTask *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FPCKTask;
  v2 = -[FPCKTask init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("FPCKTask-queue", v3);
    workQueue = v2->workQueue;
    v2->workQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

+ (id)xpcServiceConnection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.FileProviderDaemon.FPCKService"));
  FPDFPCKServiceXPCInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  objc_msgSend(v2, "activate");
  return v2;
}

+ (id)xpcServiceProxyWithConnection:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD1988];
  v4 = a3;
  objc_msgSend(v3, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "processIdentifier");

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC83A8]), "initWithConnection:protocol:orError:name:requestPid:", v4, &unk_256A1B360, 0, CFSTR("FPCKServiceProxy"), v6);
  objc_msgSend(v7, "synchronousRemoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)runFPCKForDomain:(id)a3 domainUserInfo:(id)a4 domainRootURL:(id)a5 databaseBackupPath:(id)a6 urls:(id)a7 volumeRole:(unsigned int)a8 options:(unint64_t)a9 reason:(unint64_t)a10 fpfs:(BOOL)a11 iCDPackageDetection:(BOOL)a12 shouldPause:(id)a13 isInvalidated:(id)a14 completionHandler:(id)a15
{
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _TtC9libfssync4FPCK *v28;
  void *v29;
  void *v30;
  void *v31;
  _TtC9libfssync4FPCK *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  BOOL v38;
  void (**v40)(id, id, id, void *, id);
  _QWORD v41[4];
  id v42;
  id v43;
  void *v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v20 = a13;
  v38 = v20 != 0;
  if (v20)
    v21 = v20;
  else
    v21 = &__block_literal_global_25;
  v40 = (void (**)(id, id, id, void *, id))a15;
  v22 = a14;
  v23 = a7;
  v24 = a6;
  v25 = a5;
  v26 = a4;
  v27 = a3;
  v28 = [_TtC9libfssync4FPCK alloc];
  objc_msgSend(v25, "path");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = v29;
  objc_msgSend(v24, "path");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v45[0] = v30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v37) = v38;
  LOBYTE(v37) = a12;
  v32 = -[FPCK initWithDatabasesBackupsPaths:volumeRole:providerDomainID:domainUserInfo:reason:usingFPFS:iCDPackageDetection:useShouldPause:shouldPause:isInvalidated:](v28, "initWithDatabasesBackupsPaths:volumeRole:providerDomainID:domainUserInfo:reason:usingFPFS:iCDPackageDetection:useShouldPause:shouldPause:isInvalidated:", v31, a8, v27, v26, a10, a11, v37, v21, v22);

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __177__FPCKTask_runFPCKForDomain_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_options_reason_fpfs_iCDPackageDetection_shouldPause_isInvalidated_completionHandler___block_invoke_2;
  v41[3] = &unk_250BDBC80;
  v33 = v42;
  -[FPCK launchWithTelemetryFromURLs:options:error:resultHandler:](v32, "launchWithTelemetryFromURLs:options:error:resultHandler:", v23, a9, &v43, v41);

  v34 = v43;
  v35 = objc_alloc_init(MEMORY[0x24BDC8250]);
  objc_msgSend(v35, "setNumberOfFilesChecked:", -[FPCK numberOfFilesChecked](v32, "numberOfFilesChecked"));
  objc_msgSend(v35, "setNumberOfBrokenFilesInFSAndFSSnapshotCheck:", -[FPCK numberOfBrokenFilesInFSAndFSSnapshotCheck](v32, "numberOfBrokenFilesInFSAndFSSnapshotCheck"));
  objc_msgSend(v35, "setNumberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck:", -[FPCK numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck](v32, "numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck"));
  objc_msgSend(v35, "setNumberOfBrokenFilesInReconciliationTableCheck:", -[FPCK numberOfBrokenFilesInReconciliationTableCheck](v32, "numberOfBrokenFilesInReconciliationTableCheck"));
  objc_msgSend(v35, "setNumberOfBrokenFilesInBackupManifestCheck:", -[FPCK numberOfBrokenFilesInBackupManifestCheck](v32, "numberOfBrokenFilesInBackupManifestCheck"));
  -[FPCK telemetryReport](v32, "telemetryReport");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2](v40, v33, v35, v36, v34);

}

_TtC9libfssync19FPShouldPauseResult *__177__FPCKTask_runFPCKForDomain_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_options_reason_fpfs_iCDPackageDetection_shouldPause_isInvalidated_completionHandler___block_invoke()
{
  return -[FPShouldPauseResult initWithShouldPause:semaphore:]([_TtC9libfssync19FPShouldPauseResult alloc], "initWithShouldPause:semaphore:", 0, 0);
}

uint64_t __177__FPCKTask_runFPCKForDomain_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_options_reason_fpfs_iCDPackageDetection_shouldPause_isInvalidated_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

- (void)_prepareXPCService:(id)a3 domainUserInfo:(id)a4 domainRootURL:(id)a5 databaseBackupPath:(id)a6 urls:(id)a7 volumeRole:(unsigned int)a8 personaIdentifier:(id)a9 options:(unint64_t)a10 reason:(unint64_t)a11 fpfs:(BOOL)a12 iCDPackageDetection:(BOOL)a13 completionHandler:(id)a14
{
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  _QWORD v82[4];
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _QWORD v96[2];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v75 = a3;
  v76 = a4;
  v77 = a5;
  v79 = a6;
  v18 = a7;
  v78 = a9;
  v74 = a14;
  +[FPCKTask xpcServiceConnection](FPCKTask, "xpcServiceConnection");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPCKTask xpcServiceProxyWithConnection:](FPCKTask, "xpcServiceProxyWithConnection:");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v20 = v18;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
  if (v21)
  {
    v22 = v21;
    v23 = 0;
    v24 = *(_QWORD *)v93;
    while (2)
    {
      v25 = 0;
      v26 = v23;
      do
      {
        if (*(_QWORD *)v93 != v24)
          objc_enumerationMutation(v20);
        v27 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v25);
        v91 = v26;
        objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", v27, 0, &v91);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v91;

        if (!v28)
        {
          fp_current_or_default_log();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[FPCKTask _prepareXPCService:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:].cold.3(v27);

          v30 = v74;
          v31 = v80;
          v32 = v81;
          (*((void (**)(id, void *, void *, id))v74 + 2))(v74, v80, v81, v23);
          v33 = v20;
          v34 = v75;
          v35 = v76;
          v36 = v77;
          v37 = v79;
          goto LABEL_34;
        }
        objc_msgSend(v19, "addObject:", v28);

        ++v25;
        v26 = v23;
      }
      while (v22 != v25);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
      if (v22)
        continue;
      break;
    }
  }
  else
  {
    v23 = 0;
  }
  v38 = v23;

  v90 = v23;
  v36 = v77;
  objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", v77, 0, &v90);
  v39 = objc_claimAutoreleasedReturnValue();
  v23 = v90;

  v72 = (void *)v39;
  if (v39)
  {
    v89 = v23;
    v37 = v79;
    objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", v79, 0, &v89);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v89;

    if (!v40)
    {
      v30 = v74;
      (*((void (**)(id, void *, void *, id))v74 + 2))(v74, v80, v81, v41);
      v34 = v75;
      v35 = v76;
LABEL_32:

      v23 = v41;
      v31 = v80;
      v32 = v81;
      goto LABEL_33;
    }
    v42 = (void *)MEMORY[0x24BDC8310];
    objc_msgSend(v79, "URLByDeletingLastPathComponent");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v41;
    objc_msgSend(v42, "wrapperWithURL:readonly:error:", v43, 0, &v88);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = v88;

    v71 = (void *)v44;
    if (!v44)
    {
      v30 = v74;
      (*((void (**)(id, void *, void *, id))v74 + 2))(v74, v80, v81, v45);
      v34 = v75;
      v35 = v76;
      v37 = v79;
      v41 = v45;
LABEL_31:

      goto LABEL_32;
    }
    v70 = v45;
    objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "currentPersona");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "userPersonaUniqueString");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v76;
    v68 = v48;
    if (!v78 || v48 && (objc_msgSend(v48, "isEqualToString:", v78) & 1) != 0)
    {
      v67 = v47;
      objc_msgSend(MEMORY[0x24BDBCF48], "fp_supportDirectoryForVolume:", v77);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[InternalPathsManager purgatoryPrefix](_TtC9libfssync20InternalPathsManager, "purgatoryPrefix");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "URLByAppendingPathComponent:isDirectory:", v50, 1);
      v51 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v87 = 0;
      v54 = (void *)objc_msgSend(v47, "copyCurrentPersonaContextWithError:", &v87);
      v56 = v87;
      v37 = v79;
      if (v56)
      {
        v57 = v56;
        (*((void (**)(id, void *, void *, id))v74 + 2))(v74, v80, v81, v56);
        v69 = v57;
        v30 = v74;
        v34 = v75;
LABEL_30:

        v41 = v70;
        goto LABEL_31;
      }
      v69 = v54;
      objc_msgSend(v47, "generateAndRestorePersonaContextWithIdentityString:", v78);
      v58 = objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        v54 = (void *)v58;
        fp_current_or_default_log();
        v59 = objc_claimAutoreleasedReturnValue();
        v34 = v75;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          -[FPCKTask _prepareXPCService:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:].cold.2(v54);

        v30 = v74;
        (*((void (**)(id, void *, void *, void *))v74 + 2))(v74, v80, v81, v54);
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x24BDBCF48], "fp_supportDirectoryForVolume:", v77);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      +[InternalPathsManager purgatoryPrefix](_TtC9libfssync20InternalPathsManager, "purgatoryPrefix");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "URLByAppendingPathComponent:isDirectory:", v61, 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "restorePersonaWithSavedPersonaContext:", v54);
      v62 = objc_claimAutoreleasedReturnValue();
      if (v62)
      {
        v54 = (void *)v62;
        fp_current_or_default_log();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          -[FPCKTask _prepareXPCService:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:].cold.1(v54);

        (*((void (**)(id, void *, void *, void *))v74 + 2))(v74, v80, v81, v54);
        v30 = v74;
        v34 = v75;
        v37 = v79;
        goto LABEL_30;
      }
      v67 = v47;
      v49 = v54;
      v51 = (uint64_t)v66;
    }

    v86 = v70;
    v69 = (void *)v51;
    objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", v51, 0, &v86);
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = v86;

    v54 = (void *)v52;
    if (v52)
    {
      v70 = v53;
      v96[0] = v71;
      v96[1] = v52;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v96, 2);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = MEMORY[0x24BDAC760];
      v82[1] = 3221225472;
      v82[2] = __171__FPCKTask__prepareXPCService_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_personaIdentifier_options_reason_fpfs_iCDPackageDetection_completionHandler___block_invoke;
      v82[3] = &unk_250BDBCA8;
      v30 = v74;
      v85 = v74;
      v83 = v80;
      v84 = v81;
      LOWORD(v65) = __PAIR16__(a13, a12);
      v36 = v77;
      LODWORD(v64) = a8;
      v34 = v75;
      objc_msgSend(v83, "prepareFPCKForDomain:domainUserInfo:domainRootURL:databaseBackupPath:accessingPaths:urls:volumeRole:options:reason:fpfs:iCDPackageDetection:completionHandler:", v75, v76, v72, v40, v55, v19, v64, a10, a11, v65, v82);

    }
    else
    {
      v30 = v74;
      (*((void (**)(id, void *, void *, id))v74 + 2))(v74, v80, v81, v53);
      v70 = v53;
      v34 = v75;
    }
    v37 = v79;
    v47 = v67;
    goto LABEL_30;
  }
  v30 = v74;
  v31 = v80;
  v32 = v81;
  (*((void (**)(id, void *, void *, id))v74 + 2))(v74, v80, v81, v23);
  v34 = v75;
  v35 = v76;
  v37 = v79;
LABEL_33:
  v33 = v72;
LABEL_34:

}

uint64_t __171__FPCKTask__prepareXPCService_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_personaIdentifier_options_reason_fpfs_iCDPackageDetection_completionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

- (void)_launchXPCServiceWithPauseChecker:(id)a3 proxy:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(a4, "runFPCKWithPauseHandler:completionHandler:", a3, a5);
}

- (unint64_t)_resolveLaunchType:(unint64_t)a3
{
  unint64_t result;

  result = a3;
  if (a3 == 2)
    return FPIsFPCKXPCServiceEnabled();
  return result;
}

- (void)prepareFPCKRun:(id)a3 domainUserInfo:(id)a4 domainRootURL:(id)a5 databaseBackupPath:(id)a6 urls:(id)a7 volumeRole:(unsigned int)a8 personaIdentifier:(id)a9 options:(unint64_t)a10 reason:(unint64_t)a11 fpfs:(BOOL)a12 iCDPackageDetection:(BOOL)a13 launchType:(unint64_t)a14 runOnWorkQueue:(BOOL)a15 completionHandler:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  NSObject *workQueue;
  uint64_t v30;
  _QWORD block[5];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unsigned int v43;
  BOOL v44;
  BOOL v45;

  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = a7;
  v26 = a9;
  v27 = a16;
  v28 = -[FPCKTask _resolveLaunchType:](self, "_resolveLaunchType:", a14);
  if (a15)
  {
    workQueue = self->workQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __193__FPCKTask_prepareFPCKRun_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_personaIdentifier_options_reason_fpfs_iCDPackageDetection_launchType_runOnWorkQueue_completionHandler___block_invoke;
    block[3] = &unk_250BDBCD0;
    v40 = v28;
    v39 = v27;
    block[4] = self;
    v33 = v21;
    v34 = v22;
    v35 = v23;
    v36 = v24;
    v37 = v25;
    v43 = a8;
    v38 = v26;
    v41 = a10;
    v42 = a11;
    v44 = a12;
    v45 = a13;
    dispatch_async(workQueue, block);

  }
  else if (v28)
  {
    LOWORD(v30) = __PAIR16__(a13, a12);
    -[FPCKTask _prepareXPCService:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:](self, "_prepareXPCService:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:", v21, v22, v23, v24, v25, a8, v26, a10, a11, v30, v27);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v27 + 2))(v27, 0, 0, 0);
  }

}

uint64_t __193__FPCKTask_prepareFPCKRun_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_personaIdentifier_options_reason_fpfs_iCDPackageDetection_launchType_runOnWorkQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  if (!*(_QWORD *)(a1 + 96))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  LOWORD(v2) = *(_WORD *)(a1 + 124);
  return objc_msgSend(*(id *)(a1 + 32), "_prepareXPCService:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(unsigned int *)(a1 + 120), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), v2, *(_QWORD *)(a1 + 88));
}

- (void)scheduleFPCKRun:(id)a3 domainUserInfo:(id)a4 domainRootURL:(id)a5 databaseBackupPath:(id)a6 urls:(id)a7 volumeRole:(unsigned int)a8 options:(unint64_t)a9 reason:(unint64_t)a10 fpfs:(BOOL)a11 iCDPackageDetection:(BOOL)a12 launchType:(unint64_t)a13 pauseChecker:(id)a14 shouldPause:(id)a15 proxy:(id)a16 completionHandler:(id)a17
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  id v34;

  v34 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = a7;
  v26 = a14;
  v27 = a15;
  v28 = a16;
  v29 = a17;
  v30 = -[FPCKTask _resolveLaunchType:](self, "_resolveLaunchType:", a13);
  switch(v30)
  {
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v29 + 2))(v29, 0, 0, 0, v31);

      break;
    case 1uLL:
      -[FPCKTask _launchXPCServiceWithPauseChecker:proxy:completionHandler:](self, "_launchXPCServiceWithPauseChecker:proxy:completionHandler:", v26, v28, v29);
      break;
    case 0uLL:
      LOWORD(v32) = __PAIR16__(a12, a11);
      +[FPCKTask runFPCKForDomain:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:options:reason:fpfs:iCDPackageDetection:shouldPause:isInvalidated:completionHandler:](FPCKTask, "runFPCKForDomain:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:options:reason:fpfs:iCDPackageDetection:shouldPause:isInvalidated:completionHandler:", v34, v22, v23, v24, v25, a8, a9, a10, v32, v27, &__block_literal_global_40, v29);
      break;
  }

}

uint64_t __192__FPCKTask_scheduleFPCKRun_domainUserInfo_domainRootURL_databaseBackupPath_urls_volumeRole_options_reason_fpfs_iCDPackageDetection_launchType_pauseChecker_shouldPause_proxy_completionHandler___block_invoke()
{
  return 0;
}

- (void)dumpDatabaseAt:(id)a3 fullDump:(BOOL)a4 writeTo:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *workQueue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  workQueue = self->workQueue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __62__FPCKTask_dumpDatabaseAt_fullDump_writeTo_completionHandler___block_invoke;
  v17[3] = &unk_250BDBD38;
  v21 = a4;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(workQueue, v17);

}

void __62__FPCKTask_dumpDatabaseAt_fullDump_writeTo_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = 0;
  +[FPCK dumpDatabaseAt:fullDump:writeTo:error:](_TtC9libfssync4FPCK, "dumpDatabaseAt:fullDump:writeTo:error:", v3, v2, v4, &v6);
  v5 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (id)buildPauseResult:(BOOL)a3 semaphore:(id)a4
{
  _BOOL8 v4;
  id v5;
  _TtC9libfssync19FPShouldPauseResult *v6;

  v4 = a3;
  v5 = a4;
  v6 = -[FPShouldPauseResult initWithShouldPause:semaphore:]([_TtC9libfssync19FPShouldPauseResult alloc], "initWithShouldPause:semaphore:", v4, v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->workQueue, 0);
}

- (void)_prepareXPCService:(void *)a1 domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_23AA66000, v2, v3, "[ERROR] 🧹 FPCK error restoring persona during XPC Service preparation %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)_prepareXPCService:(void *)a1 domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_23AA66000, v2, v3, "[ERROR] 🧹 FPCK error adopting persona during XPC Service preparation %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)_prepareXPCService:(void *)a1 domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:completionHandler:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_23AA66000, v2, v3, "[ERROR] Unable to launch FPCK, unable to sandbox wrap URL: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end
