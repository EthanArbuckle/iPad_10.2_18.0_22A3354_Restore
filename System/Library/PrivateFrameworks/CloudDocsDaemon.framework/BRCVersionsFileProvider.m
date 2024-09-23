@implementation BRCVersionsFileProvider

- (BRCVersionsFileProvider)initWithVolume:(id)a3 personaIdentifier:(id)a4
{
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BRCVersionsFileProvider *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *operationsByName;
  objc_super v20;
  _QWORD v21[3];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(v8, "isIgnoringOwnership");
  v10 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v8, "mountPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v22[0] = v11;
    v22[1] = CFSTR(".DocumentRevisions-V100/AllUIDs");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPathComponents:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21[0] = v11;
    v21[1] = CFSTR(".DocumentRevisions-V100/PerUID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", getuid());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPathComponents:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v20.receiver = self;
  v20.super_class = (Class)BRCVersionsFileProvider;
  v16 = -[BRCFileProvider initWithURL:name:](&v20, sel_initWithURL_name_, v13, CFSTR("versions"));
  if (v16)
  {
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    operationsByName = v16->_operationsByName;
    v16->_operationsByName = v17;

    objc_storeStrong((id *)&v16->_personaIdentifier, a4);
  }

  return v16;
}

- (void)resume
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] FPFS flag disabled, bird will handle coordination on the Genstore for version download%@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)BRCVersionsFileProvider;
  -[BRCFileProvider resume](&v5, sel_resume);
}

- (void)dumpToContext:(id)a3
{
  id v4;
  BRCVersionsFileProvider *v5;
  NSMutableDictionary *operationsByName;
  id v7;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCVersionsFileProvider;
  -[BRCFileProvider dumpToContext:](&v10, sel_dumpToContext_, v4);
  v5 = self;
  objc_sync_enter(v5);
  if (-[NSMutableDictionary count](v5->_operationsByName, "count"))
  {
    objc_msgSend(v4, "writeLineWithFormat:", CFSTR("coordinated readers"));
    objc_msgSend(v4, "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
    operationsByName = v5->_operationsByName;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __41__BRCVersionsFileProvider_dumpToContext___block_invoke;
    v8[3] = &unk_1E8760160;
    v7 = v4;
    v9 = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](operationsByName, "enumerateKeysAndObjectsUsingBlock:", v8);
    objc_msgSend(v7, "writeLineWithFormat:", &stru_1E8769030);

  }
  objc_sync_exit(v5);

}

uint64_t __41__BRCVersionsFileProvider_dumpToContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("  + %@"), a2);
}

- (id)_fileReactorID
{
  return CFSTR("com.apple.bird.versions");
}

- (id)_physicalURLForURL:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  int v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  void *v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  BRCAccountSession *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  NSObject *v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  NSObject *v34;
  NSString *personaIdentifier;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  BRCAccountSession *v49;
  id v50;
  void *v51;
  _QWORD block[4];
  id v53;
  id v54;
  _BYTE *v55;
  uint64_t v56[3];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  _BYTE buf[24];
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSString isEqualToString:](self->_personaIdentifier, "isEqualToString:", CFSTR("__defaultPersonaID__"))
    || (v5 = self->_personaIdentifier) == 0)
  {
    if (_physicalURLForURL____personaOnceToken != -1)
      dispatch_once(&_physicalURLForURL____personaOnceToken, &__block_literal_global_35);
    v6 = (NSString *)(id)_physicalURLForURL____personalPersona;
    v7 = 1;
  }
  else
  {
    v6 = v5;
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPersona");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = 0;
  objc_msgSend(v51, "userPersonaUniqueString");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 == v6 || -[NSString isEqualToString:](v9, "isEqualToString:", v6))
  {
    v11 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v60 = 0;
    v28 = (void *)objc_msgSend(v51, "copyCurrentPersonaContextWithError:", &v60);
    v29 = v60;
    v30 = v61;
    v61 = v28;

    if (v29)
    {
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
        -[BRCVersionsFileProvider _physicalURLForURL:].cold.8();

    }
    objc_msgSend(v51, "generateAndRestorePersonaContextWithPersonaUniqueString:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      brc_bread_crumbs();
      v33 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
      {
        personaIdentifier = self->_personaIdentifier;
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = personaIdentifier;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2112;
        v63 = v33;
        _os_log_error_impl(&dword_1CBD43000, v34, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_50:

    }
  }
  else
  {
    if (v7 && (objc_msgSend(v51, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs();
      v33 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[_BRCOperation completedWithResult:error:].cold.3();
      v11 = 0;
      goto LABEL_50;
    }
    brc_bread_crumbs();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      -[_BRCOperation completedWithResult:error:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  v58 = 0;
  v59 = 0;
  objc_msgSend(v4, "pathComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  memset(v56, 0, sizeof(v56));
  __brc_create_section(0, (uint64_t)"-[BRCVersionsFileProvider _physicalURLForURL:]", 103, v56);
  brc_bread_crumbs();
  v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v40 = v11;
    v41 = v56[0];
    objc_msgSend(v4, "path");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v41;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v42;
    *(_WORD *)&buf[22] = 2112;
    v63 = v13;
    _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx physical URL request for '%@'%@", buf, 0x20u);

    v11 = v40;
  }

  if ((unint64_t)objc_msgSend(v12, "count") > 1)
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x1E0D25D00];
    if ((objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D25D00]) & 1) != 0)
    {
      if ((objc_msgSend(MEMORY[0x1E0D25D38], "brc_parseAdditionFilename:mangledID:itemID:etag:session:", v18, &v58, &v57, &v59, self->super._session) & 1) != 0)
      {
        v21 = self->super._session;
        v49 = v21;
        if (!v21)
        {
          brc_bread_crumbs();
          v43 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v44 = objc_claimAutoreleasedReturnValue();
          v50 = (id)v43;
          if (os_log_type_enabled(v44, (os_log_type_t)0x90u))
          {
            objc_msgSend(v4, "path");
            objc_claimAutoreleasedReturnValue();
            -[BRCVersionsFileProvider _physicalURLForURL:].cold.2();
          }

          v17 = 0;
          goto LABEL_59;
        }
        -[BRCAccountSession clientZoneByMangledID:](v21, "clientZoneByMangledID:", v58);
        v50 = (id)objc_claimAutoreleasedReturnValue();
        if (!v50)
        {
          brc_bread_crumbs();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, (os_log_type_t)0x90u))
          {
            objc_msgSend(v4, "path");
            objc_claimAutoreleasedReturnValue();
            -[BRCVersionsFileProvider _physicalURLForURL:].cold.3();
          }

          v17 = v4;
          goto LABEL_59;
        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v63 = __Block_byref_object_copy__32;
        v64 = __Block_byref_object_dispose__32;
        v65 = 0;
        -[BRCAccountSession clientDB](v49, "clientDB");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "serialQueue");
        v23 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __46__BRCVersionsFileProvider__physicalURLForURL___block_invoke_30;
        block[3] = &unk_1E87615A8;
        v50 = v50;
        v53 = v50;
        v54 = v57;
        v55 = buf;
        dispatch_sync(v23, block);

        v24 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (v24)
        {
          objc_msgSend(v24, "additionWithName:inNameSpace:error:", v18, v20, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
          {
            -[BRCAccountSession stageRegistry](v49, "stageRegistry");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "nonLocalFaultURLForAdditionName:", v18);
            v17 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_58;
          }
          brc_bread_crumbs();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            -[BRCVersionsFileProvider _physicalURLForURL:].cold.5();
        }
        else
        {
          brc_bread_crumbs();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
          {
            objc_msgSend(v4, "path");
            objc_claimAutoreleasedReturnValue();
            -[BRCVersionsFileProvider _physicalURLForURL:].cold.4();
          }
        }

        v17 = v4;
LABEL_58:

        _Block_object_dispose(buf, 8);
LABEL_59:

        goto LABEL_60;
      }
      brc_bread_crumbs();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "path");
        objc_claimAutoreleasedReturnValue();
        -[BRCVersionsFileProvider _physicalURLForURL:].cold.6();
      }
    }
    else
    {
      brc_bread_crumbs();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        -[BRCVersionsFileProvider _physicalURLForURL:].cold.7();
    }

    v17 = v4;
    goto LABEL_60;
  }
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    -[BRCVersionsFileProvider _physicalURLForURL:].cold.1();

  v17 = v4;
  v18 = 0;
  v19 = 0;
LABEL_60:
  __brc_leave_section(v56);

  _BRRestorePersona();
  return v17;
}

void __46__BRCVersionsFileProvider__physicalURLForURL___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_physicalURLForURL____personalPersona;
  _physicalURLForURL____personalPersona = v0;

}

void __46__BRCVersionsFileProvider__physicalURLForURL___block_invoke_30(uint64_t a1)
{
  BRCItemToPathLookup *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "itemByItemID:", *(_QWORD *)(a1 + 40));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v9);
  -[BRCItemToPathLookup byFileSystemID](v2, "byFileSystemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D25D48], "manager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "physicalURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "permanentStorageForItemAtURL:allocateIfNone:error:", v5, 0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  -[BRCItemToPathLookup closePaths](v2, "closePaths");

}

- (void)_provideItemAtURL:(id)a3 toReaderWithID:(id)a4 completionHandler:(id)a5
{
  void (**v8)(id, void *);
  NSString *v9;
  NSString *v10;
  int v11;
  void *v12;
  NSString *v13;
  NSString *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  BRCVersionsFileProvider *v25;
  uint64_t v26;
  BRCDownloadVersionsBatchOperation *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  BRCProgress *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  NSObject *v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  NSObject *v43;
  NSString *personaIdentifier;
  void *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  int v67;
  void *v68;
  NSObject *v69;
  id *v70;
  void *v71;
  NSObject *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *cf;
  id v83;
  void *v84;
  id *p_isa;
  void *v86;
  uint64_t v87;
  BRCAccountSession *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  _QWORD v95[5];
  id v96;
  id v97;
  id v98;
  _QWORD block[4];
  id v100;
  id v101;
  id v102;
  id v103;
  _BYTE *v104;
  uint64_t v105[3];
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  _QWORD v111[3];
  _QWORD v112[3];
  _BYTE v113[12];
  __int16 v114;
  void *v115;
  __int16 v116;
  void *v117;
  __int16 v118;
  void *v119;
  _BYTE buf[24];
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v93 = a3;
  v90 = a4;
  v8 = (void (**)(id, void *))a5;
  if (-[NSString isEqualToString:](self->_personaIdentifier, "isEqualToString:", CFSTR("__defaultPersonaID__"))
    || (v9 = self->_personaIdentifier) == 0)
  {
    if (_provideItemAtURL_toReaderWithID_completionHandler____personaOnceToken != -1)
      dispatch_once(&_provideItemAtURL_toReaderWithID_completionHandler____personaOnceToken, &__block_literal_global_33);
    v10 = (NSString *)(id)_provideItemAtURL_toReaderWithID_completionHandler____personalPersona;
    v11 = 1;
  }
  else
  {
    v10 = v9;
    v11 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentPersona");
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  v110 = 0;
  objc_msgSend(v94, "userPersonaUniqueString");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 == v10 || -[NSString isEqualToString:](v13, "isEqualToString:", v10))
    goto LABEL_9;
  if (voucher_process_can_use_arbitrary_personas())
  {
    v109 = 0;
    v37 = (void *)objc_msgSend(v94, "copyCurrentPersonaContextWithError:", &v109);
    v38 = v109;
    v39 = v110;
    v110 = v37;

    if (v38)
    {
      brc_bread_crumbs();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, (os_log_type_t)0x90u))
        -[BRCVersionsFileProvider _physicalURLForURL:].cold.8();

    }
    objc_msgSend(v94, "generateAndRestorePersonaContextWithPersonaUniqueString:", v10);
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v91)
    {
LABEL_9:
      v91 = 0;
      goto LABEL_10;
    }
    brc_bread_crumbs();
    v42 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, (os_log_type_t)0x90u))
    {
      personaIdentifier = self->_personaIdentifier;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = personaIdentifier;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v91;
      *(_WORD *)&buf[22] = 2112;
      v121 = v42;
      _os_log_error_impl(&dword_1CBD43000, v43, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
    }
    goto LABEL_51;
  }
  if (v11 && (objc_msgSend(v94, "isDataSeparatedPersona") & 1) == 0)
  {
    brc_bread_crumbs();
    v42 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      -[_BRCOperation completedWithResult:error:].cold.3();
    v91 = 0;
LABEL_51:

    goto LABEL_10;
  }
  brc_bread_crumbs();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    -[_BRCOperation completedWithResult:error:].cold.2();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v108 = 0;
  objc_msgSend(v93, "pathComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0;
  v107 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v121 = __Block_byref_object_copy__32;
  v122 = __Block_byref_object_dispose__32;
  v123 = 0;
  memset(v105, 0, sizeof(v105));
  __brc_create_section(0, (uint64_t)"-[BRCVersionsFileProvider _provideItemAtURL:toReaderWithID:completionHandler:]", 175, v105);
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v49 = v105[0];
    objc_msgSend(v93, "path");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCFileProvider prettyNameForFilePresenterID:](BRCFileProvider, "prettyNameForFilePresenterID:", v90);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v113 = 134218754;
    *(_QWORD *)&v113[4] = v49;
    v114 = 2112;
    v115 = v50;
    v116 = 2112;
    v117 = v51;
    v118 = 2112;
    v119 = v16;
    _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx coordinated read request for '%@' (%@)%@", v113, 0x2Au);

  }
  if ((unint64_t)objc_msgSend(v15, "count") > 1)
  {
    objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v15, "count") - 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v15, "count") - 1);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x1E0D25D00];
    if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D25D00]) & 1) != 0)
    {
      if ((objc_msgSend(MEMORY[0x1E0D25D38], "brc_parseAdditionFilename:mangledID:itemID:etag:session:", v92, &v107, &v106, &v108, self->super._session) & 1) != 0)
      {
        v88 = self->super._session;
        if (!v88)
        {
          brc_bread_crumbs();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, (os_log_type_t)0x90u))
          {
            +[BRCFileProvider prettyNameForFilePresenterID:](BRCFileProvider, "prettyNameForFilePresenterID:", v90);
            v73 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "path");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v113 = 138412802;
            *(_QWORD *)&v113[4] = v73;
            v114 = 2112;
            v115 = v74;
            v116 = 2112;
            v117 = v52;
            _os_log_error_impl(&dword_1CBD43000, v53, (os_log_type_t)0x90u, "[ERROR] Logged out: can't grant coordination to reader %@\nat path '%@'%@", v113, 0x20u);

          }
          +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
          v27 = (BRCDownloadVersionsBatchOperation *)objc_claimAutoreleasedReturnValue();
          -[BRCDownloadVersionsBatchOperation accountHandlerForCurrentPersona](v27, "accountHandlerForCurrentPersona");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "loggedOutError");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v30)
          {
            v54 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(v89, "loggedOutError");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "brc_errorLoggedOutWithUnderlyingError:", v55);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v8[2](v8, v30);
          goto LABEL_73;
        }
        v22 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "UUIDString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("dl-version-%@"), v24);
        v89 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = self;
        objc_sync_enter(v25);
        -[NSMutableDictionary objectForKeyedSubscript:](v25->_operationsByName, "objectForKeyedSubscript:", v92);
        v26 = objc_claimAutoreleasedReturnValue();
        objc_sync_exit(v25);
        p_isa = (id *)&v25->super.super.isa;

        v27 = (BRCDownloadVersionsBatchOperation *)v26;
        if (v26)
        {
          brc_bread_crumbs();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            -[BRCVersionsFileProvider _provideItemAtURL:toReaderWithID:completionHandler:].cold.5();

          v30 = 0;
          v31 = 0;
LABEL_23:
          -[BRCDownloadVersionsBatchOperation addReaderID:completionHandler:](v27, "addReaderID:completionHandler:", v90, v8);
          -[BRCAccountSession stageRegistry](self->super._session, "stageRegistry");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "associateDownloadStageID:withOperation:", v89, v27);

          if (v30)
          {
            v33 = *MEMORY[0x1E0CB30B8];
            v34 = *MEMORY[0x1E0CB30F0];
            v111[0] = *MEMORY[0x1E0CB30C8];
            v111[1] = v34;
            v112[0] = v33;
            v112[1] = v93;
            v111[2] = *MEMORY[0x1E0CB3108];
            v112[2] = v31;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 3);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = -[BRCProgress initWithParent:userInfo:]([BRCProgress alloc], "initWithParent:userInfo:", 0, v86);
            -[BRCProgress setTotalUnitCount:](v35, "setTotalUnitCount:", objc_msgSend(v30, "unsignedLongLongValue"));
            -[BRCProgress setKind:](v35, "setKind:", *MEMORY[0x1E0CB30F8]);
            -[BRCProgress setCancellable:](v35, "setCancellable:", 0);
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setProgress:", v35);
            -[BRCDownloadVersionsBatchOperation addDownload:](v27, "addDownload:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
            v95[0] = MEMORY[0x1E0C809B0];
            v95[1] = 3221225472;
            v95[2] = __78__BRCVersionsFileProvider__provideItemAtURL_toReaderWithID_completionHandler___block_invoke_50;
            v95[3] = &unk_1E8763CB8;
            v95[4] = p_isa;
            v96 = v92;
            v97 = v93;
            v36 = v31;
            v98 = v36;
            -[BRCDownloadVersionsBatchOperation setPerDownloadCompletionBlock:](v27, "setPerDownloadCompletionBlock:", v95);
            -[_BRCOperation schedule](v27, "schedule");

LABEL_71:
            v31 = v36;
          }
LABEL_72:

LABEL_73:
          goto LABEL_74;
        }
        -[BRCAccountSession clientZoneByMangledID:](v88, "clientZoneByMangledID:", v107);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v107, "isShared"))
        {
          objc_msgSend(v86, "serverZone");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "asSharedZone");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "transferSyncContext");
          v84 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          -[BRCAccountSession appLibraryByMangledID:](v88, "appLibraryByMangledID:", v107);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "transferSyncContext");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
        }

        if (!v84)
        {
          brc_bread_crumbs();
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, (os_log_type_t)0x90u))
          {
            v77 = v107;
            objc_msgSend(v93, "path");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v113 = 138412802;
            *(_QWORD *)&v113[4] = v77;
            v114 = 2112;
            v115 = v78;
            v116 = 2112;
            v117 = v71;
            _os_log_error_impl(&dword_1CBD43000, v72, (os_log_type_t)0x90u, "[ERROR] can't find sync context for mangled ID '%@', path '%@'%@", v113, 0x20u);

          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("container"), v93);
          v35 = (BRCProgress *)objc_claimAutoreleasedReturnValue();
          v8[2](v8, v35);
          v27 = 0;
          v30 = 0;
          v36 = 0;
          goto LABEL_71;
        }
        -[BRCAccountSession clientDB](v88, "clientDB");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "serialQueue");
        v59 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __78__BRCVersionsFileProvider__provideItemAtURL_toReaderWithID_completionHandler___block_invoke_42;
        block[3] = &unk_1E8763C90;
        v83 = v86;
        v100 = v83;
        v101 = v106;
        v104 = buf;
        v102 = v89;
        v103 = v108;
        dispatch_sync(v59, block);

        v60 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (!v60
          || (objc_msgSend(v60, "storage"),
              v61 = (void *)objc_claimAutoreleasedReturnValue(),
              v62 = v61 == 0,
              v61,
              v62))
        {
          brc_bread_crumbs();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, (os_log_type_t)0x90u))
          {
            objc_msgSend(v93, "path");
            objc_claimAutoreleasedReturnValue();
            -[BRCVersionsFileProvider _physicalURLForURL:].cold.4();
          }

          objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("item"), v93);
          v70 = (id *)objc_claimAutoreleasedReturnValue();
          v8[2](v8, v70);
          v27 = 0;
          v30 = 0;
          v87 = 0;
          v67 = 1;
          goto LABEL_65;
        }
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "storage");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "additionWithName:inNameSpace:error:", v92, v21, 0);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        if (v64)
        {
          brc_bread_crumbs();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
            -[BRCVersionsFileProvider _physicalURLForURL:].cold.5();

          v8[2](v8, 0);
          v27 = 0;
          v30 = 0;
          v87 = 0;
          v67 = 1;
LABEL_66:

          v31 = (void *)v87;
          if (v67)
            goto LABEL_72;
          goto LABEL_23;
        }
        v70 = p_isa;
        objc_sync_enter(v70);
        objc_msgSend(p_isa[7], "objectForKeyedSubscript:", v92);
        v27 = (BRCDownloadVersionsBatchOperation *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v30 = 0;
          v87 = 0;
        }
        else
        {
          *(_QWORD *)v113 = 0;
          -[BRCAccountSession stageRegistry](v88, "stageRegistry");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "nonLocalFaultURLForAdditionName:", v92);
          v87 = objc_claimAutoreleasedReturnValue();

          cf = (void *)_CFURLCopyPropertiesOfPromiseAtURL();
          if (!cf)
          {
            v79 = *(void **)v113;
            v8[2](v8, *(void **)v113);

            v27 = 0;
            v30 = 0;
            v67 = 1;
            goto LABEL_81;
          }
          v27 = -[BRCDownloadVersionsBatchOperation initWithSyncContext:forNonLocalVersion:]([BRCDownloadVersionsBatchOperation alloc], "initWithSyncContext:forNonLocalVersion:", v84, 1);
          objc_msgSend(MEMORY[0x1E0C94F88], "br_fetchNonLocalVersions");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          -[_BRCOperation setGroup:](v27, "setGroup:", v76);

          objc_msgSend(p_isa[7], "setObject:forKeyedSubscript:", v27, v92);
          objc_msgSend(cf, "objectForKey:", *MEMORY[0x1E0C99998]);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v30)
          {
            brc_bread_crumbs();
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v80 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
              -[BRCGlobalProgress _cancelUploadForObjectID:inState:willRetryTransfer:pendingQuota:].cold.3();

          }
          CFRelease(cf);
        }
        v67 = 0;
LABEL_81:
        objc_sync_exit(v70);
LABEL_65:

        goto LABEL_66;
      }
      brc_bread_crumbs();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v93, "path");
        objc_claimAutoreleasedReturnValue();
        -[BRCVersionsFileProvider _physicalURLForURL:].cold.6();
      }
    }
    else
    {
      brc_bread_crumbs();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        -[BRCVersionsFileProvider _physicalURLForURL:].cold.7();
    }

    v8[2](v8, 0);
    goto LABEL_74;
  }
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    -[BRCVersionsFileProvider _physicalURLForURL:].cold.1();

  v8[2](v8, 0);
  v92 = 0;
  v20 = 0;
LABEL_74:
  __brc_leave_section(v105);

  _Block_object_dispose(buf, 8);
  _BRRestorePersona();

}

void __78__BRCVersionsFileProvider__provideItemAtURL_toReaderWithID_completionHandler___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_provideItemAtURL_toReaderWithID_completionHandler____personalPersona;
  _provideItemAtURL_toReaderWithID_completionHandler____personalPersona = v0;

}

void __78__BRCVersionsFileProvider__provideItemAtURL_toReaderWithID_completionHandler___block_invoke_42(uint64_t a1)
{
  BRCDownloadVersion *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "itemByItemID:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isDocument"))
  {
    v2 = [BRCDownloadVersion alloc];
    objc_msgSend(v7, "asDocument");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[BRCDownloadVersion initWithDocument:stageID:etag:isLoser:](v2, "initWithDocument:stageID:etag:isLoser:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __78__BRCVersionsFileProvider__provideItemAtURL_toReaderWithID_completionHandler___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v7);

  if (v6)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      objc_msgSend(*(id *)(a1 + 48), "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v11;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v8;
      _os_log_error_impl(&dword_1CBD43000, v9, (os_log_type_t)0x90u, "[ERROR] failed downloading version to path '%@': %@%@", (uint8_t *)&v12, 0x20u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeItemAtURL:error:", *(_QWORD *)(a1 + 56), 0);

  }
}

- (void)_cancelProvidingItemAtURL:(id)a3 toReaderWithID:(id)a4
{
  id v6;
  BRCVersionsFileProvider *v7;
  NSMutableDictionary *operationsByName;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  operationsByName = v7->_operationsByName;
  objc_msgSend(v11, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](operationsByName, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v7);
  objc_msgSend(v10, "cancelReaderID:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_operationsByName, 0);
}

- (void)_physicalURLForURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: What's this path???%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_physicalURLForURL:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v6, v4, "[ERROR] Logged out: can't compute physical URL for '%@'%@", v5);

  OUTLINED_FUNCTION_20_0();
}

- (void)_physicalURLForURL:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v6, v4, "[ERROR] can't find container for path '%@'%@", v5);

  OUTLINED_FUNCTION_20_0();
}

- (void)_physicalURLForURL:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v6, v4, "[ERROR] can't find live item for path '%@'%@", v5);

  OUTLINED_FUNCTION_20_0();
}

- (void)_physicalURLForURL:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Version already local, we're good!%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_physicalURLForURL:.cold.6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v6, v4, "[DEBUG] can't parse version path '%@', probably not an iCloud version, allow it%@", v5);

  OUTLINED_FUNCTION_20_0();
}

- (void)_physicalURLForURL:.cold.7()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, (uint64_t)v0, "[DEBUG] Not in the %@ namespace, not for us%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_physicalURLForURL:.cold.8()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v0, (uint64_t)v0, "[ERROR] won't restore persona: %@%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_provideItemAtURL:toReaderWithID:completionHandler:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Found a download operation already pending, piggy back on it%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
