@implementation BRCDownloadContent

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->super._progress, a3);
}

- (id)etagIfLoser
{
  if (self->_isLoser)
    return self->super._etag;
  else
    return 0;
}

- (int)kind
{
  return self->_kind;
}

- (BRCDownloadContent)initWithDocument:(id)a3 stageID:(id)a4 etagIfLoser:(id)a5 downloadKind:(int)a6
{
  id v10;
  NSString *v11;
  BRCDownloadContent *v12;
  uint64_t v13;
  BRCServerZone *zone;
  void *v15;
  NSString *etag;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  BOOL v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSIndexSet *desiredIndices;
  NSIndexSet *v37;
  NSIndexSet *v38;
  objc_super v40;

  v10 = a3;
  v11 = (NSString *)a5;
  v40.receiver = self;
  v40.super_class = (Class)BRCDownloadContent;
  v12 = -[BRCDownload initWithDocument:stageID:](&v40, sel_initWithDocument_stageID_, v10, a4);
  if (v12)
  {
    objc_msgSend(v10, "serverZone");
    v13 = objc_claimAutoreleasedReturnValue();
    zone = v12->_zone;
    v12->_zone = (BRCServerZone *)v13;

    objc_msgSend(v10, "desiredVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12->super._totalSize = objc_msgSend(v15, "size");

    v12->_isFinderBookmark = objc_msgSend(v10, "isFinderBookmark");
    etag = v11;
    if (!v11)
      etag = v12->super._etag;
    objc_storeStrong((id *)&v12->super._etag, etag);
    v12->_isLoser = v11 != 0;
    v12->_kind = a6;
    objc_msgSend(v10, "currentVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "db");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastEditorUserIdentityWithDB:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      v12->_isDocumentModifiedByOtherUser = 1;
    objc_msgSend(v10, "st");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fileID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "st");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "documentID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v12->_liveFileID = objc_msgSend(v21, "unsignedLongLongValue");
    v12->_liveDocumentID = objc_msgSend(v23, "unsignedIntValue");
    if (objc_msgSend(v10, "isFault"))
    {
      v12->_liveItemIsPackage = 0;
    }
    else
    {
      objc_msgSend(v10, "currentVersion");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isPackage");
      if (v21)
        v26 = v25;
      else
        v26 = 0;
      if (!v23)
        v26 = 0;
      v12->_liveItemIsPackage = v26;

      if (v12->_liveItemIsPackage)
      {
        objc_msgSend(v10, "desiredVersion");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isPackage");

        if (v28)
        {
          objc_msgSend(v10, "serverZone");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "session");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "stageRegistry");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "createURLForDownloadWithStageID:name:", v12->super._stageID, CFSTR("brpackage-dlspec"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v33, 0);
            objc_msgSend(v34, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
            v35 = objc_claimAutoreleasedReturnValue();
            desiredIndices = v12->_desiredIndices;
            v12->_desiredIndices = (NSIndexSet *)v35;

          }
          if (!v12->_desiredIndices)
          {
            v37 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E0CB36B8]);
            v38 = v12->_desiredIndices;
            v12->_desiredIndices = v37;

            v12->_requiresTwoPhase = 1;
          }

        }
      }
    }

  }
  return v12;
}

- (id)description
{
  const char *v2;

  if (self->_isLoser)
    v2 = "loser";
  else
    v2 = "current";
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<dl-content[%lld] %@_%@ %s>"), self->super._throttleID, self->super._itemID, self->super._etag, v2);
}

- (BOOL)_prepareSecondStageWithSession:(id)a3 manifest:(id)a4 package:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  BRCPackageManifestReader *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t liveDocumentID;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  const char *v57;
  void *v58;
  id v59;
  uint64_t v60;
  id v61;
  id v62;
  void *v63;
  unint64_t v65;
  BRCPackageManifestReader *obj;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72[3];
  id v73;
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  unint64_t v77;
  __int16 v78;
  unint64_t v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v61 = a3;
  v59 = a4;
  v8 = a5;
  v62 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v63 = v8;
  v73 = 0;
  v65 = objc_msgSend(v8, "itemCountWithError:", &v73);
  v9 = v73;
  v10 = v73;
  v58 = v10;
  if (!v65 && v10)
  {
    objc_storeStrong(a6, v9);
    v11 = 0;
    goto LABEL_51;
  }
  memset(v72, 0, sizeof(v72));
  __brc_create_section(0, (uint64_t)"-[BRCDownloadContent _prepareSecondStageWithSession:manifest:package:error:]", 321, v72);
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[BRCDownloadContent _prepareSecondStageWithSession:manifest:package:error:].cold.2();

  v14 = -[BRCPackageManifestReader initWithAsset:]([BRCPackageManifestReader alloc], "initWithAsset:", v59);
  -[BRCPackageManifestReader setItemClass:](v14, "setItemClass:", objc_opt_class());
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v14;
  v15 = -[BRCPackageManifestReader countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
  if (v15)
  {
    v16 = 0;
    v17 = *(_QWORD *)v69;
    v60 = *MEMORY[0x1E0D10C90];
    if (a6)
      v18 = "(passed to caller)";
    else
      v18 = "(ignored by caller)";
    v57 = v18;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v69 != v17)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x1D17A6BE8]();
        if (objc_msgSend(v20, "type") == 4)
        {
LABEL_15:
          ++v16;
LABEL_22:
          v28 = 5;
          goto LABEL_23;
        }
        if (objc_msgSend(v20, "type") != 2)
          goto LABEL_22;
        if (v16 >= v65)
        {
          brc_bread_crumbs();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
          {
            -[BRCDownload itemID](self, "itemID");
            v40 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v75 = v40;
            v76 = 2048;
            v77 = v16;
            v78 = 2048;
            v79 = v65;
            v80 = 2112;
            v81 = v63;
            v82 = 2112;
            v83 = v29;
            _os_log_fault_impl(&dword_1CBD43000, v30, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Package inside %@ is corrupted in the cloud\nAsking for asset index out of bounds %lu vs %lu in package: %@%@", buf, 0x34u);

          }
          v31 = (void *)MEMORY[0x1E0CB35C8];
          -[BRCDownload itemID](self, "itemID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "br_errorWithDomain:code:description:", v60, 15, CFSTR("unreachable: Package inside %@ is corrupted in the cloud\nAsking for asset index out of bounds %lu vs %lu in package: %@"), v32, v16, v65, v63);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            brc_bread_crumbs();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 136315906;
              v75 = "-[BRCDownloadContent _prepareSecondStageWithSession:manifest:package:error:]";
              v76 = 2080;
              v77 = (unint64_t)v57;
              v78 = 2112;
              v79 = (unint64_t)v33;
              v80 = 2112;
              v81 = v34;
              _os_log_error_impl(&dword_1CBD43000, v35, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }

          }
          if (a6)
            objc_storeStrong(a6, v33);

          if (-[BRCServerZone isPrivateZone](self->_zone, "isPrivateZone"))
          {
            -[BRCServerZone clientZone](self->_zone, "clientZone");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "asPrivateClientZone");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[BRCDownload recordID](self, "recordID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "recordName");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "reportProblemWithType:recordName:", 9, v39);

          }
          v28 = 1;
        }
        else
        {
          if (self->_liveItemIsPackage)
          {
            if (self->_liveDocumentID)
            {
              objc_msgSend(v63, "itemAtIndex:", v16);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "clientDB");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              liveDocumentID = self->_liveDocumentID;
              objc_msgSend(v20, "path");
              v25 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "signature");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (void *)objc_msgSend(v23, "numberWithSQL:", CFSTR("SELECT 1 FROM client_pkg_items WHERE item_doc_id = %u AND rel_path = %@ AND signature_or_link = %@"), liveDocumentID, v25, v26);

              LOBYTE(v25) = objc_msgSend(v27, "BOOLValue");
              if ((v25 & 1) != 0)
                goto LABEL_15;
            }
          }
          objc_msgSend(v62, "addIndex:", v16);
          v28 = 0;
          ++v16;
        }
LABEL_23:
        objc_autoreleasePoolPop(v21);
        if (v28 != 5 && v28)
        {
          v11 = 0;
          v43 = obj;
          goto LABEL_49;
        }
        ++v19;
      }
      while (v15 != v19);
      v41 = -[BRCPackageManifestReader countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
      v15 = v41;
    }
    while (v41);
  }

  -[BRCPackageManifestReader error](obj, "error");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v61, "stageRegistry");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "createURLForDownloadWithStageID:name:", self->super._stageID, CFSTR("brpackage-dlspec"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v62, 1, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v45, "writeToURL:atomically:", v43, 1) & 1) == 0)
    {
      brc_bread_crumbs();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        -[BRCDownloadContent _prepareSecondStageWithSession:manifest:package:error:].cold.1((uint64_t)v46, v47, v48, v49, v50, v51, v52, v53);

    }
    brc_bread_crumbs();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v75 = (const char *)v62;
      v76 = 2048;
      v77 = v65;
      v78 = 2112;
      v79 = (unint64_t)v54;
      _os_log_debug_impl(&dword_1CBD43000, v55, OS_LOG_TYPE_DEBUG, "[DEBUG] Desired indices are: %@ (itemCount: %ld)%@", buf, 0x20u);
    }

    v11 = 1;
LABEL_49:

  }
  __brc_leave_section(v72);
LABEL_51:

  return v11;
}

- (BOOL)_stageWithSession:(id)a3 manifest:(id)a4 package:(id)a5 xattrsPackage:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BRCPackageManifestReader *v17;
  void *v18;
  NSObject *v19;
  BOOL v20;
  BRCPackageManifestWriter *v21;
  BRCPackageManifestWriter *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  BRCPackageManifestReader *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  BRCPackageManifestReader *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v41 = a5;
  v40 = a6;
  objc_msgSend(v11, "stageRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createURLForDownloadWithStageID:name:", self->super._stageID, CFSTR("item"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createURLForDownloadWithStageID:name:", self->super._stageID, CFSTR("brpackage-extended"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_liveItemIsPackage || !self->_liveFileID)
  {
    v16 = 0xFFFFFFFFLL;
    goto LABEL_10;
  }
  objc_msgSend(v11, "volume");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = BRCOpenByID(objc_msgSend(v15, "deviceID"), self->_liveFileID, 33028);

  if ((v16 & 0x80000000) == 0)
  {
LABEL_10:
    v17 = -[BRCPackageManifestReader initWithAsset:]([BRCPackageManifestReader alloc], "initWithAsset:", v12);
    v22 = [BRCPackageManifestWriter alloc];
    -[BRCServerZone clientZone](self->_zone, "clientZone");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[BRCPackageManifestWriter initWithZone:stageID:url:](v22, "initWithZone:stageID:url:", v23, self->super._stageID, v14);

    -[BRCDownload recordID](self, "recordID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "recordName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v37) = self->_isDocumentModifiedByOtherUser;
    v26 = -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:](v21, "stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:", v17, v41, v40, v39, v16, v25, v37);

    if (!v26)
    {
      -[BRCPackageManifestWriter error](v21, "error");
      v27 = (BRCPackageManifestReader *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        brc_bread_crumbs();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v35 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v43 = "-[BRCDownloadContent _stageWithSession:manifest:package:xattrsPackage:error:]";
          v44 = 2080;
          if (!a7)
            v35 = "(ignored by caller)";
          v45 = v35;
          v46 = 2112;
          v47 = v27;
          v48 = 2112;
          v49 = v28;
          _os_log_debug_impl(&dword_1CBD43000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a7)
        objc_storeStrong(a7, v27);

    }
    if ((v16 & 0x80000000) == 0)
      close(v16);
    objc_msgSend(v12, "fileURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fileURL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "removeItemAtURL:error:", v32, 0);

    }
    -[BRCPackageManifestWriter error](v21, "error");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v33 == 0;

    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", *__error());
  v17 = (BRCPackageManifestReader *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v36 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v43 = "-[BRCDownloadContent _stageWithSession:manifest:package:xattrsPackage:error:]";
      v44 = 2080;
      if (!a7)
        v36 = "(ignored by caller)";
      v45 = v36;
      v46 = 2112;
      v47 = v17;
      v48 = 2112;
      v49 = v18;
      _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (!a7)
  {
    v20 = 0;
    goto LABEL_23;
  }
  v17 = v17;
  v20 = 0;
  v21 = (BRCPackageManifestWriter *)*a7;
  *a7 = v17;
LABEL_22:

LABEL_23:
  return v20;
}

- (BOOL)_stageWithSession:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  CKRecord **p_record;
  __CFString **v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  BOOL v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  id v32;
  BOOL v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  const char *v39;
  char isKindOfClass;
  BOOL v41;
  void *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  const char *v46;
  char *v47;
  const char *v48;
  void *v49;
  NSObject *v50;
  id v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "stageRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  p_record = &self->super._record;
  if (self->_isFinderBookmark)
    v9 = kBRRecordKeyFinderBookmarkContent;
  else
    v9 = kBRRecordKeyFileContent;
  -[CKRecord objectForKeyedSubscript:](self->super._record, "objectForKeyedSubscript:", *v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (id)v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        -[BRCDownloadContent _stageWithSession:error:].cold.6();

      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: file content is not a CKAsset: %@"), *p_record);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        brc_bread_crumbs();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
        {
          v46 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v54 = "-[BRCDownloadContent _stageWithSession:error:]";
          v55 = 2080;
          if (!a4)
            v46 = "(ignored by caller)";
          v56 = v46;
          v57 = 2112;
          v58 = v12;
          v59 = 2112;
          v60 = v28;
          _os_log_error_impl(&dword_1CBD43000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a4)
        objc_storeStrong(a4, v12);
      goto LABEL_87;
    }
    objc_msgSend(v7, "createURLForDownloadWithStageID:name:", self->super._stageID, CFSTR("item"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      v14 = v12 == 0;
    else
      v14 = 1;
    if (v14)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v11, "fileURL");
        v47 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v54 = v47;
        v55 = 2112;
        v56 = (const char *)v12;
        v57 = 2112;
        v58 = v15;
        _os_log_fault_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: asset has a missing url (%@), or we can't compute the stage url %@%@", buf, 0x20u);

      }
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0D10C90];
      objc_msgSend(v11, "fileURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "br_errorWithDomain:code:description:", v18, 15, CFSTR("unreachable: asset has a missing url (%@), or we can't compute the stage url %@"), v19, v12);
      v32 = (id)objc_claimAutoreleasedReturnValue();

      if (!v32)
        goto LABEL_34;
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
      {
        v20 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v54 = "-[BRCDownloadContent _stageWithSession:error:]";
        v55 = 2080;
        if (!a4)
          v20 = "(ignored by caller)";
        v56 = v20;
        v57 = 2112;
        v58 = v32;
        v59 = 2112;
        v60 = v30;
        _os_log_error_impl(&dword_1CBD43000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fileURL");
      v31 = objc_claimAutoreleasedReturnValue();
      v52 = 0;
      objc_msgSend(v30, "br_forceMoveItemAtURL:toURL:error:", v31, v12, &v52);
      v32 = v52;
    }

LABEL_34:
    if (a4)
      objc_storeStrong(a4, v32);
LABEL_86:

LABEL_87:
    v25 = 0;
    goto LABEL_88;
  }
  if (!self->_isFinderBookmark)
  {
    -[CKRecord objectForKeyedSubscript:](*p_record, "objectForKeyedSubscript:", CFSTR("pkgContent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecord objectForKeyedSubscript:](*p_record, "objectForKeyedSubscript:", CFSTR("pkgManifest"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[CKRecord objectForKeyedSubscript:](*p_record, "objectForKeyedSubscript:", CFSTR("pkgXattrs"));
    v32 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
      v33 = v11 == 0;
    else
      v33 = 1;
    if (v33)
    {
      brc_bread_crumbs();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        -[BRCDownloadContent _stageWithSession:error:].cold.4();

      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: unknown type for downloaded object %@"), *p_record);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36)
        goto LABEL_83;
      brc_bread_crumbs();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v38 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v38, (os_log_type_t)0x90u))
        goto LABEL_82;
      v39 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v54 = "-[BRCDownloadContent _stageWithSession:error:]";
      v55 = 2080;
      if (!a4)
        v39 = "(ignored by caller)";
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v32 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            if (self->_requiresTwoPhase)
              v41 = -[BRCDownloadContent _prepareSecondStageWithSession:manifest:package:error:](self, "_prepareSecondStageWithSession:manifest:package:error:", v6, v11, v12, a4);
            else
              v41 = -[BRCDownloadContent _stageWithSession:manifest:package:xattrsPackage:error:](self, "_stageWithSession:manifest:package:xattrsPackage:error:", v6, v11, v12, v32, a4);
            v25 = v41;

            goto LABEL_88;
          }
          brc_bread_crumbs();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
            -[BRCDownloadContent _stageWithSession:error:].cold.1();

          objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: xattrs package is not a CKAsset: %@"), *p_record);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v36)
            goto LABEL_83;
          brc_bread_crumbs();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v38 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v38, (os_log_type_t)0x90u))
            goto LABEL_82;
          v39 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v54 = "-[BRCDownloadContent _stageWithSession:error:]";
          v55 = 2080;
          if (!a4)
            v39 = "(ignored by caller)";
        }
        else
        {
          brc_bread_crumbs();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
            -[BRCDownloadContent _stageWithSession:error:].cold.2();

          objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: package manifest is not a CKAsset: %@"), *p_record);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v36)
            goto LABEL_83;
          brc_bread_crumbs();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v38 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v38, (os_log_type_t)0x90u))
          {
LABEL_82:

LABEL_83:
            if (a4)
              objc_storeStrong(a4, v36);

            goto LABEL_86;
          }
          v39 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v54 = "-[BRCDownloadContent _stageWithSession:error:]";
          v55 = 2080;
          if (!a4)
            v39 = "(ignored by caller)";
        }
      }
      else
      {
        brc_bread_crumbs();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          -[BRCDownloadContent _stageWithSession:error:].cold.3();

        objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: pkg content is not a CKPackage: %@"), *p_record);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v36)
          goto LABEL_83;
        brc_bread_crumbs();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v38 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v38, (os_log_type_t)0x90u))
          goto LABEL_82;
        v39 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v54 = "-[BRCDownloadContent _stageWithSession:error:]";
        v55 = 2080;
        if (!a4)
          v39 = "(ignored by caller)";
      }
    }
    v56 = v39;
    v57 = 2112;
    v58 = v36;
    v59 = 2112;
    v60 = v37;
    _os_log_error_impl(&dword_1CBD43000, v38, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_82;
  }
  brc_bread_crumbs();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    -[BRCDownloadContent _stageWithSession:error:].cold.5();

  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: finder bookmark without content: %@"), *p_record);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
    {
      v48 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v54 = "-[BRCDownloadContent _stageWithSession:error:]";
      v55 = 2080;
      if (!a4)
        v48 = "(ignored by caller)";
      v56 = v48;
      v57 = 2112;
      v58 = v11;
      v59 = 2112;
      v60 = v23;
      _os_log_error_impl(&dword_1CBD43000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a4)
  {
    v11 = v11;
    v25 = 0;
    v12 = *a4;
    *a4 = v11;
LABEL_88:

    goto LABEL_89;
  }
  v25 = 0;
LABEL_89:

  return v25;
}

- (BOOL)requiresTwoPhase
{
  return self->_requiresTwoPhase;
}

- (BOOL)liveItemIsPackage
{
  return self->_liveItemIsPackage;
}

- (unsigned)liveDocumentID
{
  return self->_liveDocumentID;
}

- (NSIndexSet)desiredIndices
{
  return self->_desiredIndices;
}

- (unint64_t)liveFileID
{
  return self->_liveFileID;
}

- (BOOL)isLoser
{
  return self->_isLoser;
}

- (BOOL)isDocumentModifiedByOtherUser
{
  return self->_isDocumentModifiedByOtherUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredIndices, 0);
  objc_storeStrong((id *)&self->_zone, 0);
}

- (void)_prepareSecondStageWithSession:(uint64_t)a3 manifest:(uint64_t)a4 package:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: false%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_prepareSecondStageWithSession:manifest:package:error:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx computing desired packages indices%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_stageWithSession:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: xattrs package is not a CKAsset: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_stageWithSession:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: package manifest is not a CKAsset: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_stageWithSession:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: pkg content is not a CKPackage: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_stageWithSession:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: unknown type for downloaded object %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_stageWithSession:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: finder bookmark without content: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_stageWithSession:error:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: file content is not a CKAsset: %@%@");
  OUTLINED_FUNCTION_2();
}

@end
