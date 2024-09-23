@implementation BRCDownloadThumbnail

- (int)kind
{
  return 1;
}

- (BRCDownloadThumbnail)initWithDocument:(id)a3 stageID:(id)a4 etag:(id)a5
{
  id v8;
  id v9;
  BRCDownloadThumbnail *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BRCDownloadThumbnail;
  v10 = -[BRCDownload initWithDocument:stageID:](&v14, sel_initWithDocument_stageID_, v8, a4);
  if (v10)
  {
    objc_msgSend(v8, "desiredVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v8, "desiredVersion");
    else
      objc_msgSend(v8, "currentVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10->super._totalSize = objc_msgSend(v12, "thumbnailSize");

    objc_storeStrong((id *)&v10->super._etag, a5);
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<dl-thumbnail[%lld] %@_%@>"), self->super._throttleID, self->super._itemID, self->super._etag);
}

- (BOOL)_stageWithSession:(id)a3 error:(id *)a4
{
  void *v6;
  CKRecord **p_record;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  const char *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "stageRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_record = &self->super._record;
  -[CKRecord objectForKeyedSubscript:](self->super._record, "objectForKeyedSubscript:", CFSTR("thumb1024"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v8, "fileURL"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    objc_msgSend(v6, "createURLForDownloadWithStageID:name:", self->super._stageID, CFSTR("thumbnail"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "moveItemAtURL:toURL:error:", v12, v10, a4);

  }
  else
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCDownloadThumbnail _stageWithSession:error:].cold.1(p_record);

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: thumbnail is not a CKAsset: %@"), *p_record);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        v19 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v21 = "-[BRCDownloadThumbnail _stageWithSession:error:]";
        v22 = 2080;
        if (!a4)
          v19 = "(ignored by caller)";
        v23 = v19;
        v24 = 2112;
        v25 = v10;
        v26 = 2112;
        v27 = v16;
        _os_log_error_impl(&dword_1CBD43000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
    {
      v10 = objc_retainAutorelease(v10);
      v13 = 0;
      *a4 = v10;
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (void)_stageWithSession:(_QWORD *)a1 error:.cold.1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v1, v2, "[CRIT] UNREACHABLE: thumbnail is not a CKAsset: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

@end
