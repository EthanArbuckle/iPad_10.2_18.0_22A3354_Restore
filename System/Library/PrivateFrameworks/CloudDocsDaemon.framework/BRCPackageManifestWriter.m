@implementation BRCPackageManifestWriter

- (void)_handleStreamError
{
  NSOutputStream *stream;
  NSError *v4;
  NSError *error;
  NSOutputStream *v6;
  PBMessageStreamWriter *writer;

  stream = self->_stream;
  if (stream)
  {
    -[NSOutputStream streamError](stream, "streamError");
    v4 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v4;

    -[NSOutputStream close](self->_stream, "close");
    v6 = self->_stream;
    self->_stream = 0;

    writer = self->_writer;
    self->_writer = 0;

  }
}

- (BRCPackageManifestWriter)initWithZone:(id)a3 stageID:(id)a4 url:(id)a5
{
  id v9;
  id v10;
  id v11;
  BRCPackageManifestWriter *v12;
  BRCPackageManifestWriter *v13;
  uint64_t v14;
  NSOutputStream *stream;
  uint64_t v16;
  PBMessageStreamWriter *writer;
  BRFieldPkgHeader *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)BRCPackageManifestWriter;
  v12 = -[BRCPackageManifestWriter init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientZone, a3);
    objc_storeStrong((id *)&v13->_stageID, a4);
    objc_storeStrong((id *)&v13->_url, a5);
    objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamWithURL:append:", v11, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    stream = v13->_stream;
    v13->_stream = (NSOutputStream *)v14;

    -[NSOutputStream open](v13->_stream, "open");
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D82BA8]), "initWithOutputStream:", v13->_stream);
    writer = v13->_writer;
    v13->_writer = (PBMessageStreamWriter *)v16;

    v18 = objc_alloc_init(BRFieldPkgHeader);
    -[BRFieldPkgHeader setVersion:](v18, "setVersion:", 1);
    if ((-[PBMessageStreamWriter writeMessage:](v13->_writer, "writeMessage:", v18) & 1) == 0)
      -[BRCPackageManifestWriter _handleStreamError](v13, "_handleStreamError");

  }
  return v13;
}

- (BOOL)addItem:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  char v7;

  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCPackageManifestWriter addItem:].cold.1();

  v7 = -[PBMessageStreamWriter writeMessage:](self->_writer, "writeMessage:", v4);
  if ((v7 & 1) == 0)
    -[BRCPackageManifestWriter _handleStreamError](self, "_handleStreamError");

  return v7;
}

- (BOOL)addLocalItem:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  char v7;

  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCPackageManifestWriter addItem:].cold.1();

  v7 = -[PBMessageStreamWriter writeMessage:](self->_writer, "writeMessage:", v4);
  if ((v7 & 1) == 0)
    -[BRCPackageManifestWriter _handleStreamError](self, "_handleStreamError");

  return v7;
}

- (BOOL)done
{
  -[NSOutputStream close](self->_stream, "close");
  return self->_error == 0;
}

- (void)_applyQuarantineMetadataWithManifestItem:(id)a3 isDocumentModifiedByOtherUser:(BOOL)a4 fd:(int)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "quarantineInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  LOBYTE(v6) = BRCSetFakeQuarantineInfo(a5, v8, &v12);
  v9 = v12;

  if ((v6 & 1) == 0)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v14 = v7;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_error_impl(&dword_1CBD43000, v11, (os_log_type_t)0x90u, "[ERROR] Failed setting quarantine info for item %@: %@%@", buf, 0x20u);
    }

  }
}

- (void)_applyDirectoryMetadataWithManifestItem:(id)a3 packageRootFD:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  void *v17;
  NSObject *v18;
  int v19;
  id v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v4 = *(_QWORD *)&a4;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
  v14 = BRCOpenAt(v4, v8, 33028, v9, v10, v11, v12, v13, v19);
  if ((v14 & 0x80000000) != 0)
  {
    v16 = *__error();
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      v19 = 138412802;
      v20 = v7;
      v21 = 1024;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      _os_log_error_impl(&dword_1CBD43000, v18, (os_log_type_t)0x90u, "[ERROR] Failed to open pkg item at %@ %{errno}d%@", (uint8_t *)&v19, 0x1Cu);
    }

    *__error() = v16;
  }
  else
  {
    v15 = v14;
    -[BRCPackageManifestWriter _applyQuarantineMetadataWithManifestItem:isDocumentModifiedByOtherUser:fd:](self, "_applyQuarantineMetadataWithManifestItem:isDocumentModifiedByOtherUser:fd:", v6, 0, v14);
    close(v15);
  }

}

- (void)_applyFileMetadataWithManifestItem:(id)a3 isDocumentModifiedByOtherUser:(BOOL)a4 packageRootFD:(int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  int v24;
  void *v25;
  NSObject *v26;
  unsigned __int16 v27;
  int v28;
  __int128 v29;
  uint64_t v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v29 = xmmword_1CC066FA4;
  v30 = 0;
  v28 = 0;
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_msgSend(v8, "hasMtime") & 1) != 0)
  {
    v10 = objc_retainAutorelease(v9);
    v11 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");
    v17 = BRCOpenAt(v5, v11, 33028, v12, v13, v14, v15, v16, v27);
    if ((v17 & 0x80000000) != 0)
    {
      v24 = *__error();
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v32 = v10;
        v33 = 1024;
        v34 = v24;
        v35 = 2112;
        v36 = v25;
        _os_log_error_impl(&dword_1CBD43000, v26, (os_log_type_t)0x90u, "[ERROR] openat failed to apply metadata for manifest item %@ %{errno}d%@", buf, 0x1Cu);
      }

      *__error() = v24;
    }
    else
    {
      v18 = v17;
      v28 = -[BRCPackageManifestWriter _computedFileModeForPackageItem:](self, "_computedFileModeForPackageItem:", v8);
      if (BRCFSetAttrList(v18, &v29, &v28, 4uLL))
      {
        v19 = *__error();
        brc_bread_crumbs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          v32 = v10;
          v33 = 1024;
          v34 = v19;
          v35 = 2112;
          v36 = v20;
          _os_log_error_impl(&dword_1CBD43000, v21, (os_log_type_t)0x90u, "[ERROR] fsetattrlist failed for pkg item %@ %{errno}d%@", buf, 0x1Cu);
        }

        *__error() = v19;
      }
      -[BRCPackageManifestWriter _applyQuarantineMetadataWithManifestItem:isDocumentModifiedByOtherUser:fd:](self, "_applyQuarantineMetadataWithManifestItem:isDocumentModifiedByOtherUser:fd:", v8, v6, v18);
      close(v18);
    }
  }
  else
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[BRCPackageManifestWriter _applyFileMetadataWithManifestItem:isDocumentModifiedByOtherUser:packageRootFD:].cold.1();

  }
}

- (BOOL)_packageItem:(id)a3 matchesMode:(unsigned __int16)a4
{
  char v4;
  id v5;
  unsigned int v6;

  v4 = a4;
  v5 = a3;
  if (((v4 & 0x80) == 0) == objc_msgSend(v5, "isWritable"))
    LOBYTE(v6) = 0;
  else
    v6 = ((v4 & 0x40) == 0) ^ objc_msgSend(v5, "isExecutable");

  return v6;
}

- (unsigned)_computedFileModeForPackageItem:(id)a3
{
  id v3;
  __int16 v4;
  int v5;
  void *v6;
  __int16 v7;

  v3 = a3;
  if (objc_msgSend(v3, "isWritable"))
    v4 = 434;
  else
    v4 = 288;
  v5 = objc_msgSend(v3, "isExecutable");

  if (v5)
    v4 |= 0x49u;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "stageInPackageFileUmask");

  return v4 & ~v7;
}

- (BOOL)_stageExistingPackageItem:(id)a3 withLiveFd:(int)a4 stageFd:(int)a5 isDocumentModifiedByOtherUser:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint8_t *v26;
  void *v27;
  NSObject *v28;
  BOOL v29;
  _BOOL4 v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  NSObject *v43;
  NSString *v44;
  const char *v45;
  void *v46;
  NSObject *v47;
  NSString *stageID;
  NSString *v49;
  unsigned __int16 v50;
  _BOOL4 v51;
  uint8_t buf[4];
  _BYTE v53[30];
  __int16 v54;
  int v55;
  __int16 v56;
  void *v57;
  stat v58;
  uint64_t v59;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v59 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(v10, "path");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");
  if (((v7 | v8) & 0x80000000) != 0)
  {
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      -[BRCPackageManifestWriter _stageExistingPackageItem:withLiveFd:stageFd:isDocumentModifiedByOtherUser:].cold.1();

  }
  else
  {
    v18 = v12;
    v19 = BRCOpenAt(v8, v12, 33028, v13, v14, v15, v16, v17, v50);
    if (v19 < 0)
    {
      v22 = *__error();
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        v58.st_dev = 136315650;
        *(_QWORD *)&v58.st_mode = v18;
        WORD2(v58.st_ino) = 1024;
        *(_DWORD *)((char *)&v58.st_ino + 6) = v22;
        HIWORD(v58.st_uid) = 2112;
        *(_QWORD *)&v58.st_gid = v23;
        v25 = "[ERROR] Failed to open live pkg item at %s %{errno}d%@";
        v26 = (uint8_t *)&v58;
        goto LABEL_27;
      }
LABEL_11:

      v29 = 0;
      *__error() = v22;
      goto LABEL_12;
    }
    v20 = v19;
    memset(&v58, 0, sizeof(v58));
    v21 = fstat(v19, &v58);
    close(v20);
    if (v21)
    {
      v22 = *__error();
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)v53 = v18;
        *(_WORD *)&v53[8] = 1024;
        *(_DWORD *)&v53[10] = v22;
        *(_WORD *)&v53[14] = 2112;
        *(_QWORD *)&v53[16] = v23;
        v25 = "[ERROR] Failed to stat live pkg item at %s %{errno}d%@";
        v26 = buf;
LABEL_27:
        _os_log_error_impl(&dword_1CBD43000, v24, (os_log_type_t)0x90u, v25, v26, 0x1Cu);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
    v51 = v6;
    v31 = -[BRCPackageManifestWriter _packageItem:matchesMode:](self, "_packageItem:matchesMode:", v10, v58.st_mode);
    -[BRCClientZone session](self->_clientZone, "session");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "volume");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "hasCloning");

    if (v34)
    {
      if (clonefileat(v8, v18, v7, v18, 0))
      {
        v35 = *__error();
        brc_bread_crumbs();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 67110402;
          *(_DWORD *)v53 = v8;
          *(_WORD *)&v53[4] = 2112;
          *(_QWORD *)&v53[6] = v11;
          *(_WORD *)&v53[14] = 1024;
          *(_DWORD *)&v53[16] = v7;
          *(_WORD *)&v53[20] = 2112;
          *(_QWORD *)&v53[22] = v11;
          v54 = 1024;
          v55 = v35;
          v56 = 2112;
          v57 = v36;
          v38 = "[ERROR] clonefileat(%d, %@, %d, %@) %{errno}d%@";
LABEL_35:
          _os_log_error_impl(&dword_1CBD43000, v37, (os_log_type_t)0x90u, v38, buf, 0x32u);
          goto LABEL_20;
        }
        goto LABEL_20;
      }
      brc_bread_crumbs();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v43 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        goto LABEL_25;
      stageID = self->_stageID;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v53 = v11;
      *(_WORD *)&v53[8] = 2112;
      *(_QWORD *)&v53[10] = stageID;
      *(_WORD *)&v53[18] = 2112;
      *(_QWORD *)&v53[20] = v42;
      v45 = "[DEBUG] cloned at %@ for package staged in %@%@";
      goto LABEL_33;
    }
    if (v31)
    {
      if (linkat(v8, v18, v7, v18, 0))
      {
        v35 = *__error();
        brc_bread_crumbs();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 67110402;
          *(_DWORD *)v53 = v8;
          *(_WORD *)&v53[4] = 2112;
          *(_QWORD *)&v53[6] = v11;
          *(_WORD *)&v53[14] = 1024;
          *(_DWORD *)&v53[16] = v7;
          *(_WORD *)&v53[20] = 2112;
          *(_QWORD *)&v53[22] = v11;
          v54 = 1024;
          v55 = v35;
          v56 = 2112;
          v57 = v36;
          v38 = "[ERROR] linkat(%d, %@, %d, %@) %{errno}d%@";
          goto LABEL_35;
        }
LABEL_20:

        v29 = 0;
        *__error() = v35;
        goto LABEL_12;
      }
      brc_bread_crumbs();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        v49 = self->_stageID;
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v53 = v11;
        *(_WORD *)&v53[8] = 2112;
        *(_QWORD *)&v53[10] = v49;
        *(_WORD *)&v53[18] = 2112;
        *(_QWORD *)&v53[20] = v46;
        _os_log_debug_impl(&dword_1CBD43000, v47, OS_LOG_TYPE_DEBUG, "[DEBUG] hardlinked at %@ for package staged in %@%@", buf, 0x20u);
      }

LABEL_31:
      v29 = 1;
      goto LABEL_12;
    }
    -[BRCClientZone session](self->_clientZone, "session");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stageRegistry");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "copyPackageFileWithPackageFd:toStageFd:relpath:", v8, v7, v11);

    if (v41)
    {
      brc_bread_crumbs();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v43 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
LABEL_25:

        -[BRCPackageManifestWriter _applyFileMetadataWithManifestItem:isDocumentModifiedByOtherUser:packageRootFD:](self, "_applyFileMetadataWithManifestItem:isDocumentModifiedByOtherUser:packageRootFD:", v10, v51, v7);
        goto LABEL_31;
      }
      v44 = self->_stageID;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v53 = v11;
      *(_WORD *)&v53[8] = 2112;
      *(_QWORD *)&v53[10] = v44;
      *(_WORD *)&v53[18] = 2112;
      *(_QWORD *)&v53[20] = v42;
      v45 = "[DEBUG] copied at %@ for package staged in %@%@";
LABEL_33:
      _os_log_debug_impl(&dword_1CBD43000, v43, OS_LOG_TYPE_DEBUG, v45, buf, 0x20u);
      goto LABEL_25;
    }
  }
  v29 = 0;
LABEL_12:

  return v29;
}

- (BOOL)stagePackageWithReader:(id)a3 package:(id)a4 xattrsPackage:(id)a5 stageItemURL:(id)a6 livefd:(int)a7 recordName:(id)a8 isDocumentModifiedByOtherUser:(BOOL)a9
{
  uint64_t v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSError **p_error;
  BOOL v22;
  int v23;
  id v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  id v28;
  void *v29;
  int v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  const char *v47;
  void *v48;
  int v49;
  int v50;
  id v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  BRFieldXattrBlob *v74;
  BOOL v75;
  NSObject *v76;
  id v77;
  id v78;
  void *v79;
  void *v80;
  NSString *v81;
  NSError *v82;
  NSError *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  uint64_t v90;
  void *v91;
  NSObject *v92;
  void *v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  void *v97;
  NSObject *v98;
  uint64_t v99;
  BOOL v100;
  void *v101;
  NSObject *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  NSObject *v108;
  void *v109;
  NSObject *v110;
  int v111;
  void *v112;
  NSObject *v113;
  void *v114;
  NSObject *v115;
  void *v116;
  BRFieldPkgLocalItem *v117;
  void *v118;
  NSObject *v119;
  uint64_t v120;
  void *v121;
  NSObject *v122;
  void *v123;
  NSObject *v124;
  void *v125;
  void *v126;
  NSObject *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  NSObject *v131;
  NSObject *v132;
  int v133;
  void *v134;
  NSObject *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  NSObject *v139;
  NSObject *v141;
  NSString *stageID;
  uint64_t v143;
  uint64_t v144;
  NSString *v145;
  NSString *v146;
  void *v147;
  NSString *v148;
  unsigned __int16 v149;
  unsigned __int16 v150;
  uint64_t v151;
  mode_t v152;
  void *v153;
  void *v154;
  void *v155;
  BRFieldXattrBlob *v156;
  void *v157;
  uint64_t v158;
  id v159;
  id obj;
  void *v161;
  uint64_t v162;
  BRFieldPkgLocalItem *v163;
  void *v164;
  char *v165;
  unint64_t v166;
  unint64_t v167;
  id v168;
  void *context;
  unsigned int v170;
  void *v171;
  void *v172;
  id v173;
  id v174;
  id v175;
  id v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  __int128 v180;
  uint64_t v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  id v186;
  id v187;
  id v188;
  uint8_t buf[4];
  unint64_t v190;
  __int16 v191;
  _BYTE v192[30];
  _BYTE v193[128];
  uint64_t v194;

  v10 = *(_QWORD *)&a7;
  v194 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = v19;
  p_error = &self->_error;
  if (!self->_error)
  {
    v174 = v19;
    v172 = v17;
    v188 = 0;
    v23 = objc_msgSend(v16, "openWithError:", &v188);
    v24 = v188;
    v173 = v18;
    if (v23)
    {
      v171 = v15;
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "stageInPackageDirectoryUmask");

      v187 = v24;
      v27 = objc_msgSend(v16, "itemCountWithError:", &v187);
      v28 = v187;

      if (!v27 && v28)
      {
        v24 = v28;
LABEL_62:
        v15 = v171;
        goto LABEL_63;
      }
      v167 = v27;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v186 = v28;
      v30 = objc_msgSend(v29, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v18, 1, 0, &v186);
      v24 = v186;

      if (!v30)
        goto LABEL_62;
      v159 = objc_retainAutorelease(v18);
      v31 = (const char *)objc_msgSend(v159, "fileSystemRepresentation");
      v37 = BRCOpenAt(0xFFFFFFFFLL, v31, 33028, v32, v33, v34, v35, v36, v149);
      v15 = v171;
      if ((v37 & 0x80000000) == 0)
      {
        v170 = v37;
        if (v171)
        {
          v38 = v18;
          v184 = 0u;
          v185 = 0u;
          v182 = 0u;
          v183 = 0u;
          v39 = v171;
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v182, v193, 16);
          obj = v39;
          if (v40)
          {
            v41 = v40;
            v166 = 0;
            v152 = ~v26 & 0x1FF;
            v162 = *(_QWORD *)v183;
            v42 = v38;
            v43 = v170;
LABEL_12:
            v44 = 0;
            v158 = v41;
            while (1)
            {
              if (*(_QWORD *)v183 != v162)
                objc_enumerationMutation(obj);
              v45 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * v44);
              context = (void *)MEMORY[0x1D17A6BE8]();
              v181 = 512;
              v180 = xmmword_1CC066FBC;
              v178 = 0;
              v179 = 0;
              v177 = 0;
              if (objc_msgSend(v45, "type") == 4)
              {
                if (v166 >= v167)
                {
                  brc_bread_crumbs();
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v102 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v102, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 134218754;
                    v190 = v166;
                    v191 = 2048;
                    *(_QWORD *)v192 = v167;
                    *(_WORD *)&v192[8] = 2112;
                    *(_QWORD *)&v192[10] = v16;
                    *(_WORD *)&v192[18] = 2112;
                    *(_QWORD *)&v192[20] = v101;
                    _os_log_fault_impl(&dword_1CBD43000, v102, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Package has been corrupted on the serverAsking for asset index out of bounds %lu vs %lu in package: %@%@", buf, 0x2Au);
                  }

                  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: Package has been corrupted on the serverAsking for asset index out of bounds %lu vs %lu in package: %@"), v166, v167, v16);
                  v103 = objc_claimAutoreleasedReturnValue();

                  v15 = v171;
                  if (-[BRCClientZone isPrivateZone](self->_clientZone, "isPrivateZone"))
                  {
                    -[BRCClientZone asPrivateClientZone](self->_clientZone, "asPrivateClientZone");
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v104, "reportProblemWithType:recordName:", 9, v174);

                  }
                  objc_autoreleasePoolPop(context);

                  v100 = 0;
                  v24 = (id)v103;
                  v20 = v174;
                  goto LABEL_149;
                }
                ++v166;
              }
              else
              {
                v163 = objc_alloc_init(BRFieldPkgLocalItem);
                v164 = v45;
                objc_msgSend(v45, "path");
                v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v47 = (const char *)objc_msgSend(v46, "fileSystemRepresentation");
                v161 = v46;
                if (!v46)
                {
                  brc_bread_crumbs();
                  v105 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v106 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
                    -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:].cold.2();
                  goto LABEL_118;
                }
                v165 = (char *)v47;
                if (!getattrlistat(v43, v47, &v180, &v177, 0x18uLL, 0x21uLL))
                {
                  brc_bread_crumbs();
                  v107 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v108 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
                  {
                    stageID = self->_stageID;
                    *(_DWORD *)buf = 138412802;
                    v190 = (unint64_t)v161;
                    v191 = 2112;
                    *(_QWORD *)v192 = stageID;
                    *(_WORD *)&v192[8] = 2112;
                    *(_QWORD *)&v192[10] = v107;
                    _os_log_debug_impl(&dword_1CBD43000, v108, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ already exists in stage for package %@%@", buf, 0x20u);
                  }

                  objc_autoreleasePoolPop(context);
                  v15 = v171;
                  goto LABEL_78;
                }
                v48 = v164;
                v49 = objc_msgSend(v164, "type");
                switch(v49)
                {
                  case 3:
                    objc_msgSend(v164, "symlinkContent");
                    v50 = v43;
                    v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    v52 = symlinkat((const char *)objc_msgSend(v51, "fileSystemRepresentation"), v50, v165);

                    if (v52 < 0)
                    {
                      v42 = v173;
                      LODWORD(v43) = v170;
                      if (*__error() != 17)
                      {
                        objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
                        v137 = objc_claimAutoreleasedReturnValue();

                        brc_bread_crumbs();
                        v138 = (void *)objc_claimAutoreleasedReturnValue();
                        brc_default_log();
                        v139 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v139, (os_log_type_t)0x90u))
                        {
                          objc_msgSend(v164, "symlinkContent");
                          v147 = (void *)objc_claimAutoreleasedReturnValue();
                          v148 = self->_stageID;
                          *(_DWORD *)buf = 138413058;
                          v190 = (unint64_t)v161;
                          v191 = 2112;
                          *(_QWORD *)v192 = v147;
                          *(_WORD *)&v192[8] = 2112;
                          *(_QWORD *)&v192[10] = v148;
                          *(_WORD *)&v192[18] = 2112;
                          *(_QWORD *)&v192[20] = v138;
                          _os_log_error_impl(&dword_1CBD43000, v139, (os_log_type_t)0x90u, "[ERROR] Failed to create symlink %@ -> %@ for package %@%@", buf, 0x2Au);

                        }
LABEL_136:

LABEL_137:
                        v24 = (id)v137;
LABEL_138:
                        v15 = v171;
LABEL_139:
                        v20 = v174;
LABEL_140:
                        v116 = context;
                        v117 = v163;
                        goto LABEL_148;
                      }
                    }
                    else
                    {
                      v42 = v173;
                      LODWORD(v43) = v170;
                    }
                    break;
                  case 2:
                    if (v166 >= v167)
                    {
                      brc_bread_crumbs();
                      v126 = (void *)objc_claimAutoreleasedReturnValue();
                      brc_default_log();
                      v127 = objc_claimAutoreleasedReturnValue();
                      v15 = v171;
                      if (os_log_type_enabled(v127, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 134218754;
                        v190 = v166;
                        v191 = 2048;
                        *(_QWORD *)v192 = v167;
                        *(_WORD *)&v192[8] = 2112;
                        *(_QWORD *)&v192[10] = v16;
                        *(_WORD *)&v192[18] = 2112;
                        *(_QWORD *)&v192[20] = v126;
                        _os_log_fault_impl(&dword_1CBD43000, v127, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Package has been corrupted in the cloudAsking for asset index out of bounds %lu vs %lu in package: %@%@", buf, 0x2Au);
                      }

                      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: Package has been corrupted in the cloudAsking for asset index out of bounds %lu vs %lu in package: %@"), v166, v167, v16);
                      v128 = objc_claimAutoreleasedReturnValue();

                      if (!-[BRCClientZone isPrivateZone](self->_clientZone, "isPrivateZone"))
                      {
                        v24 = (id)v128;
                        goto LABEL_139;
                      }
                      -[BRCClientZone asPrivateClientZone](self->_clientZone, "asPrivateClientZone");
                      v129 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v129, "reportProblemWithType:recordName:", 9, v174);

                      v24 = (id)v128;
                      v20 = v174;
                      goto LABEL_105;
                    }
                    objc_msgSend(v16, "itemAtIndex:");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v53)
                    {
                      brc_bread_crumbs();
                      v130 = (void *)objc_claimAutoreleasedReturnValue();
                      brc_default_log();
                      v131 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v131, OS_LOG_TYPE_FAULT))
                        -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:].cold.7((uint64_t)v130, v166, v131);

                      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: Can't find item at index %ld"), v166, v151);
LABEL_104:
                      v120 = objc_claimAutoreleasedReturnValue();

                      v24 = (id)v120;
                      v15 = v171;
                      v20 = v174;
LABEL_105:
                      LODWORD(v43) = v170;
                      goto LABEL_140;
                    }
                    v155 = v53;
                    objc_msgSend(v53, "fileURL");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "path");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v55)
                    {
                      if (BRCRenameAt(-1, v55, v170, v161, 0))
                      {
                        v133 = *__error();
                        brc_bread_crumbs();
                        v134 = (void *)objc_claimAutoreleasedReturnValue();
                        brc_default_log();
                        v135 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v135, (os_log_type_t)0x90u))
                        {
                          *(_DWORD *)buf = 138413314;
                          v190 = (unint64_t)v55;
                          v191 = 1024;
                          *(_DWORD *)v192 = v170;
                          *(_WORD *)&v192[4] = 2112;
                          *(_QWORD *)&v192[6] = v161;
                          *(_WORD *)&v192[14] = 1024;
                          *(_DWORD *)&v192[16] = v133;
                          *(_WORD *)&v192[20] = 2112;
                          *(_QWORD *)&v192[22] = v134;
                          _os_log_error_impl(&dword_1CBD43000, v135, (os_log_type_t)0x90u, "[ERROR] renameat(-1, %@, %d, %@) %{errno}d%@", buf, 0x2Cu);
                        }

                        *__error() = v133;
                        objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
                        v136 = v24;
                        v24 = (id)objc_claimAutoreleasedReturnValue();
                        v15 = v171;
                        LODWORD(v43) = v170;
LABEL_144:

LABEL_146:
                        v116 = context;
                        v117 = v163;

                        goto LABEL_147;
                      }
                      brc_bread_crumbs();
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      brc_default_log();
                      v57 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                      {
                        v81 = self->_stageID;
                        *(_DWORD *)buf = 138413058;
                        v190 = (unint64_t)v55;
                        v191 = 2112;
                        *(_QWORD *)v192 = v161;
                        *(_WORD *)&v192[8] = 2112;
                        *(_QWORD *)&v192[10] = v81;
                        *(_WORD *)&v192[18] = 2112;
                        *(_QWORD *)&v192[20] = v56;
                        _os_log_debug_impl(&dword_1CBD43000, v57, OS_LOG_TYPE_DEBUG, "[DEBUG] staged from %@ to %@ in %@%@", buf, 0x2Au);
                      }

                      v48 = v164;
                      -[BRCPackageManifestWriter _applyFileMetadataWithManifestItem:isDocumentModifiedByOtherUser:packageRootFD:](self, "_applyFileMetadataWithManifestItem:isDocumentModifiedByOtherUser:packageRootFD:", v164, a9, v170);
                    }
                    else
                    {
                      LODWORD(v43) = v170;
                      if ((v10 & 0x80000000) != 0)
                      {
                        brc_bread_crumbs();
                        v136 = (void *)objc_claimAutoreleasedReturnValue();
                        brc_default_log();
                        v141 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v141, OS_LOG_TYPE_FAULT))
                          -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:].cold.8();

                        v15 = v171;
                        goto LABEL_144;
                      }
                      if (!-[BRCPackageManifestWriter _stageExistingPackageItem:withLiveFd:stageFd:isDocumentModifiedByOtherUser:](self, "_stageExistingPackageItem:withLiveFd:stageFd:isDocumentModifiedByOtherUser:", v164, v10, v170, a9))
                      {
                        v15 = v171;
                        goto LABEL_146;
                      }
                    }
                    ++v166;
                    objc_msgSend(v155, "signature");
                    v43 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "setSignature:", v43);

                    LODWORD(v43) = v170;
                    break;
                  case 1:
                    if (mkdirat(v43, v165, v152) && *__error() != 17)
                    {
                      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
                      v137 = objc_claimAutoreleasedReturnValue();

                      brc_bread_crumbs();
                      v138 = (void *)objc_claimAutoreleasedReturnValue();
                      brc_default_log();
                      v132 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v132, (os_log_type_t)0x90u))
                      {
                        v146 = self->_stageID;
                        *(_DWORD *)buf = 138412802;
                        v190 = (unint64_t)v161;
                        v191 = 2112;
                        *(_QWORD *)v192 = v146;
                        *(_WORD *)&v192[8] = 2112;
                        *(_QWORD *)&v192[10] = v138;
                        _os_log_error_impl(&dword_1CBD43000, v132, (os_log_type_t)0x90u, "[ERROR] Failed to mkdir %@ for package %@%@", buf, 0x20u);
                      }

                      goto LABEL_136;
                    }
                    -[BRCPackageManifestWriter _applyDirectoryMetadataWithManifestItem:packageRootFD:](self, "_applyDirectoryMetadataWithManifestItem:packageRootFD:", v164, v43);
                    break;
                  default:
                    brc_bread_crumbs();
                    v105 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v106 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
                      -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:].cold.3();
LABEL_118:

                    goto LABEL_138;
                }
                if (objc_msgSend(v48, "hasXattrIndex"))
                {
                  if (objc_msgSend(v48, "xattrIndex") < 0
                    || (v58 = objc_msgSend(v48, "xattrIndex"), v58 >= objc_msgSend(v172, "itemCount")))
                  {
                    brc_bread_crumbs();
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v110 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v110, OS_LOG_TYPE_FAULT))
                    {
                      v143 = objc_msgSend(v164, "xattrIndex");
                      v144 = objc_msgSend(v172, "itemCount");
                      *(_DWORD *)buf = 134218498;
                      v190 = v143;
                      v191 = 2048;
                      *(_QWORD *)v192 = v144;
                      *(_WORD *)&v192[8] = 2112;
                      *(_QWORD *)&v192[10] = v109;
                      _os_log_fault_impl(&dword_1CBD43000, v110, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: xattr index is out of bounds %ld of total %ld%@", buf, 0x20u);
                    }

                    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: xattr index is out of bounds %ld of total %ld"), objc_msgSend(v164, "xattrIndex"), objc_msgSend(v172, "itemCount"));
                    goto LABEL_104;
                  }
                  objc_msgSend(v172, "itemAtIndex:", objc_msgSend(v48, "xattrIndex"));
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v59)
                  {
                    brc_bread_crumbs();
                    v118 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v119 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v119, OS_LOG_TYPE_FAULT))
                      -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:].cold.4();

                    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: Can't find xattr at index %ld"), objc_msgSend(v164, "xattrIndex"), v151);
                    goto LABEL_104;
                  }
                  v60 = v59;
                  v61 = (void *)MEMORY[0x1E0C99D50];
                  objc_msgSend(v59, "fileURL");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  v176 = v24;
                  objc_msgSend(v61, "dataWithContentsOfURL:options:error:", v62, 0, &v176);
                  v157 = (void *)objc_claimAutoreleasedReturnValue();
                  v63 = v176;

                  objc_msgSend(v60, "fileURL");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v64)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "fileURL");
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v70, "removeItemAtURL:error:", v71, 0);

                  }
                  if (!v157 || v63)
                  {
                    LODWORD(v43) = v170;
                    if (!v63)
                    {
                      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10B70], 15, CFSTR("Can't load xattr"));
                      v63 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    v168 = v63;
                    brc_bread_crumbs();
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v122 = objc_claimAutoreleasedReturnValue();
                    v15 = v171;
                    v116 = context;
                    v117 = v163;
                    if (os_log_type_enabled(v122, (os_log_type_t)0x90u))
                      -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:].cold.5();

                    v24 = v168;
LABEL_112:

LABEL_147:
                    v20 = v174;
LABEL_148:

                    objc_autoreleasePoolPop(v116);
                    v100 = 0;
                    goto LABEL_149;
                  }
                  LODWORD(v43) = v170;
                  v72 = BRCOpenAt(v170, v165, 33028, v65, v66, v67, v68, v69, v150);
                  if ((v72 & 0x80000000) != 0)
                  {
                    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
                    v24 = (id)objc_claimAutoreleasedReturnValue();
                    v15 = v171;
                    v116 = context;
                    v117 = v163;
                    goto LABEL_112;
                  }
                  v73 = v72;
                  v74 = -[BRFieldXattrBlob initWithData:]([BRFieldXattrBlob alloc], "initWithData:", v157);
                  v175 = 0;
                  v156 = v74;
                  v75 = -[BRFieldXattrBlob applyToFileDescriptor:error:](v74, "applyToFileDescriptor:error:", v73, &v175);
                  v24 = v175;
                  if (!v75)
                  {
                    brc_bread_crumbs();
                    v123 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v124 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v124, (os_log_type_t)0x90u))
                    {
                      *(_DWORD *)buf = 138412546;
                      v190 = (unint64_t)v24;
                      v191 = 2112;
                      *(_QWORD *)v192 = v123;
                      _os_log_error_impl(&dword_1CBD43000, v124, (os_log_type_t)0x90u, "[ERROR] Failed to apply xattrs to file descriptor: %@%@", buf, 0x16u);
                    }

                    close(v73);
                    objc_autoreleasePoolPop(context);

                    v100 = 0;
                    v15 = v171;
LABEL_81:
                    v20 = v174;
                    LODWORD(v43) = v170;
LABEL_149:
                    objc_msgSend(v16, "close");
                    close(v43);
                    if (v100)
                    {
LABEL_71:
                      v22 = -[BRCPackageManifestWriter done](self, "done");

                      v17 = v172;
                      v18 = v173;
                      goto LABEL_72;
                    }
LABEL_65:
                    if (!*p_error)
                    {
                      if (v24)
                      {
                        v82 = (NSError *)v24;
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:description:", 22, CFSTR("unknown error"));
                        v82 = (NSError *)objc_claimAutoreleasedReturnValue();
                      }
                      v83 = *p_error;
                      *p_error = v82;

                    }
                    objc_msgSend(v20, "substringFromIndex:", objc_msgSend(CFSTR("documentContent/"), "length"));
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    -[BRCClientZone mangledID](self->_clientZone, "mangledID");
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    v86 = +[AppTelemetryTimeSeriesEvent newCorruptPackageDownloadEventWithZoneMangledID:enhancedDrivePrivacyEnabled:error:itemIDString:](AppTelemetryTimeSeriesEvent, "newCorruptPackageDownloadEventWithZoneMangledID:enhancedDrivePrivacyEnabled:error:itemIDString:", v85, -[BRCClientZone enhancedDrivePrivacyEnabled](self->_clientZone, "enhancedDrivePrivacyEnabled"), v24, v84);

                    -[BRCClientZone session](self->_clientZone, "session");
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "analyticsReporter");
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v88, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v86);

                    v20 = v174;
                    goto LABEL_71;
                  }
                  v153 = v60;
                  close(v73);
                  -[BRFieldPkgLocalItem setXattrs:](v163, "setXattrs:", v157);
                  brc_bread_crumbs();
                  v154 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v76 = objc_claimAutoreleasedReturnValue();
                  v77 = v173;
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
                  {
                    -[BRFieldXattrBlob shortDescription](v156, "shortDescription");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v164, "path");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v190 = (unint64_t)v79;
                    v191 = 2112;
                    *(_QWORD *)v192 = v80;
                    *(_WORD *)&v192[8] = 2112;
                    *(_QWORD *)&v192[10] = v154;
                    _os_log_debug_impl(&dword_1CBD43000, v76, OS_LOG_TYPE_DEBUG, "[DEBUG] Successfully applied xattrs %@ to package item %@%@", buf, 0x20u);

                    v77 = v173;
                  }
                  v78 = v77;

                  LODWORD(v43) = v170;
                  v48 = v164;
                }
                else
                {
                  v78 = v42;
                }
                if (getattrlistat(v43, v165, &v180, &v177, 0x18uLL, 0x21uLL))
                {
                  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
                  v137 = objc_claimAutoreleasedReturnValue();

                  v111 = *__error();
                  brc_bread_crumbs();
                  v112 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v113 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v113, (os_log_type_t)0x90u))
                  {
                    v145 = self->_stageID;
                    *(_DWORD *)buf = 138413058;
                    v190 = (unint64_t)v161;
                    v191 = 2112;
                    *(_QWORD *)v192 = v145;
                    *(_WORD *)&v192[8] = 1024;
                    *(_DWORD *)&v192[10] = v111;
                    *(_WORD *)&v192[14] = 2112;
                    *(_QWORD *)&v192[16] = v112;
                    _os_log_error_impl(&dword_1CBD43000, v113, (os_log_type_t)0x90u, "[ERROR] unable to stat %@ for package %@ %{errno}d%@", buf, 0x26u);
                  }

                  *__error() = v111;
                  goto LABEL_137;
                }
                -[BRFieldPkgLocalItem setItem:](v163, "setItem:", v48);
                -[BRFieldPkgLocalItem setFileID:](v163, "setFileID:", v178);
                if (objc_msgSend(v48, "type") == 2)
                {
                  -[BRFieldPkgLocalItem setGenerationID:](v163, "setGenerationID:", HIDWORD(v177));
                  -[BRFieldPkgLocalItem setSize:](v163, "setSize:", v179);
                }
                if (!-[BRCPackageManifestWriter addLocalItem:](self, "addLocalItem:", v163))
                {
                  brc_bread_crumbs();
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v115 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v115, (os_log_type_t)0x90u))
                    -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:].cold.6();

                  v15 = v171;
                  v20 = v174;
                  v116 = context;
                  v117 = v163;
                  LODWORD(v43) = v170;
                  goto LABEL_148;
                }
                v42 = v78;

                v43 = v170;
                v41 = v158;
              }
              objc_autoreleasePoolPop(context);
              if (v41 == ++v44)
              {
                v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v182, v193, 16);
                v15 = v171;
                if (v41)
                  goto LABEL_12;
                goto LABEL_78;
              }
            }
          }
          v166 = 0;
LABEL_78:

          brc_bread_crumbs();
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v98 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v159, "path");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v190 = (unint64_t)v125;
            v191 = 2048;
            *(_QWORD *)v192 = v167;
            *(_WORD *)&v192[8] = 2048;
            *(_QWORD *)&v192[10] = v166;
            *(_WORD *)&v192[18] = 2112;
            *(_QWORD *)&v192[20] = v97;
            _os_log_debug_impl(&dword_1CBD43000, v98, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished staging package for %@. Item count:%lu.  Asset index:%lu%@", buf, 0x2Au);

          }
          objc_msgSend(obj, "error");
          v99 = objc_claimAutoreleasedReturnValue();

          v100 = v99 == 0;
          v24 = (id)v99;
          goto LABEL_81;
        }
        brc_bread_crumbs();
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v92 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_FAULT))
          -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:].cold.1();

        v93 = (void *)MEMORY[0x1E0CB35C8];
        v94 = *MEMORY[0x1E0D10C90];
        objc_msgSend(v159, "path");
        v95 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v93, "br_errorWithDomain:code:description:", v94, 15, CFSTR("unreachable: No reader to stage package at %s"), objc_msgSend(v95, "UTF8String"));
        v96 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "close");
        close(v170);
        v24 = (id)v96;
LABEL_64:
        v20 = v174;
        goto LABEL_65;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", *__error());
      v90 = objc_claimAutoreleasedReturnValue();

      v24 = (id)v90;
    }
LABEL_63:
    objc_msgSend(v16, "close");
    goto LABEL_64;
  }
  v22 = 0;
LABEL_72:

  return v22;
}

- (NSError)error
{
  return self->_error;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_stageID, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

- (void)addItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Adding %@ to the manifest%@");
  OUTLINED_FUNCTION_2();
}

- (void)_applyFileMetadataWithManifestItem:isDocumentModifiedByOtherUser:packageRootFD:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Invalid args in %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_stageExistingPackageItem:withLiveFd:stageFd:isDocumentModifiedByOtherUser:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: we should have downloaded this file if there is nothing live%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:.cold.1()
{
  NSObject *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "path");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "UTF8String");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, v3, "[CRIT] UNREACHABLE: No reader to stage package at %s%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: relpath should always exist%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_9_0();
  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = objc_msgSend(v2, "type");
  v4 = 2112;
  v5 = v1;
  _os_log_fault_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid item type: %d%@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_3_0();
}

- (void)stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:.cold.4()
{
  NSObject *v0;
  id v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_9_0();
  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "xattrIndex");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, v2, "[CRIT] UNREACHABLE: Can't find xattr at index %ld%@", v3);
  OUTLINED_FUNCTION_3_0();
}

- (void)stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Failed to read xattrs blob: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Unable to add item to manifest: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)stagePackageWithReader:(NSObject *)a3 package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:.cold.7(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, a2, a3, "[CRIT] UNREACHABLE: Can't find item at index %ld%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:.cold.8()
{
  NSObject *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "path");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "UTF8String");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, v3, "[CRIT] UNREACHABLE: We didn't fetch the corresponding pkg item from the server, but we were also not given a path to hardlink it from! (item: %s)%@", v4);

  OUTLINED_FUNCTION_6();
}

@end
