@implementation FPDMoveWriterToProvider

- (FPDMoveWriterToProvider)initWithWriter:(id)a3
{
  id v4;
  FPDMoveWriterToProvider *v5;
  FPDMoveWriterToProvider *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  FPActionLocatorAccess *stopAccessingToken;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FPDMoveWriterToProvider;
  v5 = -[FPDMoveWriterToProvider init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_writer, v4);
    objc_msgSend(v4, "info");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "targetFolder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startAccessingLocator");
    v9 = objc_claimAutoreleasedReturnValue();
    stopAccessingToken = v6->_stopAccessingToken;
    v6->_stopAccessingToken = (FPActionLocatorAccess *)v9;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[FPActionLocatorAccess stopAccessing](self->_stopAccessingToken, "stopAccessing");
  v3.receiver = self;
  v3.super_class = (Class)FPDMoveWriterToProvider;
  -[FPDMoveWriterToProvider dealloc](&v3, sel_dealloc);
}

- (id)_targetSession
{
  FPDMoveWriter **p_writer;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  p_writer = &self->_writer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  objc_msgSend(WeakRetained, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asFPItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained((id *)p_writer);
  objc_msgSend(v8, "operation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "manager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "providerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "providerWithIdentifier:reason:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domainIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "domainForIdentifier:reason:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "session");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_remoteProxy
{
  void *v2;
  void *v3;

  -[FPDMoveWriterToProvider _targetSession](self, "_targetSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newFileProviderProxyWithTimeout:pid:", 0, 180.0);

  return v3;
}

- (void)_createTargetItemWithProxy:(id)a3 target:(id)a4 contents:(id)a5 targetName:(id)a6 lastUsedDate:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;

  v41 = a3;
  v40 = a5;
  v38 = a8;
  self = (FPDMoveWriterToProvider *)((char *)self + 8);
  v36 = a7;
  v14 = a6;
  v15 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.isa);
  objc_msgSend(WeakRetained, "operation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "manager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "asFPItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "itemID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "domainFromItemID:reason:", v20, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc(MEMORY[0x1E0CAAC60]);
  objc_msgSend(v15, "asFPItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "providerDomainID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "asFPItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "itemIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v21, "initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:isDirectory:", v23, CFSTR("__"), v25, v14, 0);

  objc_msgSend(v26, "setLastUsedDate:", v36);
  v37 = objc_loadWeakRetained((id *)&self->super.isa);
  objc_msgSend(v37, "operation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "request");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "session");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "nsfpRequestForSession:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_loadWeakRetained((id *)&self->super.isa);
  objc_msgSend(v31, "info");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "shouldBounce");
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __112__FPDMoveWriterToProvider__createTargetItemWithProxy_target_contents_targetName_lastUsedDate_completionHandler___block_invoke;
  v42[3] = &unk_1E8C789F0;
  v43 = v38;
  v39 = v38;
  v34 = (id)objc_msgSend(v41, "createItemBasedOnTemplate:fields:contents:options:request:bounce:completionHandler:", v26, 14, v40, 0x10000, v30, v33, v42);

}

uint64_t __112__FPDMoveWriterToProvider__createTargetItemWithProxy_target_contents_targetName_lastUsedDate_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_importURL:(id)a3 source:(id)a4 target:(id)a5 as:(id)a6 lastUsedDate:(id)a7 initialImportFinished:(id)a8 progressAvailable:(id)a9 completion:(id)a10
{
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  BOOL v48;
  id v49;
  void *v50;
  char v51;
  char v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  int v57;
  int v58;
  id v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  FPDMoveWriter **location;
  id *locationa;
  void *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  FPDMoveWriterToProvider *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  _QWORD v90[5];
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  _QWORD v96[4];
  id v97;
  FPDMoveWriterToProvider *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  BOOL v105;
  id v106;
  id v107;
  uint8_t buf[4];
  void *v109;
  __int16 v110;
  void *v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v75 = a3;
  v78 = a4;
  v79 = a5;
  v69 = a6;
  v70 = a7;
  v71 = a8;
  v68 = a9;
  v72 = a10;
  -[FPDMoveWriterToProvider _remoteProxy](self, "_remoteProxy");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  location = &self->_writer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  objc_msgSend(WeakRetained, "operation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "manager");
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v77, "domainForActionOperationLocator:", v78);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "domainForActionOperationLocator:", v79);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "nsDomain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "personaIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "nsDomain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "personaIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "currentPersona");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  v107 = 0;
  objc_msgSend(v76, "userPersonaUniqueString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "nsDomain");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "personaIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24 == v26)
  {

LABEL_13:
    v67 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v18, "nsDomain", location);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "personaIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v24, "isEqualToString:", v28);

  if ((v29 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
    goto LABEL_13;
  v106 = 0;
  v30 = (void *)objc_msgSend(v76, "copyCurrentPersonaContextWithError:", &v106);
  v31 = v106;
  v32 = v107;
  v107 = v30;

  if (v31)
  {
    fp_current_or_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[FPDMoveWriterToProvider _importURL:source:target:as:lastUsedDate:initialImportFinished:progressAvailable:completion:].cold.1((uint64_t)v31, v33);

  }
  objc_msgSend(v18, "nsDomain");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "personaIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "generateAndRestorePersonaContextWithPersonaUniqueString:", v35);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v67)
    goto LABEL_13;
  fp_current_or_default_log();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v18, "nsDomain");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "personaIdentifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v109 = v64;
    v110 = 2112;
    v111 = v67;
    _os_log_error_impl(&dword_1CF55F000, v36, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

  }
LABEL_14:
  if ((objc_msgSend(v79, "requiresCrossDeviceCopy", location) & 1) != 0)
  {
    v37 = MEMORY[0x1E0C809B0];
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_3;
    v90[3] = &unk_1E8C78B08;
    v90[4] = self;
    v38 = v75;
    v91 = v38;
    v92 = v78;
    v39 = v73;
    v93 = v39;
    v40 = v72;
    v94 = v40;
    v95 = v68;
    v41 = (void *)MEMORY[0x1D17D1C84](v90);
    v80[0] = v37;
    v80[1] = 3221225472;
    v80[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_8;
    v80[3] = &unk_1E8C78BA8;
    v87 = v71;
    v42 = v38;
    v81 = v42;
    v82 = self;
    v88 = v40;
    v83 = v39;
    v84 = v79;
    v85 = v69;
    v86 = v70;
    v43 = v41;
    v89 = v43;
    v44 = (void *)MEMORY[0x1D17D1C84](v80);
    v45 = objc_msgSend(v42, "fp_isPackage");
    v46 = (void *)MEMORY[0x1E0C99E98];
    if (v45)
    {
      objc_msgSend(v42, "lastPathComponent");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "fp_createEmptyTempPackageWithName:completion:", v47, v44);
    }
    else
    {
      objc_msgSend(v42, "lastPathComponent");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "fp_createEmptyTempFileWithName:completion:", v47, v44);
    }

  }
  else
  {
    if ((objc_msgSend(v78, "requiresCrossDeviceCopy") & 1) != 0)
    {
      v48 = 1;
    }
    else
    {
      v49 = objc_loadWeakRetained(locationa);
      objc_msgSend(v49, "info");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "byCopy");
      if (v20 == v22)
        v52 = v51;
      else
        v52 = 1;
      if ((v52 & 1) != 0)
      {
        v48 = 1;
      }
      else
      {
        getpid();
        objc_msgSend(v75, "path");
        v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v53, "fileSystemRepresentation");
        v48 = fpfs_lp_sandbox_check() == 1;

      }
    }
    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke;
    v96[3] = &unk_1E8C78A40;
    v103 = v71;
    v54 = v75;
    v97 = v54;
    v98 = self;
    v104 = v72;
    v99 = v73;
    v100 = v79;
    v55 = v69;
    v101 = v55;
    v102 = v70;
    v105 = v48;
    v56 = (void *)MEMORY[0x1D17D1C84](v96);
    v57 = objc_msgSend(v78, "requiresCrossDeviceCopy");
    if (v20 == v22)
      v58 = v57;
    else
      v58 = 1;
    v59 = objc_loadWeakRetained(locationa);
    objc_msgSend(v59, "queue");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
      v61 = objc_msgSend(v78, "size");
    else
      v61 = 0;
    objc_msgSend(v54, "fp_copyToTempFolderWithFilename:queue:precomputedItemSize:completion:", v55, v60, v61, v56);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
      (*((void (**)(id, void *))v68 + 2))(v68, v62);

  }
  _FPRestorePersona();

}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id WeakRetained;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  _QWORD block[4];
  id v35;
  id v36;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  if (v7)
  {
    v33 = v9;
    objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:extensionClass:error:", v7, "com.apple.fileprovider.read-write", &v33);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v33;

    if (v10)
    {
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(a1 + 64);
      v15 = *(_QWORD *)(a1 + 72);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2;
      v24[3] = &unk_1E8C78A18;
      v16 = *(void **)(a1 + 32);
      v25 = *(id *)(a1 + 40);
      v26 = v16;
      v27 = v8;
      v29 = *(_BYTE *)(a1 + 96);
      v28 = *(id *)(a1 + 88);
      objc_msgSend(v25, "_createTargetItemWithProxy:target:contents:targetName:lastUsedDate:completionHandler:", v12, v13, v10, v14, v15, v24);

      v17 = v26;
    }
    else
    {
      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_cold_2();

      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
      objc_msgSend(WeakRetained, "queue");
      v23 = objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_10;
      v30[3] = &unk_1E8C76C10;
      v32 = *(id *)(a1 + 88);
      v11 = v11;
      v31 = v11;
      dispatch_async(v23, v30);

      v17 = v32;
    }

  }
  else
  {
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_cold_1();

    v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(v19, "queue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_6;
    block[3] = &unk_1E8C76C10;
    v36 = *(id *)(a1 + 88);
    v11 = v9;
    v35 = v11;
    dispatch_async(v20, block);

    v10 = v36;
  }

}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

{
  return objc_msgSend(*(id *)(a1 + 32), "_postImportStepForItem:sourceURL:targetURL:tempFolder:wasCopyRequested:error:completion:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postImportStepForItem:sourceURL:targetURL:tempFolder:wasCopyRequested:error:completion:", a2, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), a3, *(_QWORD *)(a1 + 56));
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a2, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "coordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startAccessingURLForAtomDuration:", v9);

  v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v12, "coordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 40);
  v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v15, "operation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "request");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_4;
  v21[3] = &unk_1E8C78AE0;
  v21[4] = *(_QWORD *)(a1 + 32);
  v22 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v24 = v7;
  v25 = *(id *)(a1 + 40);
  v26 = v9;
  v27 = v8;
  v28 = *(id *)(a1 + 64);
  v29 = *(id *)(a1 + 72);
  v18 = v8;
  v19 = v9;
  v20 = v7;
  objc_msgSend(v13, "coordinateForCopyingFromURL:toURL:request:handler:", v14, v19, v17, v21);

}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_4(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id *v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v8 = a5;
  v9 = (id *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = a3;
  v11 = a2;
  WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "queue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(*(id *)(a1 + 40), "size");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_5;
  v21[3] = &unk_1E8C78AB8;
  v28 = v8;
  v22 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v16 = *(_QWORD *)(a1 + 32);
  v23 = v15;
  v24 = v16;
  v25 = *(id *)(a1 + 64);
  v26 = *(id *)(a1 + 72);
  v27 = *(id *)(a1 + 80);
  v29 = *(id *)(a1 + 88);
  v17 = v8;
  objc_msgSend(v11, "fp_copyToURL:queue:precomputedItemSize:replacePlaceholder:completion:", v10, v13, v14, 1, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(_QWORD, void *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 96) + 16))(*(_QWORD *)(a1 + 96), v18, v19, v20);
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  id *v11;
  id *v12;
  id *v13;
  id v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v4 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "itemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "itemVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_6;
    v22[3] = &unk_1E8C78A68;
    v9 = *(void **)(a1 + 56);
    v22[4] = *(_QWORD *)(a1 + 48);
    v10 = &v23;
    v23 = v9;
    v11 = &v24;
    v24 = *(id *)(a1 + 64);
    v12 = &v25;
    v25 = *(id *)(a1 + 72);
    v13 = &v26;
    v26 = v4;
    v27 = *(id *)(a1 + 88);
    v14 = (id)objc_msgSend(v5, "deleteItemWithID:baseVersion:options:request:completionHandler:", v6, v7, 0, v8, v22);

  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_7;
    v17[3] = &unk_1E8C78A90;
    v15 = *(void **)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 64);
    v17[4] = *(_QWORD *)(a1 + 48);
    v10 = &v18;
    v18 = v15;
    v11 = &v19;
    v19 = *(id *)(a1 + 64);
    v12 = &v20;
    v20 = *(id *)(a1 + 72);
    v13 = &v21;
    v21 = *(id *)(a1 + 88);
    objc_msgSend(v5, "itemForURL:completionHandler:", v16, v17);
  }

}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postImportStepForItem:sourceURL:targetURL:tempFolder:wasCopyRequested:error:completion:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1, a3, *(_QWORD *)(a1 + 64));
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id WeakRetained;
  NSObject *v25;
  uint64_t v26;
  _QWORD v27[4];
  _QWORD v28[2];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD block[4];
  id v38;
  id v39;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  if (v7)
  {
    v36 = v9;
    objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:extensionClass:error:", v7, "com.apple.fileprovider.read-write", &v36);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v36;

    if (v10)
    {
      v12 = *(_QWORD *)(a1 + 56);
      v26 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 64);
      v14 = *(_QWORD *)(a1 + 72);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_20;
      v27[3] = &unk_1E8C78B80;
      v15 = (id *)v28;
      v16 = *(void **)(a1 + 40);
      v17 = *(id *)(a1 + 32);
      v18 = *(_QWORD *)(a1 + 40);
      v28[0] = v17;
      v28[1] = v18;
      v31 = *(id *)(a1 + 88);
      v29 = *(id *)(a1 + 48);
      v32 = *(id *)(a1 + 96);
      v30 = v8;
      objc_msgSend(v16, "_createTargetItemWithProxy:target:contents:targetName:lastUsedDate:completionHandler:", v26, v12, v10, v13, v14, v27);

      v19 = v31;
    }
    else
    {
      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_cold_2();

      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
      objc_msgSend(WeakRetained, "queue");
      v25 = objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_19;
      v33[3] = &unk_1E8C76C10;
      v15 = &v35;
      v35 = *(id *)(a1 + 88);
      v34 = v11;
      dispatch_async(v25, v33);

      v19 = v34;
    }

  }
  else
  {
    fp_current_or_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_8_cold_1();

    v21 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(v21, "queue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_18;
    block[3] = &unk_1E8C76C10;
    v39 = *(id *)(a1 + 88);
    v11 = v9;
    v38 = v11;
    dispatch_async(v22, block);

    v10 = v39;
  }

}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  id *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id WeakRetained;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 48);
    objc_msgSend(v5, "itemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_22;
    v16[3] = &unk_1E8C78B58;
    v9 = &v17;
    v17 = v5;
    v10 = (id *)v18;
    v11 = *(id *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v18[0] = v11;
    v18[1] = v12;
    v20 = *(id *)(a1 + 64);
    v21 = *(id *)(a1 + 72);
    v19 = *(id *)(a1 + 56);
    objc_msgSend(v7, "URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:", v8, 0, 0, v16);

  }
  else
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_20_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(WeakRetained, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_21;
    block[3] = &unk_1E8C76C10;
    v9 = &v24;
    v24 = *(id *)(a1 + 64);
    v10 = &v23;
    v23 = v6;
    dispatch_async(v15, block);

  }
}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_22(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  id *v10;
  id *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v6 = a2;
  v7 = a4;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_24;
    block[3] = &unk_1E8C78B30;
    v10 = &v23;
    v23 = *(id *)(a1 + 72);
    v11 = &v19;
    v19 = v6;
    v20 = *(id *)(a1 + 32);
    v21 = *(id *)(a1 + 56);
    v22 = v7;
    v12 = v7;
    dispatch_async(v9, block);

    v13 = v20;
  }
  else
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_22_cold_1();

    v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
    objc_msgSend(v13, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_23;
    v24[3] = &unk_1E8C76C10;
    v10 = &v26;
    v16 = *(id *)(a1 + 64);
    v11 = &v25;
    v25 = v7;
    v26 = v16;
    v17 = v7;
    dispatch_async(v15, v24);

  }
}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_24(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

- (void)_postImportStepForItem:(id)a3 sourceURL:(id)a4 targetURL:(id)a5 tempFolder:(id)a6 wasCopyRequested:(BOOL)a7 error:(id)a8 completion:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  FPDMoveWriter **p_writer;
  id WeakRetained;
  void *v24;
  int v25;
  void *v26;
  id *v27;
  id v28;
  id *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v42;
  void *v43;
  id v45;
  void *v46;
  _QWORD block[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  FPDMoveWriterToProvider *v54;
  id v55;
  BOOL v56;

  v14 = a3;
  v45 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  v19 = (void *)objc_opt_new();
  if (v17)
  {
    fp_current_or_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[FPDMoveWriterToProvider _postImportStepForItem:sourceURL:targetURL:tempFolder:wasCopyRequested:error:completion:].cold.1();

  }
  v21 = v15;
  if (v16)
    objc_msgSend(v19, "removeItemAtURL:error:", v16, 0);
  v46 = v19;
  v42 = v16;
  p_writer = &self->_writer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  objc_msgSend(WeakRetained, "info");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "byCopy");

  if (v25 && !a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPDMoveWriterToProvider.m"), 289, CFSTR("byCopy set but wasCopyRequested NO"));

  }
  v26 = v21;
  v43 = v14;
  if (!v14 || v17)
  {
    v34 = objc_loadWeakRetained((id *)&self->_writer);
    objc_msgSend(v34, "queue");
    v35 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke_2;
    block[3] = &unk_1E8C76C10;
    v27 = &v49;
    v49 = v18;
    v29 = &v48;
    v48 = v17;
    v36 = v18;
    dispatch_async(v35, block);

    v30 = v45;
    v37 = v42;
  }
  else
  {
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke;
    v50[3] = &unk_1E8C78BF8;
    v27 = &v51;
    v28 = v14;
    v51 = v28;
    v29 = &v52;
    v30 = v45;
    v52 = v45;
    v56 = a7;
    v53 = v46;
    v54 = self;
    v55 = v18;
    v31 = v18;
    v32 = MEMORY[0x1D17D1C84](v50);
    v33 = (void *)v32;
    if (v21)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v32 + 16))(v32, v21, 0);
    }
    else
    {
      v38 = objc_loadWeakRetained((id *)p_writer);
      objc_msgSend(v38, "coordinator");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "resolveItem:completion:", v28, v33);

      v26 = 0;
      v30 = v45;
    }
    v37 = v42;

    v34 = v53;
  }

}

void __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id WeakRetained;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  char v22;
  void *v23;
  void *v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  if (v6)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke_cold_2(a1 + 32, v6);
    v9 = v7;
    v7 = 0;
    goto LABEL_5;
  }
  v11 = *(_QWORD *)(a1 + 40);
  v30 = 0;
  objc_msgSend(v5, "fp_associateThumbnailFromDocumentAtURL:error:", v11, &v30);
  v10 = v30;
  if (v10)
  {
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fp_prettyDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = v5;
      v33 = 2112;
      v34 = v23;
      v35 = 2112;
      v36 = v24;
      _os_log_error_impl(&dword_1CF55F000, v12, OS_LOG_TYPE_ERROR, "[ERROR] couldn't generate thumbnail for %@ from %@; %@",
        buf,
        0x20u);

    }
  }
  if (!*(_BYTE *)(a1 + 72))
  {
    v21 = *(_QWORD *)(a1 + 40);
    v20 = *(void **)(a1 + 48);
    v29 = v10;
    v22 = objc_msgSend(v20, "removeItemAtURL:error:", v21, &v29);
    v9 = v29;

    if ((v22 & 1) != 0)
      goto LABEL_6;
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke_cold_1();
LABEL_5:

LABEL_6:
    v10 = v9;
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 56) + 8));
  objc_msgSend(WeakRetained, "coordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stopAccessingURL:", v5);

  v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 56) + 8));
  objc_msgSend(v15, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke_33;
  block[3] = &unk_1E8C78BD0;
  v17 = *(id *)(a1 + 64);
  v27 = v6;
  v28 = v17;
  v26 = v7;
  v18 = v6;
  v19 = v7;
  dispatch_async(v16, block);

}

void __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke_33(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  v2 = a1[6];
  objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForItem:", a1[4]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, a1[5]);

}

uint64_t __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)performCopyOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 completion:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id WeakRetained;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  objc_msgSend(WeakRetained, "coordinator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_loadWeakRetained((id *)&self->_writer);
  objc_msgSend(v18, "operation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "request");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __110__FPDMoveWriterToProvider_performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke;
  v25[3] = &unk_1E8C78C48;
  v25[4] = self;
  v26 = v12;
  v28 = v14;
  v29 = v15;
  v27 = v13;
  v21 = v14;
  v22 = v13;
  v23 = v15;
  v24 = v12;
  objc_msgSend(v17, "resolveItemOrURL:recursively:coordinateIfExport:request:handler:", v24, 1, 1, v20, v25);

}

void __110__FPDMoveWriterToProvider_performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (!v8)
  {
    v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v13, "info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "lastUsedDatePolicy");

    if (v15 == 1)
    {
      if (!objc_msgSend(*(id *)(a1 + 40), "isProviderItem"))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      objc_msgSend(*(id *)(a1 + 40), "asFPItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastUsedDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v15 == 2)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v18 = (void *)v16;
        goto LABEL_13;
      }
      v18 = 0;
    }
LABEL_13:
    v20 = *(void **)(a1 + 32);
    v19 = *(void **)(a1 + 40);
    v21 = *(_QWORD *)(a1 + 48);
    v22 = *(_QWORD *)(a1 + 56);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __110__FPDMoveWriterToProvider_performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_37;
    v23[3] = &unk_1E8C78C20;
    v23[4] = v20;
    v24 = v19;
    objc_msgSend(v20, "_importURL:source:target:as:lastUsedDate:initialImportFinished:progressAvailable:completion:", v7, v24, v21, v22, v18, v9, v23, *(_QWORD *)(a1 + 64));

    goto LABEL_14;
  }
  fp_current_or_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __110__FPDMoveWriterToProvider_performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_cold_1(a1, v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_14:

}

void __110__FPDMoveWriterToProvider_performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_37(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setProgress:forRoot:", v4, *(_QWORD *)(a1 + 40));

}

- (void)performMoveOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id WeakRetained;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  id v52;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (objc_msgSend(v14, "isProviderItem"))
  {
    objc_msgSend(v14, "asFPItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "strippedCopy");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "asFPItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "itemIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setParentItemIdentifier:", v21);

    objc_msgSend(v14, "asFPItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "filename");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", v16);

    if ((v24 & 1) != 0)
    {
      v25 = 4;
    }
    else
    {
      objc_msgSend(v19, "setFilename:", v16);
      v25 = 6;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
    objc_msgSend(WeakRetained, "info");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "lastUsedDatePolicy");

    if (v35 == 2)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setLastUsedDate:", v36);

      v25 |= 8uLL;
    }
    -[FPDMoveWriterToProvider _remoteProxy](self, "_remoteProxy", v25);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "synchronousRemoteObjectProxy");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v19;
    v39 = objc_loadWeakRetained((id *)&self->_writer);
    objc_msgSend(v39, "info");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "shouldBounce");
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke;
    v48[3] = &unk_1E8C78A90;
    v48[4] = self;
    v49 = v14;
    v50 = v15;
    v51 = v16;
    v52 = v17;
    v32 = v17;
    v29 = v15;
    v30 = v14;
    objc_msgSend(v37, "singleItemChange:changedFields:bounce:completionHandler:", v38, v42, v41, v48);

    v31 = v38;
  }
  else
  {
    v26 = objc_loadWeakRetained((id *)&self->_writer);
    objc_msgSend(v26, "coordinator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "asURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "startAccessingURLForAtomDuration:", v28);

    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2_41;
    v44[3] = &unk_1E8C78C98;
    v45 = v14;
    v46 = v15;
    v47 = v17;
    v29 = v17;
    v30 = v15;
    v31 = v14;
    -[FPDMoveWriterToProvider performCopyOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:completion:](self, "performCopyOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:completion:", v31, v30, v16, a6, a7, v44);

    v32 = v45;
  }

}

void __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2;
  block[3] = &unk_1E8C78C70;
  v13 = v6;
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v18 = v5;
  v19 = v9;
  v17 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  dispatch_async(v8, block);

}

void __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = (id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2_cold_2(a1, v2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 64) + 8));
    objc_msgSend(WeakRetained, "operation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "manager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 72), "itemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "domainFromItemID:reason:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2_cold_1((uint64_t *)(a1 + 72), v9);

    objc_msgSend(*(id *)(a1 + 72), "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_40;
    v11[3] = &unk_1E8C77C78;
    v12 = *(id *)(a1 + 72);
    v13 = *(id *)(a1 + 80);
    objc_msgSend(v8, "forceIngestionForItemID:completionHandler:", v10, v11);

  }
}

void __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "fp_isFeatureUnsupportedError"))
  {

    v6 = *(id *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = v6;
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      (*(void (**)(_QWORD, _QWORD, id))(v7 + 16))(*(_QWORD *)(a1 + 40), 0, v5);
      goto LABEL_9;
    }
    v8 = v10;
  }
  v9 = v8;
  v10 = v8;
  if (!v8)
    v9 = *(id *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForItem:", v9);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v5, 0);
LABEL_9:

}

void __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2_41(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (!v6
    && ((objc_msgSend(*(id *)(a1 + 32), "requiresCrossDeviceCopy") & 1) != 0
     || objc_msgSend(*(id *)(a1 + 40), "requiresCrossDeviceCopy")))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "asURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v9 = objc_msgSend(v7, "removeItemAtURL:error:", v8, &v12);
    v10 = v12;

    if ((v9 & 1) == 0)
    {
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2_41_cold_1(v10);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_createFolder:(id)a3 under:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id WeakRetained;
  void *v27;
  id v28;
  id v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;

  v8 = a3;
  v9 = a4;
  v28 = a5;
  v10 = objc_alloc(MEMORY[0x1E0CAAC60]);
  objc_msgSend(v9, "asFPItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "providerDomainID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "asFPItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "itemIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v10, "initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:isDirectory:", v12, CFSTR("__"), v14, v8, 1);

  -[FPDMoveWriterToProvider _remoteProxy](self, "_remoteProxy");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "synchronousRemoteObjectProxy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  objc_msgSend(WeakRetained, "operation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDMoveWriterToProvider _targetSession](self, "_targetSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "nsfpRequestForSession:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_loadWeakRetained((id *)&self->_writer);
  objc_msgSend(v19, "info");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "shouldBounce");
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __58__FPDMoveWriterToProvider__createFolder_under_completion___block_invoke;
  v31[3] = &unk_1E8C78CE8;
  v31[4] = self;
  v32 = v8;
  v33 = v9;
  v34 = v28;
  v29 = v28;
  v25 = v9;
  v22 = v8;
  v23 = (id)objc_msgSend(v24, "createItemBasedOnTemplate:fields:contents:options:request:bounce:completionHandler:", v27, 6, 0, 0x10000, v18, v21, v31);

}

void __58__FPDMoveWriterToProvider__createFolder_under_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v8 = a2;
  v9 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__FPDMoveWriterToProvider__createFolder_under_completion___block_invoke_2;
  block[3] = &unk_1E8C78CC0;
  v16 = v9;
  v17 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v19 = v8;
  v20 = v12;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, block);

}

void __58__FPDMoveWriterToProvider__createFolder_under_completion___block_invoke_2(_QWORD *a1)
{
  id *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  v2 = (id *)(a1 + 4);
  if (a1[4])
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __58__FPDMoveWriterToProvider__createFolder_under_completion___block_invoke_2_cold_1((uint64_t)a1, v2);

  }
  v4 = a1[8];
  objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForItem:", a1[7]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, a1[4]);

}

- (void)performCreateFolder:(id)a3 inside:(id)a4 as:(id)a5 completion:(id)a6
{
  -[FPDMoveWriterToProvider _createFolder:under:completion:](self, "_createFolder:under:completion:", a5, a4, a6);
}

- (void)performMoveOfFolder:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 atomically:(BOOL)a8 completion:(id)a9
{
  _BOOL4 v9;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;

  v9 = a8;
  v20 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a9;
  if ((objc_msgSend(v15, "isProviderItem") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ unexpected url"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[FPDFetchAppLibraryIconOperation _perAppBundleCompletion:iconData:contentType:error:].cold.1((uint64_t)v18, v19);

    __assert_rtn("-[FPDMoveWriterToProvider performMoveOfFolder:to:as:sourceMaterializeOption:targetMaterializeOption:atomically:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveWriterToProvider.m", 485, (const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"));
  }
  if (v9)
    -[FPDMoveWriterToProvider performMoveOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:completion:](self, "performMoveOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:completion:", v20, v15, v16, a6, a7, v17);
  else
    -[FPDMoveWriterToProvider _createFolder:under:completion:](self, "_createFolder:under:completion:", v16, v15, v17);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopAccessingToken, 0);
  objc_destroyWeak((id *)&self->_writer);
}

- (void)_importURL:(uint64_t)a1 source:(NSObject *)a2 target:as:lastUsedDate:initialImportFinished:progressAvailable:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_ERROR, "[ERROR] won't restore persona: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_8_0();
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_21();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v1), "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_6(), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v3, v4, "[DEBUG] couldn't copy import file for url %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_21();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v1), "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_6(), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v3, v4, "[DEBUG] couldn't issue sandbox ext for %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_8_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_21();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v1), "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_6(), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v3, v4, "[DEBUG] couldn't create import file for url %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_20_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_21();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v1), "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_6(), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v3, v4, "[DEBUG] couldn't import empty file for %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __119__FPDMoveWriterToProvider__importURL_source_target_as_lastUsedDate_initialImportFinished_progressAvailable_completion___block_invoke_2_22_cold_1()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  OUTLINED_FUNCTION_21();
  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(v2 + 32);
  objc_msgSend(*(id *)(v2 + 40), "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_6(), "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v1;
  v9 = 2112;
  v10 = v4;
  _os_log_debug_impl(&dword_1CF55F000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] couldn't get URL for item %@ while importing %@: %@", (uint8_t *)&v5, 0x20u);

  OUTLINED_FUNCTION_4_2();
}

- (void)_postImportStepForItem:sourceURL:targetURL:tempFolder:wasCopyRequested:error:completion:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_21();
  objc_msgSend(v1, "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_6(), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v3, v4, "[ERROR] couldn't import url %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke_cold_1()
{
  void *v0;
  id *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_21();
  objc_msgSend(*v1, "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_6(), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v3, v4, "[ERROR] Failed to remove original file %@ after move; %@",
    v5,
    v6,
    v7,
    v8,
    v9);

  OUTLINED_FUNCTION_2();
}

void __115__FPDMoveWriterToProvider__postImportStepForItem_sourceURL_targetURL_tempFolder_wasCopyRequested_error_completion___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v3, v4, "[ERROR] couldn't resolve URL for item %@ after copy; %@",
    v5,
    v6,
    v7,
    v8,
    v9);

  OUTLINED_FUNCTION_2();
}

void __110__FPDMoveWriterToProvider_performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v3, v4, "[ERROR] couldn't resolve %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] move-writer: forcing ingestion of %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_8_0();
}

void __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2_cold_2(uint64_t a1, id *a2)
{
  void *v2;
  void *v3;
  os_log_t v4;
  os_log_type_t v5;
  const char *v6;
  uint8_t *v7;

  objc_msgSend(*a2, "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0x2Au);

}

void __110__FPDMoveWriterToProvider_performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_completion___block_invoke_2_41_cold_1(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;
  void *v6;

  objc_msgSend(a1, "fp_prettyDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0xCu);

}

void __58__FPDMoveWriterToProvider__createFolder_under_completion___block_invoke_2_cold_1(uint64_t a1, id *a2)
{
  void *v2;
  void *v3;
  os_log_t v4;
  os_log_type_t v5;
  const char *v6;
  uint8_t *v7;

  objc_msgSend(*a2, "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0x20u);

  OUTLINED_FUNCTION_4_2();
}

@end
