@implementation BRCFSDownloaderBatchEnumerator

- (BRCFSDownloaderBatchEnumerator)initWithSyncContext:(id)a3 kind:(int)a4 now:(int64_t)a5 retryQueueKick:(int64_t *)a6
{
  uint64_t v8;
  BRCSyncContext *v10;
  BRCFSDownloaderBatchEnumerator *v11;
  BRCFSDownloaderBatchEnumerator *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PQLResultSet *rs;
  uint64_t v18;
  NSMutableSet *enumeratedThrottleIds;
  objc_super v21;

  v8 = *(_QWORD *)&a4;
  v10 = (BRCSyncContext *)a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCFSDownloaderBatchEnumerator;
  v11 = -[BRCFSDownloaderBatchEnumerator init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_syncContext = v10;
    v11->_now = a5;
    v11->_retryQueueKick = a6;
    -[BRCSyncContext session](v10, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientDB");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncContext contextIdentifier](v10, "contextIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "fetch:", CFSTR("  SELECT throttle_id, next_retry_stamp, app_library_rowid,           download_etag, transfer_stage, unit_count_completed      FROM client_downloads    WHERE throttle_state = 1      AND transfer_queue = %@      AND transfer_operation IS NULL      AND download_kind = %d ORDER BY download_priority DESC, download_request_stamp DESC"), v15, v8);
    rs = v12->_rs;
    v12->_rs = (PQLResultSet *)v16;

    v12->_kind = v8;
    v18 = objc_opt_new();
    enumeratedThrottleIds = v12->_enumeratedThrottleIds;
    v12->_enumeratedThrottleIds = (NSMutableSet *)v18;

  }
  return v12;
}

- (id)nextDocumentItem
{
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableSet *enumeratedThrottleIds;
  void *v9;
  void *v10;
  NSObject *v11;
  int64_t now;
  int64_t *retryQueueKick;
  int64_t v14;
  id v15;
  uint64_t kind;
  void *v17;
  void *v18;
  NSMutableSet *v19;
  void *v20;
  char v21;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[BRCSyncContext session](self->_syncContext, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  while (-[PQLResultSet next](self->_rs, "next"))
  {
    v5 = (void *)MEMORY[0x1D17A6BE8]();
    v6 = -[PQLResultSet longLongAtIndex:](self->_rs, "longLongAtIndex:", 0);
    v7 = -[PQLResultSet longLongAtIndex:](self->_rs, "longLongAtIndex:", 1);
    enumeratedThrottleIds = self->_enumeratedThrottleIds;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(enumeratedThrottleIds) = -[NSMutableSet containsObject:](enumeratedThrottleIds, "containsObject:", v9);

    if ((enumeratedThrottleIds & 1) != 0)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        v24 = v6;
        v25 = 2112;
        v26 = v10;
        _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Throttle ID %lld was already enumerated. Will schedule it for retry to the next batch%@", buf, 0x16u);
      }

      now = self->_now;
      if (v7 <= now + 1)
        v7 = now + 1;
    }
    else
    {
      now = self->_now;
    }
    if (v7 > now)
    {
      retryQueueKick = self->_retryQueueKick;
      v14 = *retryQueueKick;
      if (*retryQueueKick >= v7)
        v14 = v7;
      *retryQueueKick = v14;
      objc_msgSend(v4, "clientDB");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      kind = self->_kind;
      -[PQLResultSet stringAtIndex:](self->_rs, "stringAtIndex:", 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "execute:", CFSTR("UPDATE client_downloads    SET transfer_queue = '_retry'  WHERE throttle_id = %lld AND download_kind = %u AND download_etag = %@"), v6, kind, v17);

LABEL_16:
      v21 = 1;
      goto LABEL_17;
    }
    objc_msgSend(v4, "itemByRowID:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "asDocument");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_16;
    v19 = self->_enumeratedThrottleIds;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v19, "addObject:", v20);

    v15 = v15;
    v21 = 0;
    v2 = v15;
LABEL_17:

    objc_autoreleasePoolPop(v5);
    if ((v21 & 1) == 0)
      goto LABEL_20;
  }
  v2 = 0;
LABEL_20:

  return v2;
}

- (id)etag
{
  return (id)-[PQLResultSet stringAtIndex:](self->_rs, "stringAtIndex:", 3);
}

- (id)stageID
{
  return (id)-[PQLResultSet stringAtIndex:](self->_rs, "stringAtIndex:", 4);
}

- (int64_t)completedUnitCount
{
  return -[PQLResultSet integerAtIndex:](self->_rs, "integerAtIndex:", 5);
}

- (int)kind
{
  return self->_kind;
}

- (void)close
{
  -[PQLResultSet close](self->_rs, "close");
}

- (BRCSyncContext)syncContext
{
  return self->_syncContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumeratedThrottleIds, 0);
  objc_storeStrong((id *)&self->_rs, 0);
}

@end
