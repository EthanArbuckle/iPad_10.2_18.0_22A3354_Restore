@implementation BRCDownloadVersion

- (int)kind
{
  return 2;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->super._progress, a3);
}

- (BRCProgress)progress
{
  return self->super._progress;
}

- (BRCDownloadVersion)initWithDocument:(id)a3 stageID:(id)a4 etag:(id)a5 isLoser:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  BRCDownloadVersion *v13;
  void *v14;
  char v15;
  uint64_t v16;
  CKRecordID *secondaryRecordID;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  BRCClientZone *clientZone;
  uint64_t v24;
  BRFileObjectID *fileObjectID;
  BRCItemToPathLookup *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  GSPermanentStorage *storage;
  int v33;
  void *v34;
  void *v36;
  NSObject *v37;
  id v38;
  objc_super v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isFinderBookmark"))
  {
    brc_bread_crumbs();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      -[BRCDownloadVersion initWithDocument:stageID:etag:isLoser:].cold.1();

  }
  v39.receiver = self;
  v39.super_class = (Class)BRCDownloadVersion;
  v13 = -[BRCDownload initWithDocument:stageID:](&v39, sel_initWithDocument_stageID_, v10, v11);
  if (v13)
  {
    objc_msgSend(v10, "clientZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isSharedZone");

    if ((v15 & 1) == 0)
    {
      objc_msgSend(v10, "structureRecordID");
      v16 = objc_claimAutoreleasedReturnValue();
      secondaryRecordID = v13->_secondaryRecordID;
      v13->_secondaryRecordID = (CKRecordID *)v16;

    }
    objc_msgSend(v10, "currentVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "size");
    objc_msgSend(v10, "currentVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13->super._totalSize = objc_msgSend(v20, "thumbnailSize") + v19;

    v13->_isLoser = a6;
    objc_storeStrong((id *)&v13->super._etag, a5);
    objc_msgSend(v10, "serverZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_sharedZone = objc_msgSend(v21, "isSharedZone");

    objc_msgSend(v10, "clientZone");
    v22 = objc_claimAutoreleasedReturnValue();
    clientZone = v13->_clientZone;
    v13->_clientZone = (BRCClientZone *)v22;

    objc_msgSend(v10, "fileObjectID");
    v24 = objc_claimAutoreleasedReturnValue();
    fileObjectID = v13->_fileObjectID;
    v13->_fileObjectID = (BRFileObjectID *)v24;

    v26 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v10);
    -[BRCItemToPathLookup byFileSystemID](v26, "byFileSystemID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0D25D48], "manager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "physicalURL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      objc_msgSend(v28, "permanentStorageForItemAtURL:allocateIfNone:error:", v29, 0, &v38);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v38;
      storage = v13->_storage;
      v13->_storage = (GSPermanentStorage *)v30;

      if (v13->_storage)
        goto LABEL_15;
      if (v31)
      {
        v33 = 0;
        v34 = v31;
        goto LABEL_13;
      }
    }
    else if (v13->_storage)
    {
      v31 = 0;
LABEL_15:
      -[BRCItemToPathLookup closePaths](v26, "closePaths");

      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v33 = 1;
LABEL_13:
    objc_storeStrong((id *)&v13->_gsError, v34);
    if (v33)

    goto LABEL_15;
  }
LABEL_16:

  return v13;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<dl-version[%lld] %@_%@>"), self->super._throttleID, self->super._itemID, self->super._etag);
}

- (id)_stageContentWithSession:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  CKRecord **p_record;
  void *v10;
  CKRecord *record;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BRCPackageManifestReader *v17;
  BRCPackageManifestWriter *v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id *v27;
  id v28;
  void *v29;
  char v30;
  void *v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  char *v45;
  uint64_t v46;
  id *v47;
  void *v48;
  void *v49;
  id v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "stageRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createURLForDownloadWithStageID:name:", self->super._stageID, CFSTR("item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  p_record = &self->super._record;
  -[CKRecord objectForKeyedSubscript:](self->super._record, "objectForKeyedSubscript:", CFSTR("pkgSignature"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  record = self->super._record;
  if (!v10)
  {
    -[CKRecord objectForKeyedSubscript:](record, "objectForKeyedSubscript:", CFSTR("fileContent"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v23, "fileURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "fileURL");
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = a4;
        v28 = v6;
        v29 = (void *)v26;
        v30 = objc_msgSend(v25, "moveItemAtURL:toURL:error:", v26, v8, v27);

        v6 = v28;
        if ((v30 & 1) != 0)
          goto LABEL_4;
LABEL_27:
        v22 = 0;
        goto LABEL_28;
      }
      v38 = v6;
      brc_bread_crumbs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        -[CKRecord debugDescription](*p_record, "debugDescription");
        v45 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v52 = (const char *)v23;
        v53 = 2112;
        v54 = v45;
        v55 = 2112;
        v56 = v39;
        _os_log_fault_impl(&dword_1CBD43000, v40, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: no fileURL for %@ in %@%@", buf, 0x20u);

      }
      v41 = (void *)MEMORY[0x1E0CB35C8];
      v42 = *MEMORY[0x1E0D10C90];
      -[CKRecord debugDescription](*p_record, "debugDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "br_errorWithDomain:code:description:", v42, 15, CFSTR("unreachable: no fileURL for %@ in %@"), v23, v43);
      v33 = (id)objc_claimAutoreleasedReturnValue();

      v6 = v38;
      if (!v33)
      {
LABEL_24:
        if (a4)
        {
          v33 = objc_retainAutorelease(v33);
          *a4 = v33;
        }

        goto LABEL_27;
      }
      v34 = v8;
      brc_bread_crumbs();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v36, (os_log_type_t)0x90u))
      {
LABEL_23:

        v8 = v34;
        goto LABEL_24;
      }
      v37 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v52 = "-[BRCDownloadVersion _stageContentWithSession:error:]";
      v53 = 2080;
      if (!a4)
        v37 = "(ignored by caller)";
    }
    else
    {
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        -[BRCDownloadVersion _stageContentWithSession:error:].cold.1(&self->super._record);

      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: There should be a file content property in %@"), *p_record);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      if (!v33)
        goto LABEL_24;
      v34 = v8;
      brc_bread_crumbs();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v36, (os_log_type_t)0x90u))
        goto LABEL_23;
      v37 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v52 = "-[BRCDownloadVersion _stageContentWithSession:error:]";
      v53 = 2080;
      if (!a4)
        v37 = "(ignored by caller)";
    }
    v54 = v37;
    v55 = 2112;
    v56 = v33;
    v57 = 2112;
    v58 = v35;
    _os_log_error_impl(&dword_1CBD43000, v36, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_23;
  }
  v47 = a4;
  -[CKRecord objectForKeyedSubscript:](record, "objectForKeyedSubscript:", CFSTR("pkgManifest"));
  v12 = objc_claimAutoreleasedReturnValue();
  -[CKRecord objectForKeyedSubscript:](*p_record, "objectForKeyedSubscript:", CFSTR("pkgContent"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecord objectForKeyedSubscript:](*p_record, "objectForKeyedSubscript:", CFSTR("pkgXattrs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v7;
  objc_msgSend(v7, "createURLForDownloadWithStageID:name:", self->super._stageID, CFSTR("brpackage-extended"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v6;
  v16 = !-[CKRecord brc_currentUserOwnsLastEditorDeviceWithSessionContext:](*p_record, "brc_currentUserOwnsLastEditorDeviceWithSessionContext:", v6);
  v48 = (void *)v12;
  v17 = -[BRCPackageManifestReader initWithAsset:]([BRCPackageManifestReader alloc], "initWithAsset:", v12);
  v18 = -[BRCPackageManifestWriter initWithZone:stageID:url:]([BRCPackageManifestWriter alloc], "initWithZone:stageID:url:", self->_clientZone, self->super._stageID, v15);
  -[BRCDownload recordID](self, "recordID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "recordName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v46) = v16;
  v21 = -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:](v18, "stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:", v17, v13, v14, v8, 0xFFFFFFFFLL, v20, v46);

  if (v21)
  {

    v7 = v49;
    v6 = v50;
LABEL_4:
    v22 = v8;
    goto LABEL_28;
  }
  if (v47)
  {
    -[BRCPackageManifestWriter error](v18, "error");
    *v47 = (id)objc_claimAutoreleasedReturnValue();
  }

  v22 = 0;
  v7 = v49;
  v6 = v50;
LABEL_28:

  return v22;
}

- (id)_stageWithSession:(id)a3 creationInfo:(id *)a4 error:(id *)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  CKRecord *v11;
  CKRecord *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  CKRecord *v24;
  id v25;
  CKRecord *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  id v49;
  void *v50;
  NSObject *v51;
  void *v52;
  int v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  BRCItemID *itemID;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id v66;
  void *v67;
  void *v68;
  int64_t throttleID;
  void *v71;
  void *v72;
  const char *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  NSObject *v78;
  uint64_t v79;
  unint64_t v80;
  void *v81;
  uint64_t v82;
  _QWORD v85[4];
  id v86;
  BRCDownloadVersion *v87;
  uint64_t *v88;
  uint64_t *v89;
  _BYTE *v90;
  int v91;
  _QWORD block[4];
  CKRecord *v93;
  BRCDownloadVersion *v94;
  id v95;
  CKRecord *v96;
  uint64_t *v97;
  uint64_t *v98;
  uint64_t *v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  char v110;
  uint64_t v111[3];
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  uint64_t v124;
  void *v125;
  _BYTE buf[32];
  _BYTE v127[20];
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  objc_msgSend(v6, "serverDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v10);

  v11 = self->_secondaryRecord;
  v12 = self->super._record;
  v118 = 0;
  v119 = &v118;
  v120 = 0x3032000000;
  v121 = __Block_byref_object_copy__34;
  v122 = __Block_byref_object_dispose__34;
  v123 = 0;
  v112 = 0;
  v113 = &v112;
  v114 = 0x3032000000;
  v115 = __Block_byref_object_copy__34;
  v116 = __Block_byref_object_dispose__34;
  v117 = 0;
  memset(v111, 0, sizeof(v111));
  __brc_create_section(0, (uint64_t)"-[BRCDownloadVersion _stageWithSession:creationInfo:error:]", 247, v111);
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    throttleID = self->super._throttleID;
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = v111[0];
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = throttleID;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = self;
    *(_WORD *)v127 = 2112;
    *(_QWORD *)&v127[2] = v13;
    _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Downloader[%lld] staging %@%@", buf, 0x2Au);
  }

  if (!v12)
  {
    brc_bread_crumbs();
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
      -[BRCDownloadVersion _stageWithSession:creationInfo:error:].cold.4();

  }
  -[CKRecord recordID](v12, "recordID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "zoneID");
  v16 = objc_claimAutoreleasedReturnValue();
  -[NSObject ownerName](v16, "ownerName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0C94730]))
  {
    v18 = self->_secondaryRecord == 0;

    if (!v18)
      goto LABEL_10;
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCDownloadVersion _stageWithSession:creationInfo:error:].cold.3();
  }
  else
  {

  }
LABEL_10:
  -[CKRecord etag](v12, "etag");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", self->super._etag);

  if ((v20 & 1) == 0)
  {
    brc_bread_crumbs();
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
      -[BRCDownloadVersion _stageWithSession:creationInfo:error:].cold.2();

  }
  v107 = 0;
  v108 = &v107;
  v109 = 0x2020000000;
  v110 = 1;
  v101 = 0;
  v102 = &v101;
  v103 = 0x3032000000;
  v104 = __Block_byref_object_copy__34;
  v105 = __Block_byref_object_dispose__34;
  v106 = 0;
  objc_msgSend(v6, "serverDB");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "serialQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__BRCDownloadVersion__stageWithSession_creationInfo_error___block_invoke;
  block[3] = &unk_1E8763F00;
  v24 = v11;
  v97 = &v112;
  v93 = v24;
  v94 = self;
  v25 = v6;
  v95 = v25;
  v98 = &v101;
  v99 = &v107;
  v26 = v12;
  v96 = v26;
  v100 = &v118;
  dispatch_sync(v22, block);

  if (!*((_BYTE *)v108 + 24))
  {
    v49 = (id)v102[5];
    if (v49)
    {
      brc_bread_crumbs();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, (os_log_type_t)0x90u))
      {
        v73 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[BRCDownloadVersion _stageWithSession:creationInfo:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a5)
          v73 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v73;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v49;
        *(_WORD *)v127 = 2112;
        *(_QWORD *)&v127[2] = v50;
        _os_log_error_impl(&dword_1CBD43000, v51, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v49);

    goto LABEL_30;
  }
  brc_bread_crumbs();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    v79 = v113[5];
    v82 = v119[5];
    -[CKRecord debugDescription](v24, "debugDescription");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecord debugDescription](v26, "debugDescription");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v79;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v82;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v71;
    *(_WORD *)v127 = 2112;
    *(_QWORD *)&v127[2] = v72;
    *(_WORD *)&v127[10] = 2112;
    *(_QWORD *)&v127[12] = v27;
    _os_log_debug_impl(&dword_1CBD43000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] received version %@ %@\n%@\n%@%@", buf, 0x34u);

  }
  -[BRCDownloadVersion _stageContentWithSession:error:](self, "_stageContentWithSession:error:", v25, a5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
LABEL_30:
    v30 = 0;
    v52 = 0;
    goto LABEL_49;
  }
  v30 = objc_retainAutorelease(v29);
  v31 = (const char *)objc_msgSend(v30, "fileSystemRepresentation");
  v37 = BRCOpenAt(0xFFFFFFFFLL, v31, 33028, v32, v33, v34, v35, v36, v79);
  if (v37 < 0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v53 = *__error();
    brc_bread_crumbs();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, (os_log_type_t)0x90u))
    {
      objc_msgSend(v30, "path");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v74;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v53;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v54;
      _os_log_error_impl(&dword_1CBD43000, v55, (os_log_type_t)0x90u, "[ERROR] Can't open %@ to set metadata %{errno}d%@", buf, 0x1Cu);

    }
    v52 = 0;
    *__error() = v53;
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__34;
    *(_QWORD *)v127 = __Block_byref_object_dispose__34;
    *(_QWORD *)&v127[8] = 0;
    objc_msgSend(v25, "clientDB");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "serialQueue");
    v39 = objc_claimAutoreleasedReturnValue();
    v85[0] = v23;
    v85[1] = 3221225472;
    v85[2] = __59__BRCDownloadVersion__stageWithSession_creationInfo_error___block_invoke_66;
    v85[3] = &unk_1E8763F28;
    v40 = v25;
    v91 = v37;
    v86 = v40;
    v87 = self;
    v88 = &v112;
    v89 = &v118;
    v90 = buf;
    dispatch_sync(v39, v85);

    close(v37);
    -[CKRecord objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", CFSTR("thumb1024"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v81, "fileURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41 == 0;

      if (!v42)
      {
        v43 = (void *)MEMORY[0x1E0CD32B0];
        v124 = *MEMORY[0x1E0C998A8];
        objc_msgSend(v81, "fileURL");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKRecord objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", CFSTR("thumbQLMetadata"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v43) = objc_msgSend(v43, "associateThumbnailImagesDictionary:serializedQuickLookMetadata:withImmutableDocument:atURL:error:", v45, v46, 1, v30, a5);

        if ((v43 & 1) == 0)
        {
          brc_bread_crumbs();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, (os_log_type_t)0x90u))
            -[BRCDownloadVersion _stageWithSession:creationInfo:error:].cold.1();

        }
      }
    }
    if (-[CKRecord brc_currentUserOwnsLastEditorDeviceWithSessionContext:](self->super._record, "brc_currentUserOwnsLastEditorDeviceWithSessionContext:", v40))
    {
      -[CKRecord brc_lastEditorDeviceName](self->super._record, "brc_lastEditorDeviceName");
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "nameComponents", objc_claimAutoreleasedReturnValue());
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "nameComponents", 0);
    }
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)v119[5];
    itemID = self->super._itemID;
    -[CKRecord recordID](self->super._record, "recordID");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "zoneID");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "additionNameForItemID:zoneID:", itemID, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
    objc_msgSend((id)v119[5], "originalPOSIXName");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKeyedSubscript:", v63, *MEMORY[0x1E0D25CF0]);

    objc_msgSend((id)v119[5], "displayNameWithoutExtension:", objc_msgSend((id)v113[5], "isHiddenExt"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKeyedSubscript:", v64, *MEMORY[0x1E0D25CC0]);

    objc_msgSend(v62, "setObject:forKeyedSubscript:", v61, *MEMORY[0x1E0D25CD0]);
    objc_msgSend(v62, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D25CC8]);
    objc_msgSend(v62, "setObject:forKeyedSubscript:", &unk_1E87D7400, *MEMORY[0x1E0D25CE0]);
    v65 = *MEMORY[0x1E0D25CD8];
    if (self->_isLoser)
    {
      objc_msgSend(v62, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D25D30], v65);
    }
    else
    {
      objc_msgSend(v62, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D25D00], v65);
      objc_msgSend(v62, "setObject:forKeyedSubscript:", &unk_1E87D7418, *MEMORY[0x1E0D25CE8]);
    }
    if (v80 | v56)
    {
      v66 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v67 = v66;
      if (v80)
        objc_msgSend(v66, "setObject:forKeyedSubscript:", v80, *MEMORY[0x1E0D10B78]);
      if (v56)
      {
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v56, 1, 0);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "setObject:forKeyedSubscript:", v68, *MEMORY[0x1E0D10B80]);

      }
      objc_msgSend(v62, "setObject:forKeyedSubscript:", v67, *MEMORY[0x1E0D25CF8]);

    }
    if (a4)
      objc_storeStrong(a4, v62);
    -[GSPermanentStorage prepareAdditionCreationWithItemAtURL:byMoving:creationInfo:error:](self->_storage, "prepareAdditionCreationWithItemAtURL:byMoving:creationInfo:error:", v30, 1, v62, a5);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(buf, 8);
  }
LABEL_49:

  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v107, 8);
  __brc_leave_section(v111);

  _Block_object_dispose(&v112, 8);
  _Block_object_dispose(&v118, 8);

  return v52;
}

void __59__BRCDownloadVersion__stageWithSession_creationInfo_error___block_invoke(_QWORD *a1)
{
  void *v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  void *v14;
  int v15;
  id *v16;
  id *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id *v24;
  void *v25;
  char v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  id obj;

  v3 = (id *)(a1 + 4);
  v2 = (void *)a1[4];
  if (v2)
  {
    v4 = *(_QWORD *)(a1[8] + 8) + 40;
    v5 = a1[6];
    v6 = *(_QWORD *)(a1[5] + 32);
    v7 = *(_QWORD *)(a1[9] + 8);
    obj = *(id *)(v7 + 40);
    v8 = objc_msgSend(v2, "deserializeStatInfo:serverMetrics:itemID:session:error:", v4, 0, v6, v5, &obj);
    objc_storeStrong((id *)(v7 + 40), obj);
    if ((v8 & 1) == 0)
    {
      brc_bread_crumbs();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
        __59__BRCDownloadVersion__stageWithSession_creationInfo_error___block_invoke_cold_1(v3);
      goto LABEL_14;
    }
    v10 = (id *)(a1 + 7);
    v9 = (void *)a1[7];
    v11 = a1[4];
    v12 = *(_QWORD *)(a1[11] + 8);
    v14 = *(void **)(v12 + 40);
    v13 = (id *)(v12 + 40);
    v31 = v14;
    if (v11)
    {
      v15 = 0;
      v16 = 0;
      v17 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    v10 = (id *)(a1 + 7);
    v9 = (void *)a1[7];
    v18 = *(_QWORD *)(a1[11] + 8);
    v19 = *(void **)(v18 + 40);
    v13 = (id *)(v18 + 40);
    v31 = v19;
  }
  v20 = *(_QWORD *)(a1[8] + 8);
  v21 = *(void **)(v20 + 40);
  v17 = (id *)(v20 + 40);
  v30 = v21;
  v16 = &v30;
  v15 = 1;
LABEL_7:
  v22 = *(_QWORD *)(a1[5] + 112);
  v23 = *(_QWORD *)(a1[9] + 8);
  v25 = *(void **)(v23 + 40);
  v24 = (id *)(v23 + 40);
  v29 = v25;
  v26 = objc_msgSend(v9, "deserializeVersion:fakeStatInfo:contentBoundaryKey:clientZone:error:", &v31, v16, 0, v22, &v29);
  objc_storeStrong(v13, v31);
  if (v15)
    objc_storeStrong(v17, v30);
  objc_storeStrong(v24, v29);
  if ((v26 & 1) == 0)
  {
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
      __59__BRCDownloadVersion__stageWithSession_creationInfo_error___block_invoke_cold_1(v10);
LABEL_14:

    *(_BYTE *)(*(_QWORD *)(a1[10] + 8) + 24) = 0;
  }
}

void __59__BRCDownloadVersion__stageWithSession_creationInfo_error___block_invoke_66(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "stageRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:", *(unsigned int *)(a1 + 72), 0xFFFFFFFFLL, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0);

  v3 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "lastModifiedUserRecordID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userIdentityForName:db:", v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)secondaryRecordID
{
  return self->_secondaryRecordID;
}

- (id)secondaryRecord
{
  return self->_secondaryRecord;
}

- (void)setSecondaryRecord:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryRecord, a3);
}

- (BOOL)isLoser
{
  return self->_isLoser;
}

- (GSPermanentStorage)storage
{
  return self->_storage;
}

- (NSError)gsError
{
  return self->_gsError;
}

- (BRFileObjectID)fileObjectID
{
  return self->_fileObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileObjectID, 0);
  objc_storeStrong((id *)&self->_gsError, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_secondaryRecord, 0);
  objc_storeStrong((id *)&self->_secondaryRecordID, 0);
}

- (void)initWithDocument:stageID:etag:isLoser:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !item.isFinderBookmark%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_stageContentWithSession:(_QWORD *)a1 error:.cold.1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v1, v2, "[CRIT] UNREACHABLE: There should be a file content property in %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_stageWithSession:creationInfo:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to attach thumbnail to version%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_stageWithSession:creationInfo:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [vRecord.etag isEqualToString:_etag]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_stageWithSession:creationInfo:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: ![vRecord.recordID.zoneID.ownerName isEqualToString:CKCurrentUserDefaultName] || _secondaryRecord%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_stageWithSession:creationInfo:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: vRecord%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __59__BRCDownloadVersion__stageWithSession_creationInfo_error___block_invoke_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(&dword_1CBD43000, v2, v3, "[ERROR] Can't deserialize %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

@end
