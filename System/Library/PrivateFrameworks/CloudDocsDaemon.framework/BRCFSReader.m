@implementation BRCFSReader

- (void)createReadingJobForItem:(id)a3 state:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BRCItemDBRowIDAndZoneJobIdentifier *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(v6, "serverZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metadataSyncContext");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "dbRowID");
  objc_msgSend(v6, "serverZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dbRowID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BRCItemDBRowIDAndZoneJobIdentifier initWithItemDBRowID:zoneRowID:]([BRCItemDBRowIDAndZoneJobIdentifier alloc], "initWithItemDBRowID:zoneRowID:", v8, v10);
  objc_msgSend(v15, "readerThrottle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCFSSchedulerBase insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:](self, "insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:", v11, v12, v4, 0, 0, 0, 0);
  v14 = v13;

  if ((_DWORD)v4 == 1)
    -[BRCFSSchedulerBase signalWithDeadline:](self, "signalWithDeadline:", v14);

}

- (void)setState:(int)a3 forItem:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  void *v8;
  BRCItemDBRowIDAndZoneJobIdentifier *v9;
  id v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "dbRowID");
  objc_msgSend(v6, "serverZone");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "dbRowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BRCItemDBRowIDAndZoneJobIdentifier initWithItemDBRowID:zoneRowID:]([BRCItemDBRowIDAndZoneJobIdentifier alloc], "initWithItemDBRowID:zoneRowID:", v7, v8);
  -[BRCFSSchedulerBase setState:forJobID:](self, "setState:forJobID:", v4, v9);

}

- (unint64_t)_readCoordinationCount
{
  void *v2;
  unint64_t v3;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "readerMaxConcurrentIOs");

  return v3;
}

- (BOOL)canRetryJobWithID:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  if (self->_readerCountReachedMax
    && (v5 = -[BRCCountedSet totalCount](self->_coordinatedReaders, "totalCount"),
        v5 >= -[BRCFSReader _readCoordinationCount](self, "_readCoordinationCount") >> 1))
  {
    v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BRCFSReader;
    v6 = -[BRCFSSchedulerBase canRetryJobWithID:](&v8, sel_canRetryJobWithID_, v4);
  }

  return v6;
}

- (void)_delayJobID:(id)a3 by:(double)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v5 = a3;
  if (!v5)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCFSSchedulerBase canRetryJobWithID:].cold.1();

  }
  v6 = brc_current_date_nsec();
  v7 = brc_interval_to_nsec() + v6;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchingJobsWhereSQLClause");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "execute:", CFSTR("UPDATE client_reader_throttle    SET next_retry_stamp = MAX(next_retry_stamp, %lld)  WHERE %@"), v7, v9);

  -[BRCFSSchedulerBase signalWithDeadline:](self, "signalWithDeadline:", v7);
}

- (void)_attemptSchedulingCoordinatedReadForItem:(id)a3 path:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BRCItemDBRowIDAndZoneJobIdentifier *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BRCFSReader _attemptSchedulingCoordinatedReadForItem:path:].cold.1();

  objc_msgSend(v6, "serverZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "dbRowID");
  objc_msgSend(v6, "serverZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dbRowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[BRCItemDBRowIDAndZoneJobIdentifier initWithItemDBRowID:zoneRowID:]([BRCItemDBRowIDAndZoneJobIdentifier alloc], "initWithItemDBRowID:zoneRowID:", v11, v13);

  if (-[BRCFSReader canRetryJobWithID:](self, "canRetryJobWithID:", v14))
  {
    -[BRCFSReader _scheduleCoordinatedReadForItem:path:](self, "_scheduleCoordinatedReadForItem:path:", v6, v7);
    objc_msgSend(v10, "metadataSyncContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "readerThrottle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCFSSchedulerBase postponeJobID:withThrottle:](self, "postponeJobID:withThrottle:", v14, v16);

  }
}

- (void)_scheduleCoordinatedReadForItem:(id)a3 path:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  brc_task_tracker *taskTracker;
  _QWORD v15[5];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "appLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "coordinatorForItem:forRead:", v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "st");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "logicalName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logicalURLWithLogicalName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCAccountSession clientTruthWorkloop](self->super._session, "clientTruthWorkloop");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  taskTracker = self->_taskTracker;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__BRCFSReader__scheduleCoordinatedReadForItem_path___block_invoke;
  v15[3] = &unk_1E8765730;
  v15[4] = self;
  objc_msgSend(v9, "scheduleReadOfItemAtURL:queue:taskTracker:accessor:", v12, v13, taskTracker, v15);

}

void __52__BRCFSReader__scheduleCoordinatedReadForItem_path___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = a2;
  objc_msgSend(v2, "fsReader");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readUnderCoordinationAtURL:", v3);

}

- (BOOL)canScheduleMoreJobs
{
  return !self->_readerCountReachedMax;
}

- (void)schedule
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "readerScanBatchSize");

  objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "throttle_id, zone_rowid", 23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __23__BRCFSReader_schedule__block_invoke;
  v6[3] = &unk_1E87609B0;
  v6[4] = self;
  -[BRCFSSchedulerBase scheduleWithBatchSize:whereSQLClause:columns:actionHandler:](self, "scheduleWithBatchSize:whereSQLClause:columns:actionHandler:", v4, 0, v5, v6);

}

void __23__BRCFSReader_schedule__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  BRCItemDBRowIDAndZoneJobIdentifier *v7;
  id v8;

  v5 = a2;
  v6 = objc_msgSend(v5, "longLongAtIndex:", a3);
  objc_msgSend(v5, "numberAtIndex:", (a3 + 1));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = -[BRCItemDBRowIDAndZoneJobIdentifier initWithItemDBRowID:zoneRowID:]([BRCItemDBRowIDAndZoneJobIdentifier alloc], "initWithItemDBRowID:zoneRowID:", v6, v8);
  objc_msgSend(*(id *)(a1 + 32), "_scheduleReadJobWithID:", v7);

}

- (void)_scheduleReadJobWithID:(id)a3
{
  id v4;
  BRCAccountSession *session;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  BRCFSReader *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  BRCFSReader *v20;
  id v21;
  id v22;
  id v23;

  v4 = a3;
  session = self->super._session;
  objc_msgSend(v4, "zoneRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession serverZoneByRowID:](session, "serverZoneByRowID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "clientZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemByRowID:", objc_msgSend(v4, "itemDBRowID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((objc_msgSend(v9, "needsReading") & 1) != 0)
    {
      if (!objc_msgSend(v10, "isLost"))
      {
        -[BRCAccountSession clientDB](self->super._session, "clientDB");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __38__BRCFSReader__scheduleReadJobWithID___block_invoke;
        v18[3] = &unk_1E87642D8;
        v19 = v10;
        v20 = self;
        v21 = v4;
        v22 = v7;
        v23 = v8;
        objc_msgSend(v17, "groupInBatch:", v18);

        goto LABEL_13;
      }
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[BRCFSReader _scheduleReadJobWithID:].cold.1();

      v13 = self;
      v14 = 10;
    }
    else
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[BRCFSReader _scheduleReadJobWithID:].cold.2();

      v13 = self;
      v14 = 0;
    }
    -[BRCFSSchedulerBase setState:forJobID:](v13, "setState:forJobID:", v14, v4);
  }
  else
  {
    -[BRCFSSchedulerBase deleteJobsMatching:](self, "deleteJobsMatching:", v4);
  }
LABEL_13:

}

void __38__BRCFSReader__scheduleReadJobWithID___block_invoke(uint64_t a1)
{
  BRCItemToPathLookup *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", *(_QWORD *)(a1 + 32));
  -[BRCItemToPathLookup byFileSystemID](v2, "byFileSystemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "metadataSyncContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readerThrottle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postponeJobID:withThrottle:", v5, v7);

  if ((objc_msgSend(*(id *)(a1 + 32), "isDocument") & 1) != 0)
  {
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __38__BRCFSReader__scheduleReadJobWithID___block_invoke_cold_1();

    if (!v3)
      goto LABEL_8;
  }
  if ((objc_msgSend(v3, "exists") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_scheduleCoordinatedReadForItem:path:", *(_QWORD *)(a1 + 32), v3);
    goto LABEL_11;
  }
LABEL_8:
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138412802;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    v18 = 2112;
    v19 = v10;
    _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Reader: %@: marking unresolvable item as lost: %@%@", (uint8_t *)&v14, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "markLostClearGenerationID:backoffMode:", 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "saveToDB");
LABEL_11:
  -[BRCItemToPathLookup closePaths](v2, "closePaths");

}

- (BOOL)startReadCoordinationInAppLibrary:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  if (self->_readerCountReachedMax)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v6 = -[BRCCountedSet totalCount](self->_coordinatedReaders, "totalCount");
  if (v6 >= -[BRCFSReader _readCoordinationCount](self, "_readCoordinationCount"))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCFSReader startReadCoordinationInAppLibrary:].cold.1();

    self->_readerCountReachedMax = 1;
    -[BRCFSReader suspend](self, "suspend");
    goto LABEL_7;
  }
  -[BRCCountedSet addObject:](self->_coordinatedReaders, "addObject:", v4);
  v7 = 1;
LABEL_8:

  return v7;
}

- (void)endReadCoordinationInAppLibrary:(id)a3
{
  id v4;
  void *v5;
  BRCCountedSet **p_coordinatedReaders;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  p_coordinatedReaders = &self->_coordinatedReaders;
  if ((-[BRCCountedSet containsObject:](self->_coordinatedReaders, "containsObject:", v4) & 1) == 0)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCFSReader endReadCoordinationInAppLibrary:].cold.2();

  }
  -[BRCCountedSet removeObject:](*p_coordinatedReaders, "removeObject:", v4);
  if (self->_readerCountReachedMax)
  {
    v7 = -[BRCCountedSet totalCount](*p_coordinatedReaders, "totalCount");
    if (v7 < -[BRCFSReader _readCoordinationCount](self, "_readCoordinationCount") >> 1)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[BRCFSReader endReadCoordinationInAppLibrary:].cold.1();

      self->_readerCountReachedMax = 0;
      -[BRCFSReader resume](self, "resume");
    }
  }

}

- (BOOL)readUnderCoordinationWithLookup:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  char v25;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  char v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint64_t v39[3];
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "matchLookupItemsWithDisk");
  objc_msgSend(v4, "byPathRelpath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "exists");
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "faultedRelpath");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  if (!objc_msgSend(v5, "exists") || (objc_msgSend(v5, "isDocument") & 1) == 0)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCFSReader readUnderCoordinationWithLookup:].cold.9(v4, (uint64_t)v10, v11);

    objc_msgSend(v4, "faultedLocalItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "needsReading"))
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v41 = (uint64_t)v13;
        _os_log_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Fault is marked needs-read, odd, let fix it up%@", buf, 0xCu);
      }

      objc_msgSend(v12, "markNeedsUploadOrSyncingUp");
      objc_msgSend(v12, "saveToDB");
    }
    objc_msgSend(v4, "byPathLocalItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "exists") & 1) == 0 && objc_msgSend(v15, "isLive"))
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[BRCFSReader readUnderCoordinationWithLookup:].cold.8();

      objc_msgSend(v15, "markLostWhenReplacedByItem:", 0);
      objc_msgSend(v15, "saveToDB");
    }
    goto LABEL_37;
  }
  if (!objc_msgSend(v5, "isInPackage"))
  {
    if (v6)
      objc_msgSend(v4, "byPathLocalItem");
    else
      objc_msgSend(v4, "faultedLocalItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;
    if (!v18)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[BRCFSReader readUnderCoordinationWithLookup:].cold.2();
      goto LABEL_36;
    }
    if ((objc_msgSend(v18, "isLive") & 1) == 0)
    {
      brc_bread_crumbs();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[BRCFSReader readUnderCoordinationWithLookup:].cold.7();

      goto LABEL_37;
    }
    if ((objc_msgSend(v15, "isDocument") & 1) == 0)
    {
      brc_bread_crumbs();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v41 = (uint64_t)v5;
        v42 = 2112;
        v43 = v15;
        v44 = 2112;
        v45 = v29;
        _os_log_debug_impl(&dword_1CBD43000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] alias/directory <-> document conflict:\n  path: %@\n  item: %@%@", buf, 0x20u);
      }

      objc_msgSend(v15, "markLostClearGenerationID:backoffMode:", 0, 1);
      objc_msgSend(v15, "saveToDB");
      goto LABEL_37;
    }
    memset(v39, 0, sizeof(v39));
    __brc_create_section(0, (uint64_t)"-[BRCFSReader readUnderCoordinationWithLookup:]", 553, v39);
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      v41 = v39[0];
      v42 = 2112;
      v43 = v15;
      v44 = 2112;
      v45 = v5;
      v46 = 2112;
      v47 = v19;
      _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx reading %@ at %@%@", buf, 0x2Au);
    }

    if (objc_msgSend(v15, "changedAtRelativePath:scanPackage:", v5, 1))
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[BRCFSReader readUnderCoordinationWithLookup:].cold.4();

      if (!objc_msgSend(v5, "isBusy"))
      {
        objc_msgSend(v5, "appLibrary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "db");
        v24 = objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __47__BRCFSReader_readUnderCoordinationWithLookup___block_invoke;
        v36[3] = &unk_1E875D8F0;
        v37 = v5;
        v38 = v15;
        v25 = -[NSObject groupInTransaction:](v24, "groupInTransaction:", v36);

LABEL_54:
        goto LABEL_55;
      }
      -[BRCFSReader setState:forItem:](self, "setState:forItem:", 11, v15);
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[BRCFSReader readUnderCoordinationWithLookup:].cold.3();
    }
    else
    {
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        -[BRCFSReader readUnderCoordinationWithLookup:].cold.6();

      objc_msgSend(v4, "parentItem");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "itemGlobalID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v15, "updateLocationAndMetaFromFSAtPath:parentGlobalID:", v5, v34);

      if ((v35 & 1) != 0)
      {
        objc_msgSend(v15, "markNeedsUploadOrSyncingUp");
        v25 = objc_msgSend(v15, "saveToDB");
LABEL_55:
        __brc_leave_section(v39);
        goto LABEL_38;
      }
      if (!objc_msgSend(v15, "isDocument"))
      {
        v25 = 0;
        goto LABEL_55;
      }
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[BRCFSReader readUnderCoordinationWithLookup:].cold.5();
    }
    v25 = 0;
    goto LABEL_54;
  }
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    -[BRCFSReader readUnderCoordinationWithLookup:].cold.1();
LABEL_36:

  v15 = 0;
LABEL_37:
  v25 = 1;
LABEL_38:

  return v25;
}

uint64_t __47__BRCFSReader_readUnderCoordinationWithLookup___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isPackageRoot") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "asDocument");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPackage");

    if (!v4)
    {
      v7 = 0;
      goto LABEL_8;
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  v6 = +[BRCPackageItem updateSnapshotAtPath:error:](BRCPackageItem, "updateSnapshotAtPath:error:", v5, &v13);
  v7 = v13;
  if (v6)
  {
LABEL_8:
    objc_msgSend(*(id *)(a1 + 40), "updateFromFSAtPath:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "markNeedsUploadOrSyncingUp");
    v10 = objc_msgSend(*(id *)(a1 + 40), "saveToDB");
    goto LABEL_9;
  }
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v15 = v12;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_error_impl(&dword_1CBD43000, v9, (os_log_type_t)0x90u, "[ERROR] could not update package at %@: %@%@", buf, 0x20u);
  }

  v10 = 0;
LABEL_9:

  return v10;
}

- (id)lookupAndReadItemUnderCoordinationAtURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BRCURLToItemLookup *v7;
  BOOL v8;
  id v9;
  BRCURLToItemLookup *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBatchSuspended");

  if ((v6 & 1) == 0)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCFSReader lookupAndReadItemUnderCoordinationAtURL:].cold.1();

  }
  v7 = -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:]([BRCURLToItemLookup alloc], "initWithURL:allowAppLibraryRoot:session:", v4, 1, self->super._session);
  v17 = 0;
  v8 = -[BRCURLToItemLookup resolveAndKeepOpenWithError:](v7, "resolveAndKeepOpenWithError:", &v17);
  v9 = v17;
  if (!v8)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v13;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] can't resolve parent of '%@': %@%@", buf, 0x20u);

    }
    goto LABEL_9;
  }
  if (!-[BRCFSReader readUnderCoordinationWithLookup:](self, "readUnderCoordinationWithLookup:", v7))
  {
    -[BRCURLToItemLookup closePaths](v7, "closePaths");
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  -[BRCURLToItemLookup refreshByPathDiffs](v7, "refreshByPathDiffs");
  -[BRCURLToItemLookup refreshFaultedDiffs](v7, "refreshFaultedDiffs");
  v10 = v7;
LABEL_10:

  return v10;
}

- (void)readUnderCoordinationAtURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13[3];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v13, 0, sizeof(v13));
  __brc_create_section(0, (uint64_t)"-[BRCFSReader readUnderCoordinationAtURL:]", 631, v13);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v9 = v13[0];
    objc_msgSend(v4, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx acquired coordination for (reading)\n  at '%@'%@", buf, 0x20u);

  }
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__BRCFSReader_readUnderCoordinationAtURL___block_invoke;
  v11[3] = &unk_1E8760018;
  v11[4] = self;
  v8 = v4;
  v12 = v8;
  objc_msgSend(v7, "groupInBatch:", v11);

  __brc_leave_section(v13);
}

void __42__BRCFSReader_readUnderCoordinationAtURL___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "lookupAndReadItemUnderCoordinationAtURL:", *(_QWORD *)(a1 + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "closePaths");

}

- (char)needsLookupReloadAfterHandlingCrossZoneMoveWithItem:(id)a3 relpath:(id)a4
{
  id v5;
  id v6;
  char v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v28;
  uint8_t buf[4];
  NSObject *v30;
  __int16 v31;
  NSObject *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    v7 = 1;
    goto LABEL_23;
  }
  if ((objc_msgSend(v5, "isAlmostDead") & 1) == 0)
  {
    objc_msgSend(v5, "clientZone");
    v8 = objc_claimAutoreleasedReturnValue();
    +[BRCPathToItemLookup lookupForRelativePath:](BRCPathToItemLookup, "lookupForRelativePath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientZone");
    v10 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isSharedToMeTopLevelItem"))
    {
      objc_msgSend(v9, "parentItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "clientZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isSharedZone");

      if ((v13 & 1) == 0)
      {
LABEL_7:
        if (!objc_msgSend(v5, "isSharedToMeChildItem"))
        {
LABEL_20:
          v7 = 1;
          goto LABEL_22;
        }
        v28 = v8;
        objc_msgSend(v9, "parentItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C95070], "brc_fetchShareIDWithSharedItem:", v5);
        v15 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C95070], "brc_fetchShareIDWithSharedItem:", v14);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          -[NSObject recordName](v15, "recordName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject recordName](v16, "recordName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqualToString:", v18);

          if ((v19 & 1) != 0)
          {

            v7 = 1;
            v8 = v28;
LABEL_22:

            goto LABEL_23;
          }
        }
        brc_bread_crumbs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v30 = v15;
          v31 = 2112;
          v32 = v16;
          v33 = 2112;
          v34 = v20;
          _os_log_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] This is a cross share move from %@ to %@%@", buf, 0x20u);
        }

        v8 = v28;
LABEL_17:

        if (!objc_msgSend(v5, "isDocument")
          || (objc_msgSend(v5, "asDocument"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v23 = objc_msgSend(v22, "supportsServerSideAssetCopies"),
              v22,
              !v23))
        {
          objc_msgSend(v5, "clientZone");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "itemCrossZoneMoved:withLookup:", v5, v9);

          objc_msgSend(v5, "markLostWhenReplacedByItem:", 0);
          objc_msgSend(v5, "saveToDB");
          v7 = 4;
          goto LABEL_22;
        }
        objc_msgSend(v5, "asDocument");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "parentItem");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "markCrossZoneMovedForServerAssetCopyWithParentItem:path:", v25, v6);

        goto LABEL_20;
      }
    }
    else if (v8 == v10)
    {
      goto LABEL_7;
    }
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v30 = v8;
      v31 = 2112;
      v32 = v10;
      v33 = 2112;
      v34 = v14;
      _os_log_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] This is a cross zone move from %@ to %@%@", buf, 0x20u);
    }
    goto LABEL_17;
  }
  v7 = 2;
LABEL_23:

  return v7;
}

- (BOOL)updateLookupAfterHandlingPathMatchWithFSRoot:(id *)a3 relpath:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  int v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = *a3;
  objc_msgSend(v7, "byPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relpathOfItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isFSRoot") & 1) == 0 && objc_msgSend(v9, "type") != 4
    || objc_msgSend(v9, "type") == 3)
  {
    goto LABEL_4;
  }
  objc_msgSend(v7, "relpathOfItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isDocument");

  if (v12)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BRCFSReader updateLookupAfterHandlingPathMatchWithFSRoot:relpath:].cold.2();
    goto LABEL_11;
  }
  objc_msgSend(v7, "byFileID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 != v8)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BRCFSReader updateLookupAfterHandlingPathMatchWithFSRoot:relpath:].cold.3();
LABEL_11:

    *a3 = 0;
    *a4 = 0;
    objc_msgSend(v7, "relpathOfItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "relpathOfItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v19;
      v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] we need to bounce path at %@ because there is a FS root clashing%@", buf, 0x16u);

    }
    -[BRCAccountSession(LegacyAdditions) fsWriter](self->super._session, "fsWriter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bouncePath:forItemConflictingWithAnFSRoot:", v16, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v21, "resolveAndKeepOpenMustExist:error:", 1, &v30))
    {
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        v32 = v16;
        v33 = 2112;
        v34 = v8;
        v35 = 1024;
        v36 = v30;
        v37 = 2112;
        v38 = v24;
        _os_log_debug_impl(&dword_1CBD43000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] can't bounce %@ to avoid clash with fs-root %@ %{errno}d%@", buf, 0x26u);
      }

      v22 = v7;
      goto LABEL_23;
    }
    +[BRCPathToItemLookup lookupForRelativePath:](BRCPathToItemLookup, "lookupForRelativePath:", v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "close");
    objc_msgSend(v22, "byFileID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {

    }
    else
    {
      objc_msgSend(v22, "byPath");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        -[BRCAccountSession recreateDesktopSymlinksIfNecessary](self->super._session, "recreateDesktopSymlinksIfNecessary");
        v22 = objc_retainAutorelease(v22);
        *a3 = v22;
        *a4 = objc_retainAutorelease(v21);
LABEL_23:

        v10 = 1;
        v7 = v22;
        goto LABEL_24;
      }
    }
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      -[BRCFSReader updateLookupAfterHandlingPathMatchWithFSRoot:relpath:].cold.1();

    goto LABEL_23;
  }
LABEL_4:
  v10 = 0;
LABEL_24:

  return v10;
}

- (void)fseventAtPath:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(v6, "filename");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[BRCFSReader fseventAtPath:flags:unresolvedLastPathComponent:](self, "fseventAtPath:flags:unresolvedLastPathComponent:", v6, v4, v7);

}

- (void)fseventAtPath:(id)a3 flags:(unsigned int)a4 unresolvedLastPathComponent:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  if (!v8)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCFSReader fseventAtPath:flags:unresolvedLastPathComponent:].cold.1();

  }
  -[BRCFSReader fseventAtPath:flags:options:unresolvedLastPathComponent:](self, "fseventAtPath:flags:options:unresolvedLastPathComponent:", v8, v6, 0, v9);

}

- (void)fseventAtPath:(id)a3 flags:(unsigned int)a4 options:(unint64_t)a5 unresolvedLastPathComponent:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  id v43;
  os_activity_scope_state_s state;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a6;
  if (!v10)
  {
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      -[BRCFSReader fseventAtPath:flags:unresolvedLastPathComponent:].cold.1();

  }
  objc_msgSend(v10, "appLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "type");
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isBatchSuspended");

  if ((v15 & 1) == 0)
  {
    brc_bread_crumbs();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      -[BRCFSReader lookupAndReadItemUnderCoordinationAtURL:].cold.1();

  }
  if (v13 == 1)
  {
    -[BRCFSReader fseventOnRoot:flags:](self, "fseventOnRoot:flags:", v10, v8);
    goto LABEL_40;
  }
  if (!v12)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[BRCFSReader fseventAtPath:flags:options:unresolvedLastPathComponent:].cold.1();
    goto LABEL_15;
  }
  if (v13 != 2)
  {
    objc_msgSend(v12, "deepScanStamp");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      -[BRCAsyncDirectoryEnumerator rootPath](self->_currentScan, "rootPath");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "appLibrary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 != v21)
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[BRCFSReader fseventAtPath:flags:options:unresolvedLastPathComponent:].cold.5();
LABEL_15:

        goto LABEL_40;
      }
    }
    +[BRCPathToItemLookup lookupForRelativePath:](BRCPathToItemLookup, "lookupForRelativePath:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "relpathOfItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "exists") & 1) != 0)
    {
      objc_msgSend(v22, "parentItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        v41 = _os_activity_create(&dword_1CBD43000, "fsevent", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
        os_activity_scope_enter(v41, &state);
        if (!((a5 >> 1) & 1 | (objc_msgSend(v23, "isDocument") ^ 1) & 1))
        {
          -[BRCAccountSession analyticsReporter](self->super._session, "analyticsReporter");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "createFSEventToSyncUpEventForFileID:genID:", objc_msgSend(v23, "fileID"), objc_msgSend(v23, "fsGenerationID"));

        }
        v42 = v23;
        v43 = v22;
        v26 = -[BRCFSReader updateLookupAfterHandlingPathMatchWithFSRoot:relpath:](self, "updateLookupAfterHandlingPathMatchWithFSRoot:relpath:", &v43, &v42);
        v27 = v43;

        v28 = v42;
        if (v26)
        {
          v29 = v28;

          objc_msgSend(v29, "filename");
          v30 = objc_claimAutoreleasedReturnValue();

          v10 = v29;
          v11 = (id)v30;
        }
        if (v27)
        {
          if (objc_msgSend(v28, "isSymLink"))
          {
            -[BRCFSReader fseventOnSymlink:flags:lookup:](self, "fseventOnSymlink:flags:lookup:", v28, v8, v27);
          }
          else if (objc_msgSend(v28, "isBRAlias"))
          {
            -[BRCFSReader fseventOnAlias:flags:lookup:](self, "fseventOnAlias:flags:lookup:", v28, v8, v27);
          }
          else if (objc_msgSend(v28, "isDocument"))
          {
            -[BRCFSReader fseventOnDocument:flags:options:lookup:unresolvedLastPathComponent:](self, "fseventOnDocument:flags:options:lookup:unresolvedLastPathComponent:", v10, v8, a5, v27, v11);
          }
          else
          {
            -[BRCFSReader fseventOnDirectory:flags:lookup:](self, "fseventOnDirectory:flags:lookup:", v28, v8, v27);
          }
        }
        else
        {
          brc_bread_crumbs();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            -[BRCFSReader fseventAtPath:flags:options:unresolvedLastPathComponent:].cold.4();

        }
        os_activity_scope_leave(&state);
        v31 = v41;
        goto LABEL_39;
      }
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        -[BRCFSReader fseventAtPath:flags:options:unresolvedLastPathComponent:].cold.3();

    }
    else
    {
      objc_msgSend(v22, "byPath");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCFSReader fseventOnDeadPath:item:](self, "fseventOnDeadPath:item:", v23, v31);
    }
    v27 = v22;
    v28 = v23;
LABEL_39:

    v10 = v28;
    goto LABEL_40;
  }
  if (objc_msgSend(v12, "isiCloudDesktopAppLibrary"))
  {
    brc_bread_crumbs();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      -[BRCFSReader fseventAtPath:flags:options:unresolvedLastPathComponent:].cold.2();

  }
  -[BRCFSReader fseventOnContainer:flags:](self, "fseventOnContainer:flags:", v10, v8);
LABEL_40:

}

- (void)fseventRecursiveAtRoot:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  BRCAccountSession *session;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "type") != 1 && objc_msgSend(v6, "type") != 3)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRCFSReader fseventRecursiveAtRoot:withReason:].cold.2();

  }
  if ((objc_msgSend(v6, "exists") & 1) != 0)
  {
    if (self->_currentScan)
      -[BRCFSReader _cancelScan](self, "_cancelScan");
    session = self->super._session;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__BRCFSReader_fseventRecursiveAtRoot_withReason___block_invoke;
    v13[3] = &unk_1E875E790;
    v14 = v7;
    -[BRCAccountSession enumerateAppLibraries:](session, "enumerateAppLibraries:", v13);
    v9 = v14;
  }
  else
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCFSReader fseventRecursiveAtRoot:withReason:].cold.1();

  }
}

uint64_t __49__BRCFSReader_fseventRecursiveAtRoot_withReason___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "scheduleDeepScanWithReason:", *(_QWORD *)(a1 + 32));
  return 1;
}

- (void)fseventOnRoot:(id)a3 flags:(unsigned int)a4
{
  if ((a4 & 0xB01) != 0)
    -[BRCFSReader fseventRecursiveAtRoot:withReason:](self, "fseventRecursiveAtRoot:withReason:", a3, CFSTR("fsevent on root"));
}

- (void)fseventOnContainer:(id)a3 flags:(unsigned int)a4
{
  __int16 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BRCAsyncDirectoryEnumerator *currentScan;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "appLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "exists") & 1) != 0)
  {
    v8 = objc_msgSend(v6, "fileID");
    objc_msgSend(v7, "fileID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    if ((v4 & 0xB01) != 0 || v8 != v10)
    {
      currentScan = self->_currentScan;
      if (currentScan)
      {
        -[BRCAsyncDirectoryEnumerator rootPath](currentScan, "rootPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appLibrary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 == v7)
          -[BRCFSReader _cancelScan](self, "_cancelScan");
      }
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[BRCFSReader fseventOnContainer:flags:].cold.1();

      objc_msgSend(v7, "scheduleDeepScanWithReason:", CFSTR("fs-event on container"));
    }
  }
  else
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      prettyprintFSEventFlags();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412802;
      v21 = v7;
      v22 = 2112;
      v23 = v19;
      v24 = 2112;
      v25 = v16;
      _os_log_fault_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_FAULT, "[CRIT] reset needed for %@ because it was deleted on disk %@%@", (uint8_t *)&v20, 0x20u);

    }
    objc_msgSend(v7, "defaultClientZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scheduleResetServerAndClientTruthsForReason:", CFSTR("fsevent.no-root"));

  }
}

- (void)fseventOnDeadPath:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isLive"))
  {
    objc_msgSend(v7, "markLostWhenReplacedByItem:", 0);
    objc_msgSend(v7, "saveToDB");
  }
  else if (self->_currentScan)
  {
    if (objc_msgSend(v7, "isDirectory"))
    {
      -[BRCAsyncDirectoryEnumerator rootPath](self->_currentScan, "rootPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "fileID");
      objc_msgSend(v7, "st");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "longLongValue");

      if (v9 == v12)
      {
        brc_bread_crumbs();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 138412546;
          v16 = v7;
          v17 = 2112;
          v18 = v13;
          _os_log_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Cancelling scan of %@ because it was removed while we were scanning%@", (uint8_t *)&v15, 0x16u);
        }

        -[BRCFSReader _cancelScan](self, "_cancelScan");
      }
    }
  }
  if (-[BRCAccountSession shouldPathBeDesktopSymlink:](self->super._session, "shouldPathBeDesktopSymlink:", v6))
    -[BRCAccountSession recreateDesktopSymlinksIfNecessary](self->super._session, "recreateDesktopSymlinksIfNecessary");

}

- (BOOL)_createSharedZoneIfNecessaryWithLookup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "relpathOfItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedItemBookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "parseBookmarkDataWithAccountSession:docID:itemID:mangledID:unsaltedBookmarkData:error:", v7, 0, 0, &v20, 0, 0);

  if (v8)
  {
    -[BRCAccountSession clientZoneByMangledID:](self->super._session, "clientZoneByMangledID:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = 0;
    }
    else
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v20;
        v23 = 2112;
        v24 = v11;
        _os_log_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find client zone for %@. Asynchronously creating it%@", buf, 0x16u);
      }

      -[BRCAccountSession resetQueue](self->super._session, "resetQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__BRCFSReader__createSharedZoneIfNecessaryWithLookup___block_invoke;
      block[3] = &unk_1E875D470;
      v18 = v5;
      v19 = v20;
      dispatch_async(v13, block);

      objc_msgSend(v4, "parentItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isFSRoot"))
      {
        objc_msgSend(v14, "appLibrary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "scheduleDeepScanWithReason:", CFSTR("needs lost parent"));

      }
      else
      {
        objc_msgSend(v14, "markLostClearGenerationID:backoffMode:", 1, 2);
        objc_msgSend(v14, "saveToDB");
      }
      if (self->_currentScan)
        -[BRCFSReader _cancelScan](self, "_cancelScan");

      v10 = 1;
      v9 = v18;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __54__BRCFSReader__createSharedZoneIfNecessaryWithLookup___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "getOrCreateSharedZones:", *(_QWORD *)(a1 + 40));

}

- (void)fseventOnSymlink:(id)a3 flags:(unsigned int)a4 lookup:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  NSObject *v22;
  BRCAccountSession *session;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  int v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  _QWORD v44[3];

  v44[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "byFileIDGlobally");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = -[BRCFSReader needsLookupReloadAfterHandlingCrossZoneMoveWithItem:relpath:](self, "needsLookupReloadAfterHandlingCrossZoneMoveWithItem:relpath:", v9, v7);
  if (v10 != 4)
  {
    if (v10 == 2)
    {

      objc_msgSend(v8, "byFileID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v9 = 0;
        goto LABEL_7;
      }
      brc_bread_crumbs();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.5();
      v9 = 0;
    }
    else
    {
      if (!v9 || (objc_msgSend(v9, "isOnDisk") & 1) != 0)
        goto LABEL_7;
      brc_bread_crumbs();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.4();
    }

LABEL_7:
    v12 = objc_msgSend(v9, "isSymLink");
    if (v12)
      v13 = 0;
    else
      v13 = v9;
    if (!v12)
      v9 = 0;
    objc_msgSend(v8, "byPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v9 || !v14)
    {
LABEL_22:
      session = self->super._session;
      objc_msgSend(v8, "relpathOfItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(session) = -[BRCAccountSession shouldPathBeDesktopSymlink:](session, "shouldPathBeDesktopSymlink:", v24);

      if ((_DWORD)session)
      {
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.1();

      }
      else
      {
        if (v9)
        {
          objc_msgSend(v8, "parentItem");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "itemGlobalID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v9, "updateFromFSAtPath:parentGlobalID:", v7, v28);

          if ((v29 & 1) == 0)
          {
            -[BRCFSReader reset](self, "reset");
LABEL_40:

            goto LABEL_41;
          }
        }
        else
        {
          objc_msgSend(v8, "relpathOfItem");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "parentItem");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "itemGlobalID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = +[BRCLocalItem newItemWithPath:parentGlobalID:](BRCLocalItem, "newItemWithPath:parentGlobalID:", v30, v32);

          brc_bread_crumbs();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            v39 = 138412802;
            v40 = v9;
            v41 = 2112;
            v42 = v7;
            v43 = 2112;
            v44[0] = v33;
            _os_log_debug_impl(&dword_1CBD43000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] creating new symlink %@ at %@%@", (uint8_t *)&v39, 0x20u);
          }

        }
        objc_msgSend(v9, "asSymlink");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 && v15 != v9)
        {
          objc_msgSend(v15, "markLostWhenReplacedByItem:", v9);
          objc_msgSend(v15, "saveToDB");
        }
        if (v13)
        {
          if (v13 == v9)
          {
            brc_bread_crumbs();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
              -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.2();

          }
          objc_msgSend(v13, "markLostWhenReplacedByItem:", v9);
          objc_msgSend(v13, "saveToDB");
        }
        objc_msgSend(v25, "readTargetFromRelativePathAndSyncUp:", v7);
        objc_msgSend(v25, "markNeedsUploadOrSyncingUp");
        objc_msgSend(v9, "saveToDB");
      }

      goto LABEL_40;
    }
    if (!objc_msgSend(v14, "isSymLink"))
    {
      v9 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v15, "st");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedLongLongValue");

    if ((objc_msgSend(v15, "isAlmostDead") & 1) != 0)
    {
      v19 = 2;
    }
    else
    {
      objc_msgSend(v7, "session");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = +[BRCRelativePath locateByFileID:session:](BRCRelativePath, "locateByFileID:session:", v18, v20);

      if (!v19)
      {
        brc_bread_crumbs();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.3();
        v9 = 0;
        goto LABEL_21;
      }
    }
    v9 = v15;
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v39 = 138413058;
      v40 = v9;
      v41 = 2112;
      v42 = v7;
      v43 = 1024;
      LODWORD(v44[0]) = v19;
      WORD2(v44[0]) = 2112;
      *(_QWORD *)((char *)v44 + 6) = v21;
      _os_log_debug_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Symlink %@ changed fileID at %@ %{errno}d%@", (uint8_t *)&v39, 0x26u);
    }
LABEL_21:

    goto LABEL_22;
  }
LABEL_41:

}

- (void)fseventOnAlias:(id)a3 flags:(unsigned int)a4 lookup:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  id v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  int v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BRCRelativePath *v43;
  void *v44;
  void *v45;
  BRCRelativePath *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  id v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  BRCFSReader *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  char v96;
  uint8_t buf[4];
  id v98;
  __int16 v99;
  id v100;
  __int16 v101;
  _BYTE v102[18];
  __int16 v103;
  void *v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "bookmark");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "resolveWithError:", 0);
  v11 = 0;
  if (v10)
  {
    objc_msgSend(v9, "target");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isDocument");

    if (v13)
    {
      objc_msgSend(v9, "target");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "asDocument");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
  }
  objc_msgSend(v11, "aliasItemID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "byFileIDGlobally");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = -[BRCFSReader needsLookupReloadAfterHandlingCrossZoneMoveWithItem:relpath:](self, "needsLookupReloadAfterHandlingCrossZoneMoveWithItem:relpath:", v16, v7);
  if (v17 != 4)
  {
    v86 = self;
    if (v17 == 2)
    {

      objc_msgSend(v8, "byFileID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v16 = 0;
        goto LABEL_11;
      }
      v80 = v11;
      brc_bread_crumbs();
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v82 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
        -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.5();
      v16 = 0;
    }
    else
    {
      if (!v16 || (objc_msgSend(v16, "isOnDisk") & 1) != 0)
      {
LABEL_11:
        objc_msgSend(v8, "byPath");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        v96 = v10;
        if (!v15)
        {
          v24 = 0;
          goto LABEL_26;
        }
        objc_msgSend(v19, "itemID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToItemID:", v15);

        if (v22)
        {
          v23 = v20;
        }
        else
        {
          objc_msgSend(v16, "itemID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToItemID:", v15);

          if (!v26)
          {
            +[BRCPathToItemLookup lookupForRelativePath:](BRCPathToItemLookup, "lookupForRelativePath:", v7);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "clientZone");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v28, "itemByItemID:", v15);
            v24 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_19;
          }
          v23 = v16;
        }
        v24 = v23;
LABEL_19:
        if ((objc_msgSend(v24, "isBRAlias") & 1) != 0)
        {
          brc_bread_crumbs();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138413314;
            v98 = v24;
            v99 = 2112;
            v100 = v20;
            v101 = 2112;
            *(_QWORD *)v102 = v16;
            *(_WORD *)&v102[8] = 2112;
            *(_QWORD *)&v102[10] = v15;
            v103 = 2112;
            v104 = v29;
            _os_log_debug_impl(&dword_1CBD43000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] using byItemID:%@ byPath:%@ byFileID:%@ aliasItemID:%@%@", buf, 0x34u);
          }
        }
        else
        {
          v29 = v24;
          brc_bread_crumbs();
          v30 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            -[BRCFSReader fseventOnAlias:flags:lookup:].cold.7();

          v24 = 0;
        }

LABEL_26:
        v32 = objc_msgSend(v16, "isBRAlias");
        if (v32)
          v33 = 0;
        else
          v33 = v16;
        if (!v32)
          v16 = 0;
        if (!v16 && v20)
        {
          if (objc_msgSend(v20, "isBRAlias"))
          {
            v90 = v9;
            v87 = v24;
            objc_msgSend(v20, "st");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "fileID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "unsignedLongLongValue");

            v93 = v33;
            if ((objc_msgSend(v20, "isAlmostDead") & 1) != 0)
            {
              v37 = 2;
            }
            else
            {
              objc_msgSend(v7, "session");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = +[BRCRelativePath locateByFileID:session:](BRCRelativePath, "locateByFileID:session:", v36, v52);

              if (!v37)
              {
                brc_bread_crumbs();
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v54 = objc_claimAutoreleasedReturnValue();
                v9 = v90;
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                  -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.3();
                v16 = 0;
LABEL_48:
                v24 = v87;

                v33 = v93;
                if (!v87)
                  goto LABEL_49;
                goto LABEL_38;
              }
            }
            v16 = v20;
            brc_bread_crumbs();
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v54 = objc_claimAutoreleasedReturnValue();
            v9 = v90;
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138413058;
              v98 = v16;
              v99 = 2112;
              v100 = v7;
              v101 = 1024;
              *(_DWORD *)v102 = v37;
              *(_WORD *)&v102[4] = 2112;
              *(_QWORD *)&v102[6] = v53;
              _os_log_debug_impl(&dword_1CBD43000, v54, OS_LOG_TYPE_DEBUG, "[DEBUG] Alias %@ changed fileID at %@ %{errno}d%@", buf, 0x26u);
            }
            goto LABEL_48;
          }
          v16 = 0;
        }
        if (!v24)
        {
LABEL_49:
          v89 = 0;
          goto LABEL_50;
        }
LABEL_38:
        if (v16 == v24)
        {
          v89 = v24;
          v16 = v24;
        }
        else
        {
          v91 = v8;
          v94 = v33;
          v38 = v11;
          v39 = v9;
          objc_msgSend(v24, "st");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "fileID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v24;
          v43 = (BRCRelativePath *)objc_msgSend(v41, "unsignedLongLongValue");

          v88 = v42;
          objc_msgSend(v42, "clientZone");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "asPrivateClientZone");
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43)
          {
            v46 = [BRCRelativePath alloc];
            objc_msgSend(v7, "session");
            v47 = v15;
            v48 = v38;
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = -[BRCRelativePath initWithFileID:session:](v46, "initWithFileID:session:", v43, v49);

            v38 = v48;
            v15 = v47;
          }
          objc_msgSend(v45, "resolveClashOfAlias:atPath:withAlias:atPath:", v16, v7, v88, v43);
          v50 = (id)objc_claimAutoreleasedReturnValue();

          if (v50 != v7)
          {

            v51 = v88;
            v9 = v39;
            v11 = v38;
            v8 = v91;
            v33 = v94;
LABEL_86:

            goto LABEL_87;
          }

          v89 = 0;
          v16 = v88;
          v9 = v39;
          v11 = v38;
          v8 = v91;
          v33 = v94;
        }
LABEL_50:
        if ((v96 & 1) != 0)
        {
          if (!v16)
          {
            if (objc_msgSend(v11, "isSharedToMeTopLevelItem"))
            {
              brc_bread_crumbs();
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v56 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                -[BRCFSReader fseventOnAlias:flags:lookup:].cold.1();
LABEL_84:

              +[BRCBookmark unlinkAliasAtPath:](BRCBookmark, "unlinkAliasAtPath:", v7);
              v16 = 0;
              goto LABEL_85;
            }
            v85 = v20;
            objc_msgSend(v8, "relpathOfItem");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v92 = v8;
            objc_msgSend(v8, "parentItem");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "itemGlobalID");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = +[BRCLocalItem newItemWithPath:parentGlobalID:](BRCLocalItem, "newItemWithPath:parentGlobalID:", v67, v69);

            if (v15)
              objc_msgSend(v16, "learnItemID:serverItem:path:markLost:", v15, 0, v7, 0);
            if (v11)
            {
              objc_msgSend(v16, "asBRAlias");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "learnTarget:", v11);

            }
            brc_bread_crumbs();
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v72 = objc_claimAutoreleasedReturnValue();
            v20 = v85;
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v98 = v16;
              v99 = 2112;
              v100 = v7;
              v101 = 2112;
              *(_QWORD *)v102 = v71;
              _os_log_debug_impl(&dword_1CBD43000, v72, OS_LOG_TYPE_DEBUG, "[DEBUG] creating new alias %@ at %@%@", buf, 0x20u);
            }

            objc_msgSend(v16, "saveToDB");
            objc_msgSend(v11, "session");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "fsUploader");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "asBRAlias");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "addAliasItem:toUploadingItem:", v75, v11);

            goto LABEL_69;
          }
        }
        else
        {
          if (objc_msgSend(v16, "isLost"))
          {
            v95 = v33;
            v57 = v20;
            v58 = v8;
            brc_bread_crumbs();
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
              -[BRCFSReader fseventOnAlias:flags:lookup:].cold.4();

            objc_msgSend(v16, "clientZone");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "itemID");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "serverItemByItemID:", v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            +[BRCBookmark unlinkAliasAtPath:](BRCBookmark, "unlinkAliasAtPath:", v7);
            objc_msgSend(v16, "markNeedsDeleteForRescheduleOfItem:", v63);
            objc_msgSend(v16, "saveToDB");

            v8 = v58;
            v20 = v57;
            v33 = v95;
            goto LABEL_85;
          }
          if (!v16)
          {
            brc_bread_crumbs();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              -[BRCFSReader fseventOnAlias:flags:lookup:].cold.5();
            goto LABEL_84;
          }
        }
        v92 = v8;
        objc_msgSend(v8, "parentItem");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "itemGlobalID");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v16, "updateFromFSAtPath:parentGlobalID:", v7, v65);

        if ((v66 & 1) == 0)
        {
          -[BRCFSReader reset](v86, "reset");
LABEL_81:
          v8 = v92;
LABEL_85:
          v51 = v89;
          goto LABEL_86;
        }
LABEL_69:
        if (v11)
        {
          objc_msgSend(v16, "asBRAlias");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "updateOnDiskWithAliasTarget:forServerEdit:", v11, 0);

          if (!v20)
          {
LABEL_77:
            if (v33)
            {
              if (v33 == v16)
              {
                brc_bread_crumbs();
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v84 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_FAULT))
                  -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.2();

              }
              objc_msgSend(v33, "markLostWhenReplacedByItem:", v16);
              objc_msgSend(v33, "saveToDB");
            }
            objc_msgSend(v16, "asBRAlias");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "markNeedsUploadOrSyncingUpWithAliasTarget:", v11);

            objc_msgSend(v16, "saveToDB");
            goto LABEL_81;
          }
        }
        else
        {
          brc_bread_crumbs();
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v78 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
            -[BRCFSReader fseventOnAlias:flags:lookup:].cold.3();

          objc_msgSend(v16, "markLostClearGenerationID:backoffMode:", 0, 2);
          if (!v20)
            goto LABEL_77;
        }
        if (v20 != v16)
        {
          objc_msgSend(v20, "markLostWhenReplacedByItem:", v16);
          objc_msgSend(v20, "saveToDB");
        }
        goto LABEL_77;
      }
      v80 = v11;
      brc_bread_crumbs();
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v82 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
        -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.4();
    }

    v11 = v80;
    goto LABEL_11;
  }
LABEL_87:

}

- (id)itemForCreatedDocumentsDirectory:(id)a3 appLibrary:(id)a4 path:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BRCItemToPathLookup *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "defaultClientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dbRowID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCItemID documentsItemIDWithAppLibraryRowID:](BRCItemID, "documentsItemIDWithAppLibraryRowID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemByItemID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[BRCFSReader itemForCreatedDocumentsDirectory:appLibrary:path:].cold.1();

    objc_msgSend(v8, "documentsFolderItemID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "learnItemID:serverItem:path:markLost:", v18, 0, v9, 0);
    v17 = v7;
    goto LABEL_10;
  }
  if (!objc_msgSend(v13, "isOnDisk"))
    goto LABEL_4;
  v14 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v13);
  -[BRCItemToPathLookup byFileSystemID](v14, "byFileSystemID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "exists");

  -[BRCItemToPathLookup closePaths](v14, "closePaths");
  v17 = v7;
  if ((v16 & 1) == 0)
  {
LABEL_4:
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[BRCFSReader itemForCreatedDocumentsDirectory:appLibrary:path:].cold.2();

    v17 = v13;
LABEL_10:

  }
  v22 = v17;

  return v22;
}

- (void)fseventOnDirectory:(id)a3 flags:(unsigned int)a4 lookup:(id)a5
{
  __int16 v6;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  __int16 v62;
  void *v63;
  void *v64;
  int v65;
  uint64_t v66;
  _BOOL4 v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  NSObject *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  BRCFSReader *v78;
  __int16 v79;
  void *v80;
  void *v81;
  void *v82;
  uint8_t buf[4];
  id v84;
  __int16 v85;
  id v86;
  __int16 v87;
  _QWORD v88[3];

  v6 = a4;
  v88[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "byFileIDGlobally");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BRCFSReader needsLookupReloadAfterHandlingCrossZoneMoveWithItem:relpath:](self, "needsLookupReloadAfterHandlingCrossZoneMoveWithItem:relpath:", v10, v8);
  if (v11 == 4)
  {
    v14 = 0;
    v15 = 0;
    goto LABEL_86;
  }
  if (v11 == 2)
  {

    objc_msgSend(v9, "byFileID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.5();
      v10 = 0;
LABEL_96:

    }
  }
  else if (v10 && (objc_msgSend(v10, "isOnDisk") & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.4();
    goto LABEL_96;
  }
  objc_msgSend(v9, "byPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v10, "isDirectory");
  if (v10 && (v16 & 1) != 0)
  {
    v14 = 0;
    goto LABEL_52;
  }
  if (v15 && objc_msgSend(v15, "isDirectory"))
  {
    objc_msgSend(v15, "st");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fileID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "unsignedLongLongValue");

    if ((objc_msgSend(v15, "isAlmostDead") & 1) != 0)
    {
      v20 = 2;
      goto LABEL_18;
    }
    objc_msgSend(v8, "session");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = +[BRCRelativePath locateByFileID:session:](BRCRelativePath, "locateByFileID:session:", v19, v21);

    if (v20)
    {
LABEL_18:
      v22 = v15;
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        v84 = v22;
        v85 = 2112;
        v86 = v8;
        v87 = 1024;
        LODWORD(v88[0]) = v20;
        WORD2(v88[0]) = 2112;
        *(_QWORD *)((char *)v88 + 6) = v23;
        _os_log_debug_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] directory %@ changed fileID at %@ %{errno}d%@", buf, 0x26u);
      }
LABEL_50:

      goto LABEL_51;
    }
    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[BRCFSReader fseventOnDirectory:flags:lookup:].cold.5();

  }
  if (-[BRCFSReader _createSharedZoneIfNecessaryWithLookup:](self, "_createSharedZoneIfNecessaryWithLookup:", v9))
  {
    v14 = v10;
    v10 = 0;
    goto LABEL_86;
  }
  v79 = v6;
  objc_msgSend(v8, "appLibrary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "relpathOfItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parentItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "itemGlobalID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = +[BRCLocalItem newItemWithPath:parentGlobalID:](BRCLocalItem, "newItemWithPath:parentGlobalID:", v28, v30);

  v81 = v27;
  if (objc_msgSend(v8, "type") == 5 && objc_msgSend(v27, "includesDataScope"))
  {
    objc_msgSend(v8, "filename");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D10D98]);

    v22 = v31;
    if (v33)
    {
      -[BRCFSReader itemForCreatedDocumentsDirectory:appLibrary:path:](self, "itemForCreatedDocumentsDirectory:appLibrary:path:", v31, v81, v8);
      v34 = objc_claimAutoreleasedReturnValue();

      v22 = (id)v34;
    }
  }
  else
  {
    v22 = v31;
  }
  objc_msgSend(v22, "itemID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isDocumentsFolder");

  if ((v36 & 1) == 0)
  {
    objc_msgSend(v9, "serverByPath");
    v24 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isDirectory](v24, "isDirectory"))
    {
      objc_msgSend(v22, "clientZone");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject itemID](v24, "itemID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "existsByItemID:", v38);

      if ((v39 & 1) == 0)
      {
        brc_bread_crumbs();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          -[BRCFSReader fseventOnDirectory:flags:lookup:].cold.4();

        -[NSObject itemID](v24, "itemID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "learnItemID:serverItem:path:markLost:", v40, v24, v8, 0);
        goto LABEL_45;
      }
      if (objc_msgSend(v22, "isFromInitialScan"))
      {
        objc_msgSend(v22, "clientZone");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject itemID](v24, "itemID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "itemByItemID:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          v77 = v42;
          v43 = objc_msgSend(v42, "isReserved");

          if (v43)
          {
            brc_bread_crumbs();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
              -[BRCFSReader fseventOnDirectory:flags:lookup:].cold.3();

            objc_msgSend(v77, "markNeedsDeleteForRescheduleOfItem:", 0);
            objc_msgSend(v77, "saveToDB");
            -[NSObject itemID](v24, "itemID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "learnItemID:serverItem:path:markLost:", v40, v24, v8, 0);
            goto LABEL_46;
          }
LABEL_41:
          v6 = v79;
LABEL_47:
          brc_bread_crumbs();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v84 = v22;
            v85 = 2112;
            v86 = v8;
            v87 = 2112;
            v88[0] = v48;
            _os_log_debug_impl(&dword_1CBD43000, v49, OS_LOG_TYPE_DEBUG, "[DEBUG] creating new directory %@ at %@%@", buf, 0x20u);
          }

          v23 = v81;
          goto LABEL_50;
        }

LABEL_45:
        v77 = 0;
LABEL_46:
        v6 = v79;

        goto LABEL_47;
      }
    }
    v77 = 0;
    goto LABEL_41;
  }
  v6 = v79;
  v23 = v81;
LABEL_51:

  v14 = v10;
  v10 = v22;
LABEL_52:
  v50 = objc_msgSend(v10, "needsInsert");
  if (!v50)
  {
    v62 = v6;
    objc_msgSend(v9, "parentItem");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "itemGlobalID");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v10, "updateFromFSAtPath:parentGlobalID:", v8, v64);

    if (!v65)
    {
      -[BRCFSReader reset](self, "reset");
      goto LABEL_86;
    }
    v66 = objc_msgSend(v10, "diffAgainstOriginalItem");
    if ((v66 & 0xC00000000) == 0)
    {
      v68 = v66;
      objc_msgSend(v10, "orig");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v61, "isLost");
      v67 = 1;
      if ((v62 & 0xB01) == 0)
        v67 = (v69 & 1) != 0 || (v68 & 0x1000000060) != 0;
      v50 = 0;
      goto LABEL_71;
    }
LABEL_60:
    v67 = 1;
    v50 = 1;
    goto LABEL_72;
  }
  if (!objc_msgSend(v8, "isBundle"))
    goto LABEL_60;
  v78 = self;
  objc_msgSend(v8, "appLibrary");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCPathToItemLookup lookupForRelativePath:](BRCPathToItemLookup, "lookupForRelativePath:", v8);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "clientZone");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "filename");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "br_pathExtension");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "length");

  v82 = v52;
  if (!v55)
  {
    brc_bread_crumbs();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v84 = v8;
      v85 = 2112;
      v86 = v59;
      _os_log_impl(&dword_1CBD43000, v60, OS_LOG_TYPE_DEFAULT, "[WARNING] Scanning an extensionless directory with a kBundle bit set as a directory at '%@'%@", buf, 0x16u);
    }
    v61 = v80;
    goto LABEL_65;
  }
  objc_msgSend(v52, "serverZone");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "changeState");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "changeToken");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    brc_bread_crumbs();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = v80;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v84 = v8;
      v85 = 2112;
      v86 = v59;
      _os_log_impl(&dword_1CBD43000, v60, OS_LOG_TYPE_DEFAULT, "[WARNING] Scanning directory with a kBundle bit set as a directory at '%@'%@", buf, 0x16u);
    }
LABEL_65:
    self = v78;

    v67 = 1;
LABEL_71:

LABEL_72:
    objc_msgSend(v10, "markNeedsUploadOrSyncingUp");
    if (v15 && v15 != v10)
    {
      objc_msgSend(v15, "markLostWhenReplacedByItem:", v10);
      objc_msgSend(v15, "saveToDB");
    }
    if (v14)
    {
      if (v14 == v10)
      {
        brc_bread_crumbs();
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
          -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.2();

      }
      objc_msgSend(v14, "markLostWhenReplacedByItem:", v10);
      objc_msgSend(v14, "saveToDB");
    }
    if (v67)
    {
      if (self->_currentScan)
      {
        v70 = objc_msgSend(v8, "fileID");
        -[BRCAsyncDirectoryEnumerator rootPath](self->_currentScan, "rootPath");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "fileID");

        if (v70 == v72)
          -[BRCFSReader _cancelScan](self, "_cancelScan");
      }
      if (v50)
        objc_msgSend(v10, "markLostClearGenerationID:backoffMode:", 1, 0);
      else
        objc_msgSend(v10, "markLostWhenReplacedByItem:", 0);
    }
    objc_msgSend(v10, "saveToDB");
    goto LABEL_86;
  }
  brc_bread_crumbs();
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v74 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    -[BRCFSReader fseventOnDirectory:flags:lookup:].cold.2();

  objc_msgSend(v80, "setStateBits:", 0x80000);
LABEL_86:

}

- (void)scanContainerDocumentsIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BRCFSReader *v17;
  uint64_t v18[3];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  objc_msgSend(v4, "documentsPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCFSReader scanContainerDocumentsIfNeeded:]", 1440, v18);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v12 = v18[0];
    objc_msgSend(v4, "appLibraryID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v20 = v12;
    v21 = 2112;
    v22 = v13;
    v23 = 2112;
    v24 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx scanning documents folder for %@%@", buf, 0x20u);

  }
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__BRCFSReader_scanContainerDocumentsIfNeeded___block_invoke;
  v14[3] = &unk_1E8761D60;
  v10 = v6;
  v15 = v10;
  v11 = v4;
  v16 = v11;
  v17 = self;
  objc_msgSend(v9, "performWithFlags:action:", 4, v14);

  __brc_leave_section(v18);
}

uint64_t __46__BRCFSReader_scanContainerDocumentsIfNeeded___block_invoke(uint64_t a1)
{
  BRCPathToItemLookup *v2;
  void *v3;
  void *v4;
  void *v5;

  if (objc_msgSend(*(id *)(a1 + 32), "resolveAndKeepOpenMustExist:error:", 1, 0))
  {
    v2 = -[BRCPathToItemLookup initWithRelativePath:]([BRCPathToItemLookup alloc], "initWithRelativePath:", *(_QWORD *)(a1 + 32));
    if ((objc_msgSend(*(id *)(a1 + 40), "isCloudDocsAppLibrary") & 1) != 0
      || objc_msgSend(*(id *)(a1 + 40), "isiCloudDesktopAppLibrary"))
    {
      v3 = *(void **)(a1 + 48);
      -[BRCPathToItemLookup relpathOfItem](v2, "relpathOfItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "fseventOnContainer:flags:", v4, 131073);
    }
    else
    {
      v5 = *(void **)(a1 + 48);
      -[BRCPathToItemLookup relpathOfItem](v2, "relpathOfItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fseventOnDirectory:flags:lookup:", v4, 131073, v2);
    }

    objc_msgSend(*(id *)(a1 + 32), "close");
  }
  return 1;
}

- (void)_refaultItem:(id)a3 withFaultPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[6];
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = objc_msgSend(a4, "fileID");
  objc_msgSend(v6, "clientZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__BRCFSReader__refaultItem_withFaultPath___block_invoke;
  v12[3] = &unk_1E875D8C8;
  v13 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__BRCFSReader__refaultItem_withFaultPath___block_invoke_2;
  v11[3] = &unk_1E8765758;
  v11[4] = self;
  v10 = v6;
  objc_msgSend(v9, "performWithFlags:action:whenFlushed:", 4, v12, v11);

}

uint64_t __42__BRCFSReader__refaultItem_withFaultPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "clientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverItemByItemID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markNeedsDeleteForRescheduleOfItem:", v5);

  objc_msgSend(*(id *)(a1 + 32), "saveToDBForServerEdit:keepAliases:", 0, 1);
  return 1;
}

void __42__BRCFSReader__refaultItem_withFaultPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  int32_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int *v7;
  char *v8;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "volume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceID");

  if ((BRCUnlinkFileID(v3, *(_QWORD *)(a1 + 40)) & 0x80000000) != 0)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = __error();
      v8 = strerror(*v7);
      v9[0] = 67109890;
      v9[1] = v3;
      v10 = 2048;
      v11 = v6;
      v12 = 2080;
      v13 = v8;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to unlink dev:%d fileID:%llu: %s%@", (uint8_t *)v9, 0x26u);
    }

  }
}

- (void)_fseventOnDocument:(id)a3 flags:(unsigned int)a4 options:(unint64_t)a5 item:(id)a6 lookup:(id)a7 unresolvedLastPathComponent:(id)a8
{
  char v11;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  char v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  int v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *p_super;
  NSObject *v64;
  NSObject *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  NSObject *v78;
  const char *v79;
  NSObject *v80;
  uint32_t v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  char v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  NSObject *v96;
  int v97;
  NSObject *v98;
  NSObject *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  char v104;
  NSObject *v105;
  NSObject *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  NSObject *v111;
  void *v112;
  NSObject *v113;
  NSObject *v114;
  void *v115;
  void *v116;
  char v117;
  void *v118;
  NSObject *v119;
  void *v120;
  NSObject *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  char v127;
  void *v128;
  void *v129;
  char v130;
  void *v131;
  void *v132;
  void *v133;
  double v134;
  double v135;
  void *v136;
  NSObject *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  void *v141;
  BRCItemDBRowIDAndZoneJobIdentifier *v142;
  void *v143;
  NSObject *v144;
  void *v145;
  BRCFSReader *v146;
  void *v147;
  NSObject *v148;
  void *v149;
  NSObject *v150;
  void *v151;
  NSObject *v152;
  int v153;
  BRCItemToPathLookup *v154;
  void *v155;
  char v156;
  char v157;
  char v158;
  void *v160;
  id v161;
  id v162;
  BRCFSReader *v163;
  void *v164;
  _QWORD v165[4];
  NSObject *v166;
  uint8_t buf[4];
  NSObject *v168;
  __int16 v169;
  NSObject *v170;
  __int16 v171;
  NSObject *v172;
  uint64_t v173;

  v11 = a5;
  v173 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  objc_msgSend(v13, "appLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v13;
  if ((objc_msgSend(v18, "isInPackage") & 1) != 0)
  {
    objc_msgSend(v18, "pathOfPackageRoot");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = v18;
  }
  v20 = v19;
  v21 = -[BRCFSReader needsLookupReloadAfterHandlingCrossZoneMoveWithItem:relpath:](self, "needsLookupReloadAfterHandlingCrossZoneMoveWithItem:relpath:", v14, v18);
  if (!v20)
  {
    v158 = v11;
    v145 = v17;
    v146 = self;
    brc_bread_crumbs();
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v148 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v148, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:].cold.13();

    self = v146;
    v17 = v145;
    v11 = v158;
  }
  if (v21 == 4)
  {
    v24 = 0;
    v25 = 0;
    goto LABEL_147;
  }
  v163 = self;
  v161 = v18;
  v156 = v11;
  if (v21 == 2)
  {

    objc_msgSend(v15, "byDocumentID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v17;
    if (!v22)
    {
      v14 = 0;
LABEL_14:
      v26 = 1;
      goto LABEL_15;
    }
    brc_bread_crumbs();
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v150 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v150, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:].cold.12();
    v14 = 0;
    v26 = 1;
  }
  else
  {
    if (!v14)
    {
      v23 = v17;
      goto LABEL_14;
    }
    v23 = v17;
    if ((-[NSObject isOnDisk](v14, "isOnDisk") & 1) != 0)
    {
      v26 = 0;
      goto LABEL_15;
    }
    brc_bread_crumbs();
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v150 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v150, OS_LOG_TYPE_FAULT))
      -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.4();
    v26 = 0;
  }

LABEL_15:
  objc_msgSend(v15, "byPath");
  v27 = objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    objc_msgSend(v15, "relpathOfItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "filename");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqualToString:", v16);

    if ((v30 & 1) != 0)
    {
      v27 = 0;
    }
    else
    {
      objc_msgSend(v15, "byPathWithLastPathComponent:", v16);
      v27 = objc_claimAutoreleasedReturnValue();
    }
  }
  v31 = (void *)v27;
  objc_msgSend(v15, "byFileID");
  v32 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject isReserved](v14, "isReserved"))
  {
    brc_bread_crumbs();
    v33 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v168 = v33;
      _os_log_impl(&dword_1CBD43000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] We shouldn't go through that path, but learn the new state of the item anyway%@", buf, 0xCu);
    }

  }
  v164 = v15;
  v162 = v16;
  if (-[NSObject isFault](v14, "isFault"))
  {
    -[NSObject st](v14, "st");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "fileID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "unsignedLongLongValue");
    v38 = -[NSObject fileID](v20, "fileID");

    if (v37 == v38)
    {
      -[NSObject filename](v20, "filename");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject st](v14, "st");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "filename");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v39, "isEqualToString:", v41);

      v16 = v162;
      if ((v42 & 1) == 0)
      {
        brc_bread_crumbs();
        v43 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v168 = v43;
          _os_log_impl(&dword_1CBD43000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] Someone changed the filename of a fault, we don't support that, delete the fault, and schedule it being recreated%@", buf, 0xCu);
        }

        -[BRCFSReader _refaultItem:withFaultPath:](v163, "_refaultItem:withFaultPath:", v14, v20);
        v45 = v23;
        v15 = v164;
        v18 = v161;
        v25 = v31;
        v24 = v32;
        v17 = v45;
        goto LABEL_147;
      }
    }
    else
    {
      v16 = v162;
      if ((-[NSObject isFault](v20, "isFault") & 1) == 0)
      {
        brc_bread_crumbs();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:].cold.10();

        -[NSObject forceVersionConflictByClearkingCKInfo](v14, "forceVersionConflictByClearkingCKInfo");
      }
    }
  }
  if ((v26 & 1) != 0)
  {
    v160 = v23;
    v15 = v164;
    if (-[NSObject isFault](v20, "isFault"))
    {
      brc_bread_crumbs();
      v48 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v49 = objc_claimAutoreleasedReturnValue();
      v18 = v161;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v168 = v20;
        v169 = 2112;
        v170 = v48;
        _os_log_impl(&dword_1CBD43000, v49, OS_LOG_TYPE_DEFAULT, "[WARNING] unlinking side-fault because we don't know its documentID at %@%@", buf, 0x16u);
      }

      -[BRCAccountSession fileUnlinker](v163->super._session, "fileUnlinker");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject absolutePath](v20, "absolutePath");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "renameAndUnlinkInBackgroundItemAtPath:", v51);

      v14 = 0;
      v25 = v31;
      v24 = v32;
      goto LABEL_81;
    }
    v65 = v32;
    v18 = v161;
    if (-[NSObject isDocument](v20, "isDocument")
      && -[NSObject isDirectory](v32, "isDirectory"))
    {
      v66 = -[NSObject birthTime](v20, "birthTime");
      -[NSObject st](v32, "st");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "birthtime");

      if (v66 != v68)
      {
        brc_bread_crumbs();
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v152 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v152, OS_LOG_TYPE_FAULT))
          -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:].cold.1();

        v15 = v164;
        v65 = v32;
      }
      -[NSObject st](v65, "st");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "filename");
      v70 = objc_claimAutoreleasedReturnValue();
      if (v70)
      {
        v71 = (void *)v70;
        -[NSObject filename](v20, "filename");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v65;
        -[NSObject st](v65, "st");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "filename");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v157 = objc_msgSend(v72, "isEqualToString:", v75);

        v15 = v164;
        v76 = v31;
        if ((v157 & 1) != 0)
        {
          brc_bread_crumbs();
          v77 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v78 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v24 = v73;
            v168 = v73;
            v169 = 2112;
            v170 = v77;
            v79 = "[WARNING] Folder %@ became a package%@";
            v80 = v78;
            v81 = 22;
LABEL_85:
            _os_log_impl(&dword_1CBD43000, v80, OS_LOG_TYPE_DEFAULT, v79, buf, v81);
LABEL_87:

            objc_msgSend(v15, "parentItem");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "itemGlobalID");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = -[NSObject updateFromFSAtPath:parentGlobalID:](v24, "updateFromFSAtPath:parentGlobalID:", v20, v103);

            v17 = v160;
            if ((v104 & 1) == 0)
            {
              brc_bread_crumbs();
              v105 = objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v106 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412802;
                v168 = v24;
                v169 = 2112;
                v170 = v20;
                v171 = 2112;
                v172 = v105;
                _os_log_fault_impl(&dword_1CBD43000, v106, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to update item %@ from %@ during transmogirifcation%@", buf, 0x20u);
              }

            }
            -[NSObject markLostClearGenerationID:backoffMode:](v24, "markLostClearGenerationID:backoffMode:", 0, 2);
            -[NSObject saveToDB](v24, "saveToDB");
            -[BRCAccountSession itemTransmogrifier](v163->super._session, "itemTransmogrifier");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject asDirectory](v24, "asDirectory");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject absolutePath](v20, "absolutePath");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "scheduleDirectoryToPackageTransmogrification:absolutePath:", v108, v109);

            v14 = 0;
            v16 = v162;
            v25 = v76;
            goto LABEL_147;
          }
          goto LABEL_86;
        }
      }
      else
      {
        v73 = v65;

        v76 = v31;
      }
      brc_bread_crumbs();
      v77 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v24 = v73;
        v168 = v73;
        v169 = 2112;
        v170 = v20;
        v171 = 2112;
        v172 = v77;
        v79 = "[WARNING] Folder %@ was renamed to package %@%@";
        v80 = v78;
        v81 = 32;
        goto LABEL_85;
      }
LABEL_86:
      v24 = v73;
      goto LABEL_87;
    }
    if (-[BRCFSReader _createSharedZoneIfNecessaryWithLookup:](v163, "_createSharedZoneIfNecessaryWithLookup:", v164))
    {
      v14 = 0;
      v25 = v31;
LABEL_80:
      v24 = v32;
LABEL_81:
      v17 = v160;
      goto LABEL_147;
    }
    objc_msgSend(v164, "relpathOfItem");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "parentItem");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "itemGlobalID");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = +[BRCLocalItem newItemWithPath:parentGlobalID:](BRCLocalItem, "newItemWithPath:parentGlobalID:", v82, v84);
    objc_msgSend(v85, "asDocument");
    v14 = objc_claimAutoreleasedReturnValue();

    v25 = v31;
    if (!v14)
    {
      v16 = v162;
      v15 = v164;
      goto LABEL_80;
    }
    v155 = v31;
    v15 = v164;
    v24 = v32;
    if ((objc_msgSend(v160, "state") & 0x800) == 0)
      goto LABEL_100;
    objc_msgSend(v164, "serverByPath");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v86, "isDocument"))
    {
      v93 = 0;
LABEL_99:

LABEL_100:
      brc_bread_crumbs();
      p_super = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v168 = v14;
        v169 = 2112;
        v170 = v20;
        v171 = 2112;
        v172 = p_super;
        _os_log_debug_impl(&dword_1CBD43000, v64, OS_LOG_TYPE_DEBUG, "[DEBUG] creating new document %@ at %@%@", buf, 0x20u);
      }
      v17 = v160;
      goto LABEL_103;
    }
    -[NSObject clientZone](v14, "clientZone");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "itemID");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v87, "existsByItemID:", v88);

    if ((v89 & 1) != 0)
    {
      -[NSObject clientZone](v14, "clientZone");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "itemID");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "itemByItemID:", v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v92;
      if (v92)
      {
        v94 = objc_msgSend(v92, "isReserved");

        if (!v94)
        {
LABEL_98:
          v15 = v164;
          goto LABEL_99;
        }
        brc_bread_crumbs();
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v96 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
          -[BRCFSReader fseventOnDirectory:flags:lookup:].cold.3();

        objc_msgSend(v93, "markNeedsDeleteForRescheduleOfItem:", 0);
        objc_msgSend(v93, "saveToDB");
        objc_msgSend(v86, "itemID");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject learnItemID:serverItem:path:markLost:](v14, "learnItemID:serverItem:path:markLost:", v90, v86, v20, 0);
      }
      else
      {

      }
    }
    else
    {
      brc_bread_crumbs();
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v111 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
        -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:].cold.7();

      objc_msgSend(v86, "itemID");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject learnItemID:serverItem:path:markLost:](v14, "learnItemID:serverItem:path:markLost:", v90, v86, v20, 0);
      v93 = 0;
    }

    goto LABEL_98;
  }
  v52 = v23;
  if ((-[NSObject isFault](v14, "isFault") & 1) == 0 && -[NSObject isFault](v20, "isFault"))
  {
    -[BRCFSReader _refaultItem:withFaultPath:](v163, "_refaultItem:withFaultPath:", v14, v20);
    brc_bread_crumbs();
    v53 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v54 = objc_claimAutoreleasedReturnValue();
    v15 = v164;
    v18 = v161;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v168 = v14;
      v169 = 2112;
      v170 = v20;
      v171 = 2112;
      v172 = v53;
      _os_log_fault_impl(&dword_1CBD43000, v54, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item was turned into a fault on disk:\nitem %@\nrelpath %@%@", buf, 0x20u);
    }

    v25 = v31;
    v24 = v32;
    v17 = v52;
    goto LABEL_147;
  }
  v15 = v164;
  v18 = v161;
  if (-[NSObject hardlinkCount](v20, "hardlinkCount") < 2)
  {
    v57 = v31;
    goto LABEL_57;
  }
  -[NSObject clientZone](v14, "clientZone");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "isPrivateZone");

  v57 = v31;
  if (!v56)
  {
LABEL_57:
    v24 = v32;
    v17 = v52;
    goto LABEL_104;
  }
  v155 = v31;
  v58 = -[NSObject parentFileID](v20, "parentFileID");
  -[NSObject parentFileID](v14, "parentFileID");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v32;
  if (v58 == objc_msgSend(v59, "unsignedLongLongValue"))
  {
    -[NSObject filename](v20, "filename");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject st](v14, "st");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "filename");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = objc_msgSend(v60, "isEqualToString:", v62);

    v16 = v162;
    v17 = v52;
    if (v153)
    {
      brc_bread_crumbs();
      p_super = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:].cold.8();
LABEL_78:
      v15 = v164;
LABEL_103:

      v57 = v155;
LABEL_104:
      v112 = v57;
      if ((-[NSObject isBusy](v20, "isBusy") & 1) != 0
        || (-[NSObject needsInsert](v14, "needsInsert") & 1) != 0
        || -[NSObject changedAtRelativePath:scanPackage:](v14, "changedAtRelativePath:scanPackage:", v18, 1))
      {
        if (-[NSObject isFault](v20, "isFault"))
        {
          brc_bread_crumbs();
          v113 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v114 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v168 = v20;
            v169 = 2112;
            v170 = v14;
            v171 = 2112;
            v172 = v113;
            _os_log_impl(&dword_1CBD43000, v114, OS_LOG_TYPE_DEFAULT, "[WARNING] Ignoring read on edited fault at %@ for %@%@", buf, 0x20u);
          }

        }
        else
        {
          -[NSObject markNeedsReading](v14, "markNeedsReading");
        }
      }
      objc_msgSend(v15, "parentItem");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "itemGlobalID");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = -[NSObject updateLocationAndMetaFromFSAtPath:parentGlobalID:](v14, "updateLocationAndMetaFromFSAtPath:parentGlobalID:", v20, v116);

      if ((v117 & 1) == 0)
      {
        brc_bread_crumbs();
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v119 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_FAULT))
          -[BRCFSReader readUnderCoordinationWithLookup:].cold.5();

      }
      if (-[NSObject needsInsert](v14, "needsInsert")
        && -[NSObject isFile](v20, "isFile")
        && !-[NSObject size](v20, "size"))
      {
        brc_bread_crumbs();
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v121 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
          -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:].cold.4();

        -[NSObject markLostClearGenerationID:backoffMode:](v14, "markLostClearGenerationID:backoffMode:", 0, 1);
      }
      -[BRCAccountSession analyticsReporter](v163->super._session, "analyticsReporter");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = -[NSObject fileID](v20, "fileID");
      v124 = -[NSObject fsGenerationID](v20, "fsGenerationID");
      v165[0] = MEMORY[0x1E0C809B0];
      v165[1] = 3221225472;
      v165[2] = __88__BRCFSReader__fseventOnDocument_flags_options_item_lookup_unresolvedLastPathComponent___block_invoke;
      v165[3] = &unk_1E87613A8;
      v14 = v14;
      v166 = v14;
      objc_msgSend(v122, "lookupFSEventToSyncUpEventByFileID:genID:accessor:", v123, v124, v165);

      v25 = v112;
      if (v112)
      {
        objc_msgSend(v112, "itemID");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject itemID](v14, "itemID");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = objc_msgSend(v125, "isEqualToItemID:", v126);

        v25 = v112;
        if ((v127 & 1) == 0)
        {
          if (objc_msgSend(v112, "isDead"))
            objc_msgSend(v112, "moveAsideLocally");
          else
            objc_msgSend(v112, "markLostWhenReplacedByItem:", v14);
          objc_msgSend(v112, "saveToDB");
        }
      }
      if (v24)
      {
        if (v24 != v14)
        {
          -[NSObject itemID](v24, "itemID");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject itemID](v14, "itemID");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = objc_msgSend(v128, "isEqualToItemID:", v129);

          v25 = v112;
          if ((v130 & 1) == 0)
          {
            -[NSObject markLostWhenReplacedByItem:](v24, "markLostWhenReplacedByItem:", v14);
            -[NSObject saveToDB](v24, "saveToDB");
          }
        }
      }
      if (-[NSObject needsReading](v14, "needsReading"))
      {
        -[NSObject saveToDB](v14, "saveToDB");
        v16 = v162;
        if (-[NSObject isPackageRoot](v20, "isPackageRoot"))
        {
          if ((v156 & 1) != 0)
          {
            brc_bread_crumbs();
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v144 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v144, OS_LOG_TYPE_DEBUG))
              -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:].cold.3();

            -[BRCFSReader _scheduleCoordinatedReadForItem:path:](v163, "_scheduleCoordinatedReadForItem:path:", v14, v20);
          }
          else
          {
            -[NSObject serverZone](v14, "serverZone");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "metadataSyncContext");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v132, "defaults");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v133, "readerPackageProcessingDelay");
            v135 = v134;

            brc_bread_crumbs();
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v137 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG))
              -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:].cold.2((uint64_t)v136, v137, v138, v135);

            v139 = -[NSObject dbRowID](v14, "dbRowID");
            -[NSObject serverZone](v14, "serverZone");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "dbRowID");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            v142 = -[BRCItemDBRowIDAndZoneJobIdentifier initWithItemDBRowID:zoneRowID:]([BRCItemDBRowIDAndZoneJobIdentifier alloc], "initWithItemDBRowID:zoneRowID:", v139, v141);
            -[BRCFSReader _delayJobID:by:](v163, "_delayJobID:by:", v142, v135);

            v16 = v162;
            v15 = v164;
          }
          v25 = v112;
        }
        else if ((-[NSObject isLost](v14, "isLost") & 1) == 0 && (-[NSObject isBusy](v20, "isBusy") & 1) == 0)
        {
          -[BRCFSReader _attemptSchedulingCoordinatedReadForItem:path:](v163, "_attemptSchedulingCoordinatedReadForItem:path:", v14, v20);
        }
      }
      else
      {
        -[NSObject markNeedsUploadOrSyncingUp](v14, "markNeedsUploadOrSyncingUp");
        -[NSObject saveToDB](v14, "saveToDB");
        v16 = v162;
      }

      goto LABEL_147;
    }
  }
  else
  {

    v17 = v52;
  }
  v154 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v14);
  -[BRCItemToPathLookup byPath](v154, "byPath");
  v64 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject exists](v64, "exists")
    || (v97 = -[NSObject documentID](v64, "documentID"), v97 != -[NSObject documentID](v20, "documentID")))
  {
    brc_bread_crumbs();
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v101 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
      -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:].cold.9();

    p_super = &v154->super;
    -[BRCItemToPathLookup closePaths](v154, "closePaths");
    goto LABEL_78;
  }
  brc_bread_crumbs();
  v98 = objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v99 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v168 = v20;
    v169 = 2112;
    v170 = v64;
    v171 = 2112;
    v172 = v98;
    _os_log_debug_impl(&dword_1CBD43000, v99, OS_LOG_TYPE_DEBUG, "[DEBUG] [hardlink] we got an event at %@\nbut it's still live where we track it, redirect the event to %@%@", buf, 0x20u);
  }

  -[BRCFSReader fseventAtPath:flags:](v163, "fseventAtPath:flags:", v64, a4);
  -[BRCItemToPathLookup closePaths](v154, "closePaths");

  v15 = v164;
  v25 = v155;
LABEL_147:

}

void __88__BRCFSReader__fseventOnDocument_flags_options_item_lookup_unresolvedLastPathComponent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItemID:", v3);

  objc_msgSend(v5, "setIsPackage:", objc_msgSend(*(id *)(a1 + 32), "isPackage"));
  if (objc_msgSend(*(id *)(a1 + 32), "isFault"))
  {
    objc_msgSend(v5, "setContentSize:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "currentVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentSize:", objc_msgSend(v4, "size"));

  }
}

- (void)fseventOnDocument:(id)a3 flags:(unsigned int)a4 lookup:(id)a5
{
  -[BRCFSReader fseventOnDocument:flags:options:lookup:](self, "fseventOnDocument:flags:options:lookup:", a3, *(_QWORD *)&a4, 0, a5);
}

- (void)fseventOnDocument:(id)a3 flags:(unsigned int)a4 options:(unint64_t)a5 lookup:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v11 = a3;
  objc_msgSend(v11, "filename");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[BRCFSReader fseventOnDocument:flags:options:lookup:unresolvedLastPathComponent:](self, "fseventOnDocument:flags:options:lookup:unresolvedLastPathComponent:", v11, v7, a5, v10, v12);

}

- (void)fseventOnDocument:(id)a3 flags:(unsigned int)a4 options:(unint64_t)a5 lookup:(id)a6 unresolvedLastPathComponent:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;

  v9 = *(_QWORD *)&a4;
  v12 = a7;
  v13 = a6;
  v14 = a3;
  objc_msgSend(v13, "byDocumentIDGlobally");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:](self, "_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:", v14, v9, a5, v15, v13, v12);

}

- (void)fseventOnURL:(id)a3 dbFlags:(unsigned int)a4
{
  BRCAccountSession *v6;
  id v7;
  BRCURLToItemLookup *v8;
  id v9;
  void *v10;
  BRCURLToItemLookup *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  BRCAccountSession *v15;
  BRCURLToItemLookup *v16;
  id v17;
  uint8_t buf[4];
  BRCURLToItemLookup *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = self->super._session;
  v7 = a3;
  v8 = -[BRCURLToItemLookup initWithURL:session:]([BRCURLToItemLookup alloc], "initWithURL:session:", v7, v6);

  v17 = 0;
  LOBYTE(v7) = -[BRCURLToItemLookup resolveAndKeepOpenWithError:](v8, "resolveAndKeepOpenWithError:", &v17);
  v9 = v17;
  if ((v7 & 1) != 0)
  {
    -[BRCAccountSession clientDB](v6, "clientDB");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __36__BRCFSReader_fseventOnURL_dbFlags___block_invoke;
    v14[3] = &unk_1E875D8F0;
    v15 = v6;
    v11 = v8;
    v16 = v11;
    objc_msgSend(v10, "performWithFlags:action:", a4 | 4, v14);

    -[BRCURLToItemLookup closePaths](v11, "closePaths");
    v12 = v15;
  }
  else
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v12;
      _os_log_error_impl(&dword_1CBD43000, v13, (os_log_type_t)0x90u, "[ERROR] can't open %@: %@%@", buf, 0x20u);
    }

  }
}

uint64_t __36__BRCFSReader_fseventOnURL_dbFlags___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "fsReader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "relpath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fseventAtPath:flags:", v3, 0);

  return 1;
}

- (unint64_t)_backoffBeforeProcessingLostItemWithStamp:(unint64_t)a3 appLibrary:(id)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;

  objc_msgSend(a4, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "readerLostItemBackoff");
  v7 = brc_interval_to_nsec();

  v8 = brc_current_date_nsec();
  if (v8 - a3 + 10000000 >= v7)
    return 0;
  else
    return v7 - (v8 - a3);
}

- (BOOL)_fetchNextLostItemID:(id *)a3 parentID:(id *)a4 appLibraryRowID:(id *)a5 tooManyScans:(BOOL *)a6 stamp:(int64_t *)a7
{
  void *v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  NSObject *v25;
  NSMutableSet *lostSet;
  NSMutableSet *v27;
  NSMutableSet *v28;
  NSMutableSet *v29;
  char v30;
  void *v31;
  uint64_t v32;
  BOOL v33;
  NSMutableSet *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  NSMutableSet *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t *v49;
  BRCFSReader *v55;
  uint64_t v56;
  _QWORD v57[4];
  NSMutableSet *v58;
  BRCFSReader *v59;
  uint64_t *v60;
  id *v61;
  id *v62;
  id *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = (void *)objc_opt_new();
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v55 = self;
  v10 = self->_lostSet;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v73 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(v14, "deepScanStamp");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v9, "addObject:", v14);
      }
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
    }
    while (v11);
  }

  v16 = objc_msgSend(v9, "count");
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "lostScanDeepScanFirstThreshold");

  *a6 = v16 > v18;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  -[BRCAccountSession appLibraries](v55->super._session, "appLibraries");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v69 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
        if ((objc_msgSend(v23, "state") & 8) != 0)
          objc_msgSend(v9, "addObject:", v23);
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
    }
    while (v20);
  }

  if (objc_msgSend(v9, "count"))
  {
    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[BRCFSReader _fetchNextLostItemID:parentID:appLibraryRowID:tooManyScans:stamp:].cold.1();

  }
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "1", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
LABEL_45:
    -[BRCAccountSession clientDB](v55->super._session, "clientDB");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __80__BRCFSReader__fetchNextLostItemID_parentID_appLibraryRowID_tooManyScans_stamp___block_invoke;
    v57[3] = &unk_1E8765780;
    v34 = v31;
    v60 = &v76;
    v61 = a5;
    v62 = a3;
    v63 = a4;
    v58 = v34;
    v59 = v55;
    objc_msgSend(v48, "performWithFlags:action:", v32, v57);

    v49 = v77;
    *a7 = v77[3];
    v33 = v49[3] != 0x7FFFFFFFFFFFFFFFLL;
    v27 = v58;
    goto LABEL_46;
  }
  lostSet = v55->_lostSet;
  v27 = v9;
  v28 = lostSet;
  if (v27 == v28)
  {
    v33 = 0;
    v34 = v27;
LABEL_46:

    goto LABEL_47;
  }
  v29 = v28;
  if (v28)
    v30 = -[NSMutableSet isEqual:](v27, "isEqual:", v28);
  else
    v30 = 0;

  if (!(v30 & 1 | (v16 > v18)))
  {
    if (-[NSMutableSet count](v27, "count") == 1)
    {
      v35 = (void *)MEMORY[0x1E0DE81D0];
      -[NSMutableSet anyObject](v27, "anyObject");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "dbRowID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "formatInjection:", CFSTR("app_library_rowid != %@"), v37);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("app_library_rowid NOT IN ("));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v39 = v27;
      v40 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
      if (v40)
      {
        v41 = 0;
        v42 = *(_QWORD *)v65;
        do
        {
          v43 = 0;
          v44 = -v41;
          v56 = v41 + v40;
          do
          {
            if (*(_QWORD *)v65 != v42)
              objc_enumerationMutation(v39);
            v45 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v43);
            if (v44 != v43)
              objc_msgSend(v38, "appendString:", CFSTR(", "));
            objc_msgSend(v45, "dbRowID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "appendFormat:", CFSTR("%@"), v46);

            ++v43;
          }
          while (v40 != v43);
          v40 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
          v41 = v56;
        }
        while (v40);
      }

      objc_msgSend(v38, "appendString:", CFSTR(")"));
      v47 = (void *)MEMORY[0x1E0DE81E0];
      v36 = objc_retainAutorelease(v38);
      objc_msgSend(v47, "rawInjection:length:", objc_msgSend(v36, "UTF8String"), objc_msgSend(v36, "length"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 2;
    }

    goto LABEL_45;
  }
  v33 = 0;
LABEL_47:

  _Block_object_dispose(&v76, 8);
  return v33;
}

uint64_t __80__BRCFSReader__fetchNextLostItemID_parentID_appLibraryRowID_tooManyScans_stamp___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void **v9;
  void *v10;
  BRCItemGlobalID *v11;
  void **v12;
  void *v13;
  BRCItemGlobalID *v14;
  void **v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a2, "fetch:", CFSTR("SELECT zone_rowid, item_id, item_parent_zone_rowid, item_parent_id, app_library_rowid, item_processing_stamp FROM client_items WHERE item_state IN (-1,-3)  AND %@ ORDER BY item_processing_stamp LIMIT 1"), *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v3, "next"))
  {
    objc_msgSend(v3, "numberAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectOfClass:atIndex:", objc_opt_class(), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberAtIndex:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectOfClass:atIndex:", objc_opt_class(), 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberAtIndex:", 4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void ***)(a1 + 56);
    v10 = *v9;
    *v9 = (void *)v8;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "longLongAtIndex:", 5);
    v11 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", v4, v5);
    v12 = *(void ***)(a1 + 64);
    v13 = *v12;
    *v12 = v11;

    v14 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", v6, v7);
    v15 = *(void ***)(a1 + 72);
    v16 = *v15;
    *v15 = v14;

    objc_msgSend(v3, "close");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "appLibraryByRowID:", **(_QWORD **)(a1 + 56));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      if ((objc_msgSend(v17, "state") & 4) != 0)
      {
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "containsObject:", v18) & 1) == 0)
        {
          brc_bread_crumbs();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            __80__BRCFSReader__fetchNextLostItemID_parentID_appLibraryRowID_tooManyScans_stamp___block_invoke_cold_3();

          objc_msgSend(*(id *)(a1 + 40), "scheduleAppLibraryForLostScan:", v18);
        }
      }
      else
      {
        brc_bread_crumbs();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(**(id **)(a1 + 64), "itemID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v30 = v18;
          v31 = 2112;
          v32 = v26;
          v33 = 2112;
          v34 = v22;
          _os_log_fault_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: App library %@ is not marked as needs lost, but its item %@ is!%@", buf, 0x20u);

        }
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "containsObject:", v18))
        {
          brc_bread_crumbs();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            __80__BRCFSReader__fetchNextLostItemID_parentID_appLibraryRowID_tooManyScans_stamp___block_invoke_cold_2();

        }
        objc_msgSend(v18, "setStateBits:", 4);
      }
    }
    else
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        __80__BRCFSReader__fetchNextLostItemID_parentID_appLibraryRowID_tooManyScans_stamp___block_invoke_cold_1();

    }
  }

  return 1;
}

- (id)_nextLostItemIDWithBackoff:(int64_t *)a3 appLibrary:(id *)a4 now:(int64_t)a5
{
  id v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  BRCItemGlobalID *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BRCItemGlobalID *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  BRCItemGlobalID *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char v31;
  void *v32;
  NSObject *v33;
  void *v34;
  BRCItemGlobalID *v35;
  BOOL v36;
  uint64_t v37;
  BRCItemGlobalID *v38;
  BRCItemGlobalID *v39;
  BRCItemGlobalID *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  BRCItemGlobalID *v45;
  void *v46;
  void *v47;
  BRCItemGlobalID *v48;
  BRCItemGlobalID *v49;
  char v50;
  void *v51;
  void *v52;
  BRCItemGlobalID *v53;
  BRCItemGlobalID *v54;
  void *v55;
  char v56;
  void *v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  void *v66;
  void *v67;
  int v68;
  NSMutableSet *lostSet;
  BRCItemGlobalID *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  int64_t v81;
  void *v82;
  void *v83;
  BRCItemGlobalID *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t k;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  int v95;
  void *v96;
  NSObject *v97;
  void *v98;
  NSObject *v99;
  uint64_t v100;
  uint64_t v101;
  BRCItemGlobalID *v102;
  void *v104;
  NSObject *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  NSObject *v109;
  void *v110;
  void *v111;
  id *v114;
  BRCItemGlobalID *v115;
  BRCItemGlobalID *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  BRCFSReader *v120;
  NSMutableSet *context;
  void *contexta;
  void *contextb;
  uint64_t v124;
  BRCItemGlobalID *v125;
  BRCItemGlobalID *v126;
  BRCItemGlobalID *v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  BRCItemGlobalID *v136;
  BRCItemGlobalID *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  char v142;
  id location;
  uint64_t v144;
  _BYTE v145[128];
  uint8_t v146[128];
  uint8_t buf[4];
  void *v148;
  __int16 v149;
  uint64_t v150;
  __int16 v151;
  uint64_t v152;
  __int16 v153;
  void *v154;
  _BYTE v155[128];
  uint64_t v156;

  v156 = *MEMORY[0x1E0C80C00];
  location = 0;
  v144 = 0;
  v142 = 1;
  if (a3)
    *a3 = 0;
  if (a4)
  {
    v7 = *a4;
    *a4 = 0;

  }
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v8 = self->_lostSet;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v138, v155, 16);
  v120 = self;
  v114 = a4;
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v139;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    context = v8;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v139 != v13)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * i);
        objc_msgSend(v16, "deepScanStamp");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          v19 = objc_msgSend(v17, "longLongValue");
          if (v19 < v14)
          {
            v20 = v19;
            objc_msgSend(v16, "dbRowID");
            v124 = objc_claimAutoreleasedReturnValue();

            v21 = [BRCItemGlobalID alloc];
            objc_msgSend(v16, "defaultClientZone");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "dbRowID");
            v23 = v10;
            v24 = v13;
            v25 = v11;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "rootItemID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = -[BRCItemGlobalID initWithZoneRowID:itemID:](v21, "initWithZoneRowID:itemID:", v26, v27);

            v13 = v24;
            v10 = v23;

            v11 = (BRCItemGlobalID *)v28;
            v8 = context;
            v12 = (void *)v124;
            v14 = v20;
          }
        }

      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v138, v155, 16);
    }
    while (v10);

    if (v12)
    {
      -[BRCAccountSession appLibraryByRowID:](v120->super._session, "appLibraryByRowID:", v12);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[BRCFSReader _backoffBeforeProcessingLostItemWithStamp:appLibrary:](v120, "_backoffBeforeProcessingLostItemWithStamp:appLibrary:", v14, v29);

      v31 = 0;
      goto LABEL_21;
    }
    self = v120;
  }
  else
  {

    v11 = 0;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v12 = 0;
  v31 = 1;
  if (!-[NSMutableSet count](self->_lostSet, "count"))
  {
    v115 = v11;
    goto LABEL_28;
  }
  v30 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_21:
  brc_bread_crumbs();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    lostSet = v120->_lostSet;
    *(_DWORD *)buf = 138413058;
    v148 = v12;
    v149 = 2048;
    v150 = v30;
    v151 = 2112;
    v152 = (uint64_t)lostSet;
    v153 = 2112;
    v154 = v32;
    _os_log_debug_impl(&dword_1CBD43000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] next deep scan item is %@ backoff: %lld from %@%@", buf, 0x2Au);
  }

  if (v30 < 1)
  {
    contexta = 0;
    v34 = 0;
    self = v120;
LABEL_26:
    v35 = 0;
    v144 = v14;
LABEL_79:
    v11 = v11;

    objc_storeStrong(&location, v12);
    v35 = v11;
    v37 = v14;
    goto LABEL_80;
  }
  v115 = v11;
  self = v120;
LABEL_28:
  v136 = 0;
  v137 = 0;
  v36 = -[BRCFSReader _fetchNextLostItemID:parentID:appLibraryRowID:tooManyScans:stamp:](self, "_fetchNextLostItemID:parentID:appLibraryRowID:tooManyScans:stamp:", &v137, &v136, &location, &v142, &v144);
  v37 = v144;
  v38 = v137;
  v39 = v38;
  if (v36)
  {
    if (v37 >= v14)
    {
      v35 = 0;
      contexta = 0;
      v34 = 0;
    }
    else
    {
      v117 = v37;
      v40 = v38;
      -[BRCAccountSession clientDB](self->super._session, "clientDB");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCItemGlobalID itemID](v136, "itemID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCItemGlobalID zoneRowID](v136, "zoneRowID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v41, "fetch:", CFSTR("WITH RECURSIVE item_parents  (item_id, zone_rowid, item_state, item_processing_stamp, item_type) AS( SELECT item_parent_id, item_parent_zone_rowid, item_state, item_processing_stamp, item_type FROM client_items      WHERE item_id = %@ AND zone_rowid = %@  UNION ALL     SELECT li.item_parent_id, li.item_parent_zone_rowid, li.item_state, li.item_processing_stamp, li.item_type FROM client_items AS li  INNER JOIN item_parents AS p USING (item_id, zone_rowid)      WHERE +app_library_rowid = %@      LIMIT %u) SELECT item_id, zone_rowid, item_state, item_processing_stamp, item_type FROM item_parents"), v42, v43, location, 1000);

      v44 = 0;
      if (objc_msgSend(v34, "next"))
      {
        v45 = v40;
        v39 = v40;
        while (1)
        {
          contextb = (void *)MEMORY[0x1D17A6BE8]();
          v125 = v136;

          objc_msgSend(v34, "objectOfClass:atIndex:", objc_opt_class(), 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "numberAtIndex:", 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", v47, v46);
          v49 = v136;
          v136 = v48;

          v50 = objc_msgSend(v34, "unsignedIntAtIndex:", 2);
          objc_msgSend(v34, "numberAtIndex:", 3);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          v52 = v34;
          if (objc_msgSend(v34, "unsignedIntAtIndex:", 4) == 4)
          {
            objc_msgSend(v34, "close");

            objc_autoreleasePoolPop(contextb);
            v35 = v45;
            v44 = v51;
            v39 = v125;
            goto LABEL_62;
          }
          if (v50 == -1)
          {
            v53 = v125;

            if (!v51)
            {
              brc_bread_crumbs();
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v58 = objc_claimAutoreleasedReturnValue();
              v55 = contextb;
              if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v148 = v57;
                _os_log_fault_impl(&dword_1CBD43000, v58, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Lost item should have a lostStamp%@", buf, 0xCu);
              }

              v44 = 0;
              v54 = v53;
              goto LABEL_38;
            }
            v44 = v51;
            v117 = objc_msgSend(v51, "unsignedLongLongValue");
            v54 = v53;
          }
          else
          {
            v54 = v45;
            v44 = v51;
          }
          v55 = contextb;
LABEL_38:

          objc_autoreleasePoolPop(v55);
          v34 = v52;
          v56 = objc_msgSend(v52, "next");
          v45 = v54;
          v35 = v54;
          v39 = v125;
          if ((v56 & 1) == 0)
            goto LABEL_62;
        }
      }
      v39 = v40;
      v35 = v40;
LABEL_62:
      contexta = v44;
      if (v35 == v137)
      {
        v37 = v117;
        self = v120;
      }
      else
      {
        v37 = v117;
        self = v120;
        if (v117 > v144)
        {
          v126 = v39;
          v70 = v35;
          v110 = v34;
          if (v117 == 0x7FFFFFFFFFFFFFFFLL)
            v71 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v71 = v117 + 1;
          -[BRCAccountSession clientDB](v120->super._session, "clientDB");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCItemGlobalID itemID](v137, "itemID");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCItemGlobalID zoneRowID](v137, "zoneRowID");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "execute:", CFSTR("UPDATE client_items SET item_processing_stamp = %lld WHERE item_id = %@ AND zone_rowid = %@"), v71, v73, v74);

          brc_bread_crumbs();
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
            -[BRCFSReader _nextLostItemIDWithBackoff:appLibrary:now:].cold.4();

          -[BRCAccountSession clientDB](v120->super._session, "clientDB");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend(v77, "changes");

          self = v120;
          if (v78 != 1)
          {
            brc_bread_crumbs();
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v109 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v109, OS_LOG_TYPE_FAULT))
              -[BRCFSReader _nextLostItemIDWithBackoff:appLibrary:now:].cold.3();

            v37 = v117;
            self = v120;
          }
          -[BRCAccountSession appLibraryByRowID:](self->super._session, "appLibraryByRowID:", location);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v70;
          if (objc_msgSend(v79, "maxLostStamp") < v71)
          {
            objc_msgSend(v79, "setMaxLostStamp:", v71);
            objc_msgSend(v79, "setNeedsSave:", 1);
          }

          v34 = v110;
          v39 = v126;
        }
      }
    }
  }
  else
  {
    brc_bread_crumbs();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      -[BRCFSReader _nextLostItemIDWithBackoff:appLibrary:now:].cold.5(&v142);

    if (!v142)
    {
      v118 = v37;
      v134 = 0u;
      v135 = 0u;
      v132 = 0u;
      v133 = 0u;
      -[NSMutableSet allObjects](self->_lostSet, "allObjects");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v132, v146, 16);
      if (v62)
      {
        v63 = v62;
        v64 = *(_QWORD *)v133;
        do
        {
          for (j = 0; j != v63; ++j)
          {
            if (*(_QWORD *)v133 != v64)
              objc_enumerationMutation(v61);
            v66 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * j);
            objc_msgSend(v66, "deepScanStamp");
            v67 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v67)
              objc_msgSend(v66, "clearStateBits:", 2052);
          }
          v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v132, v146, 16);
        }
        while (v63);
      }

      v37 = v118;
      self = v120;
    }
    v35 = 0;
    if ((v31 & 1) != 0)
    {
      v68 = 0;
      contexta = 0;
      v34 = 0;
      goto LABEL_75;
    }
    contexta = 0;
    v34 = 0;
  }
  v68 = 1;
LABEL_75:

  if (!v68)
  {
    v102 = 0;
    v11 = v115;
    goto LABEL_110;
  }
  v11 = v115;
  if (!v35 || v14 < v37)
  {
    if (v35)
      goto LABEL_79;
    goto LABEL_26;
  }
LABEL_80:
  v127 = v35;
  if (!location)
  {
    brc_bread_crumbs();
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _nextLostItemIDWithBackoff:appLibrary:now:].cold.2();

  }
  -[BRCAccountSession appLibraryByRowID:](self->super._session, "appLibraryByRowID:");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = -[BRCFSReader _backoffBeforeProcessingLostItemWithStamp:appLibrary:](self, "_backoffBeforeProcessingLostItemWithStamp:appLibrary:", v37, v80);
  if (!v81)
  {
    -[BRCAccountSession lostItemThrottle](self->super._session, "lostItemThrottle");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCItemGlobalID itemID](v127, "itemID");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v82, "nsecsToNextRetry:now:increment:", objc_msgSend(v80, "throttleHashWithItemID:", v83), a5, 0);

    if (v81 == 0x7FFFFFFFFFFFFFFFLL)
    {
      brc_bread_crumbs();
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v107 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_FAULT))
        -[BRCFSReader _nextLostItemIDWithBackoff:appLibrary:now:].cold.1();

    }
    self = v120;
  }
  if (a3)
    *a3 = v81;
  if (v114)
    objc_storeStrong(v114, v80);
  v84 = v127;
  if (!v142)
  {
    v111 = v34;
    v119 = (void *)v37;
    v116 = v11;
    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    -[NSMutableSet allObjects](self->_lostSet, "allObjects");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v128, v145, 16);
    if (v86)
    {
      v87 = v86;
      v88 = *(_QWORD *)v129;
      do
      {
        for (k = 0; k != v87; ++k)
        {
          if (*(_QWORD *)v129 != v88)
            objc_enumerationMutation(v85);
          v90 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * k);
          objc_msgSend(v90, "deepScanStamp");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          if (v91)
          {

          }
          else
          {
            v92 = objc_msgSend(v90, "maxLostStamp");
            if (v92 < v144)
            {
              objc_msgSend(v80, "dbRowID");
              v93 = objc_claimAutoreleasedReturnValue();
              if (v93
                && (v94 = (void *)v93, v95 = objc_msgSend(v90, "isEqualToAppLibrary:", v80), v94, v95))
              {
                brc_bread_crumbs();
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v97 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v97, OS_LOG_TYPE_FAULT))
                {
                  v101 = objc_msgSend(v90, "maxLostStamp");
                  *(_DWORD *)buf = 138413058;
                  v148 = v90;
                  v149 = 2048;
                  v150 = v101;
                  v151 = 2048;
                  v152 = v144;
                  v153 = 2112;
                  v154 = v96;
                  _os_log_fault_impl(&dword_1CBD43000, v97, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@: maxLostStamp(%lld) must be greater than the shallowestLostStamp(%lld)!%@", buf, 0x2Au);
                }

                objc_msgSend(v90, "setMaxLostStamp:", v144);
                objc_msgSend(v90, "setNeedsSave:", 1);
              }
              else
              {
                brc_bread_crumbs();
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v99 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
                {
                  v100 = objc_msgSend(v90, "maxLostStamp");
                  *(_DWORD *)buf = 134218754;
                  v148 = v119;
                  v149 = 2048;
                  v150 = v100;
                  v151 = 2112;
                  v152 = (uint64_t)v90;
                  v153 = 2112;
                  v154 = v98;
                  _os_log_debug_impl(&dword_1CBD43000, v99, OS_LOG_TYPE_DEBUG, "[DEBUG] shallowestLostStamp %lld > max lost stamp %lld for %@%@", buf, 0x2Au);
                }

                objc_msgSend(v90, "clearStateBits:", 2052);
              }
            }
          }
        }
        v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v128, v145, 16);
      }
      while (v87);
    }

    v11 = v116;
    v34 = v111;
    v84 = v127;
  }
  v35 = v84;

  v102 = v35;
LABEL_110:

  return v102;
}

- (void)_processLostItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  +[BRCItemToPathLookup lookupForItem:](BRCItemToPathLookup, "lookupForItem:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "byFileSystemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[BRCFSReader _processLostItem:resolvedToPath:](self, "_processLostItem:resolvedToPath:", v10, v5);
  }
  else if (objc_msgSend(v10, "isDocument") && objc_msgSend(v4, "fileSystemIDMayStillExist"))
  {
    objc_msgSend(v10, "st");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntValue");
    objc_msgSend(v10, "serverZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCFSReader _resolveDocumentID:zone:](self, "_resolveDocumentID:zone:", v8, v9);

  }
  else
  {
    -[BRCFSReader _processDeadItem:](self, "_processDeadItem:", v10);
  }
  objc_msgSend(v4, "closePaths");

}

- (void)_recoverFromUnknownParentLoopAtPath:(id)a3
{
  id v4;
  BRCRelativePath *v5;
  uint64_t v6;
  void *v7;
  BRCRelativePath *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v16;
  uint8_t buf[4];
  NSObject *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "type") == 6)
  {
    v5 = [BRCRelativePath alloc];
    v6 = objc_msgSend(v4, "parentFileID");
    objc_msgSend(v4, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[BRCRelativePath initWithFileID:session:](v5, "initWithFileID:session:", v6, v7);

    v16 = 0;
    if (-[BRCRelativePath resolveAndKeepOpenMustExist:error:](v8, "resolveAndKeepOpenMustExist:error:", 1, &v16))
    {
      +[BRCPathToItemLookup lookupForRelativePath:](BRCPathToItemLookup, "lookupForRelativePath:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "byFileIDGlobally");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "asDirectory");
      v11 = objc_claimAutoreleasedReturnValue();

      -[BRCRelativePath close](v8, "close");
      if (v11)
      {
        brc_bread_crumbs();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v11;
          v19 = 2112;
          v20 = v12;
          _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Found parent item which clearly needs to be scanned %@%@", buf, 0x16u);
        }

        -[NSObject markLostClearGenerationID:backoffMode:](v11, "markLostClearGenerationID:backoffMode:", 1, 0);
        -[NSObject saveToDB](v11, "saveToDB");
      }
      else
      {
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[BRCFSReader _recoverFromUnknownParentLoopAtPath:].cold.1();

        -[BRCFSReader _recoverFromUnknownParentLoopAtPath:](self, "_recoverFromUnknownParentLoopAtPath:", v8);
      }
    }
    else
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[BRCFSReader _recoverFromUnknownParentLoopAtPath:].cold.2();
    }

  }
  else
  {
    objc_msgSend(v4, "appLibrary");
    v8 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();
    -[BRCRelativePath scheduleDeepScanWithReason:](v8, "scheduleDeepScanWithReason:", CFSTR("unknown parent loop"));
  }

}

- (void)_processLostItem:(id)a3 resolvedToPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  unint64_t lostItemCountUnderUnknownParent;
  void *v18;
  NSObject *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._schedulerWorkloop);
  if (self->_currentScan)
  {
    brc_bread_crumbs();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _processLostItem:resolvedToPath:].cold.4();

  }
  if ((objc_msgSend(v7, "exists") & 1) == 0)
  {
    brc_bread_crumbs();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _processLostItem:resolvedToPath:].cold.3();

  }
  +[BRCPathToItemLookup lookupForRelativePath:](BRCPathToItemLookup, "lookupForRelativePath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isDocument"))
  {
    objc_msgSend(v6, "asDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setByDocumentID:", v9);

  }
  else
  {
    objc_msgSend(v8, "setByFileID:", v6);
  }
  objc_msgSend(v8, "parentItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "parentItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "itemID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v39 = v6;
      v40 = 2112;
      v41 = v7;
      v42 = 2112;
      v43 = v30;
      v44 = 2112;
      v45 = v12;
      _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] located lost item %@ at %@ under parent %@%@", buf, 0x2Au);

    }
    if (objc_msgSend(v6, "needsSyncUp"))
    {
      objc_msgSend(v6, "clientZone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "scheduleSyncUp");

    }
    v36 = v7;
    v37 = v8;
    -[BRCFSReader updateLookupAfterHandlingPathMatchWithFSRoot:relpath:](self, "updateLookupAfterHandlingPathMatchWithFSRoot:relpath:", &v37, &v36);
    v15 = v37;

    v16 = v36;
    lostItemCountUnderUnknownParent = self->_lostItemCountUnderUnknownParent;
    if (lostItemCountUnderUnknownParent)
      self->_lostItemCountUnderUnknownParent = lostItemCountUnderUnknownParent - 1;
    if (v15)
    {
      if (objc_msgSend(v16, "isSymLink"))
      {
        -[BRCFSReader fseventOnSymlink:flags:lookup:](self, "fseventOnSymlink:flags:lookup:", v16, 0, v15);
      }
      else if (objc_msgSend(v16, "isBRAlias"))
      {
        -[BRCFSReader fseventOnAlias:flags:lookup:](self, "fseventOnAlias:flags:lookup:", v16, 0, v15);
      }
      else if ((objc_msgSend(v16, "isDocument") & 1) != 0 || objc_msgSend(v6, "isDocument"))
      {
        -[BRCFSReader fseventOnDocument:flags:options:lookup:](self, "fseventOnDocument:flags:options:lookup:", v16, 0, 2, v15);
      }
      else
      {
        objc_msgSend(v6, "asDirectory");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCFSReader _scanDirectory:atPath:lookup:](self, "_scanDirectory:atPath:lookup:", v31, v16, v15);

      }
    }
    else
    {
      brc_bread_crumbs();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[BRCFSReader _processLostItem:resolvedToPath:].cold.2();

      v15 = 0;
    }
  }
  else
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v39 = v6;
      v40 = 2112;
      v41 = v7;
      v42 = 2112;
      v43 = v18;
      _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] located lost item %@ at %@ under unknown parent%@", buf, 0x20u);
    }

    objc_msgSend(v6, "markLostClearGenerationID:backoffMode:", 0, 2);
    objc_msgSend(v6, "saveToDB");
    v20 = self->_lostItemCountUnderUnknownParent + 1;
    self->_lostItemCountUnderUnknownParent = v20;
    objc_msgSend(v6, "appLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "mangledID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "lostItemUnderUnknownParentBeforeDeepScan");

    if (v20 > v24)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        -[BRCFSReader _processLostItem:resolvedToPath:].cold.1();

      self->_lostItemCountUnderUnknownParent = 0;
      -[BRCFSReader _recoverFromUnknownParentLoopAtPath:](self, "_recoverFromUnknownParentLoopAtPath:", v7);
    }
    v15 = v8;
    v16 = v7;
  }

}

- (void)_resolveDocumentID:(unsigned int)a3 zone:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v4 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if ((_DWORD)v4)
  {
    objc_msgSend(v6, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "volume");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceID");
    v10 = GSLibraryResolveDocumentId2();

    v11 = __error();
    if (v10)
    {
LABEL_12:
      -[BRCFSReader _didResolvedDocumentID:fileID:zone:](self, "_didResolvedDocumentID:fileID:zone:", v4, v10, v7);
      goto LABEL_22;
    }
  }
  else
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _resolveDocumentID:zone:].cold.2();

    *__error() = 2;
    v11 = __error();
  }
  v14 = *v11;
  if (*v11 == 70 || v14 == 2)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v23 = 67109634;
      v24 = v4;
      v25 = 1024;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] GSLibraryResolveDocumentId(%u) %{errno}d%@", (uint8_t *)&v23, 0x18u);
    }

    v10 = 0;
    goto LABEL_12;
  }
  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
  {
    v23 = 67109634;
    v24 = v4;
    v25 = 1024;
    v26 = v14;
    v27 = 2112;
    v28 = v17;
    _os_log_error_impl(&dword_1CBD43000, v18, (os_log_type_t)0x90u, "[ERROR] GSLibraryResolveDocumentId(%u) %{errno}d%@", (uint8_t *)&v23, 0x18u);
  }

  if (v14 != 4 && v14 != 16 && v14 != 78)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _resolveDocumentID:zone:].cold.1();

  }
  objc_msgSend(v7, "clientZone");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "itemByDocumentID:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "markLostClearGenerationID:backoffMode:", 0, 2);
  objc_msgSend(v22, "saveToDB");

LABEL_22:
}

- (void)_didResolvedDocumentID:(unsigned int)a3 fileID:(unint64_t)a4 zone:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  BRCRelativePath *v13;
  void *v14;
  BRCRelativePath *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  const char *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  int v30;
  uint64_t v31[3];
  uint8_t buf[4];
  _BYTE v33[34];
  __int16 v34;
  void *v35;
  uint64_t v36;

  v6 = *(_QWORD *)&a3;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  memset(v31, 0, sizeof(v31));
  __brc_create_section(0, (uint64_t)"-[BRCFSReader _didResolvedDocumentID:fileID:zone:]", 2242, v31);
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v26 = "YES";
    *(_DWORD *)buf = 134219010;
    if (!a4)
      v26 = "NO";
    *(_QWORD *)v33 = v31[0];
    *(_WORD *)&v33[8] = 1024;
    *(_DWORD *)&v33[10] = v6;
    *(_WORD *)&v33[14] = 2048;
    *(_QWORD *)&v33[16] = a4;
    *(_WORD *)&v33[24] = 2080;
    *(_QWORD *)&v33[26] = v26;
    v34 = 2112;
    v35 = v9;
    _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx resolved documentID:%u to fileID:%llu exists:%s%@", buf, 0x30u);
  }

  v30 = 0;
  objc_msgSend(v8, "clientZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemByDocumentID:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    brc_bread_crumbs();
    v15 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
LABEL_15:

LABEL_16:
LABEL_36:
      v15 = 0;
      goto LABEL_37;
    }
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v33 = v6;
    *(_WORD *)&v33[4] = 2048;
    *(_QWORD *)&v33[6] = a4;
    *(_WORD *)&v33[14] = 2112;
    *(_QWORD *)&v33[16] = v15;
    v19 = "[DEBUG] located documentID:%u at fileID:%llu but can't find item%@";
    v20 = v18;
    v21 = 28;
LABEL_41:
    _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
    goto LABEL_15;
  }
  if ((objc_msgSend(v12, "isLost") & 1) == 0)
  {
    brc_bread_crumbs();
    v15 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      goto LABEL_15;
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v33 = v12;
    *(_WORD *)&v33[8] = 2048;
    *(_QWORD *)&v33[10] = a4;
    *(_WORD *)&v33[18] = 2112;
    *(_QWORD *)&v33[20] = v15;
    v19 = "[DEBUG] located %@ at fileID:%llu but item isn't lost%@";
    v20 = v18;
    v21 = 32;
    goto LABEL_41;
  }
  if (!a4)
  {
    brc_bread_crumbs();
    v15 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[BRCFSReader _didResolvedDocumentID:fileID:zone:].cold.1();
LABEL_33:

LABEL_34:
LABEL_35:
    -[BRCFSReader _processDeadItem:](self, "_processDeadItem:", v12);
    goto LABEL_36;
  }
  v13 = [BRCRelativePath alloc];
  objc_msgSend(v8, "session");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[BRCRelativePath initWithFileID:session:](v13, "initWithFileID:session:", a4, v14);

  if (!-[BRCRelativePath resolveAndKeepOpenMustExist:error:](v15, "resolveAndKeepOpenMustExist:error:", 1, &v30))
  {
    if (-[BRCRelativePath isUnresolvableDueToProtection](v15, "isUnresolvableDueToProtection")
      || v30 == 2 && !-[BRCRelativePath isExcluded](v15, "isExcluded"))
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
LABEL_39:

        objc_msgSend(v12, "markLostClearGenerationID:backoffMode:", 0, 2);
        objc_msgSend(v12, "saveToDB");
        -[BRCRelativePath close](v15, "close");
        goto LABEL_16;
      }
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v33 = v12;
      *(_WORD *)&v33[8] = 2048;
      *(_QWORD *)&v33[10] = a4;
      *(_WORD *)&v33[18] = 2112;
      *(_QWORD *)&v33[20] = v23;
      v25 = "[DEBUG] resolved %@ to a stale fileID (%lld), retrying later%@";
LABEL_43:
      _os_log_debug_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_DEBUG, v25, buf, 0x20u);
      goto LABEL_39;
    }
    brc_bread_crumbs();
    v22 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)v33 = self;
      *(_WORD *)&v33[8] = 2048;
      *(_QWORD *)&v33[10] = a4;
      *(_WORD *)&v33[18] = 1024;
      *(_DWORD *)&v33[20] = v30;
      *(_WORD *)&v33[24] = 2112;
      *(_QWORD *)&v33[26] = v22;
      _os_log_debug_impl(&dword_1CBD43000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] resolved %@ to an inaccessible fileID (%lld) %{errno}d%@", buf, 0x26u);
    }

    goto LABEL_33;
  }
  if (!-[BRCRelativePath isDocument](v15, "isDocument"))
  {
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v33 = v12;
      *(_WORD *)&v33[8] = 2112;
      *(_QWORD *)&v33[10] = v15;
      *(_WORD *)&v33[18] = 2112;
      *(_QWORD *)&v33[20] = v27;
      _os_log_debug_impl(&dword_1CBD43000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] relocated %@ to %@ which isn't a document%@", buf, 0x20u);
    }

    objc_msgSend(v12, "scanParentDirectory");
    -[BRCRelativePath close](v15, "close");
    goto LABEL_34;
  }
  if (-[BRCRelativePath documentID](v15, "documentID") != (_DWORD)v6)
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      goto LABEL_39;
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v33 = v12;
    *(_WORD *)&v33[8] = 2112;
    *(_QWORD *)&v33[10] = v15;
    *(_WORD *)&v33[18] = 2112;
    *(_QWORD *)&v33[20] = v23;
    v25 = "[DEBUG] relocated %@ to %@ which just changed documentID%@";
    goto LABEL_43;
  }
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v33 = v12;
    *(_WORD *)&v33[8] = 2112;
    *(_QWORD *)&v33[10] = v15;
    *(_WORD *)&v33[18] = 2112;
    *(_QWORD *)&v33[20] = v16;
    _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] relocated %@ to %@%@", buf, 0x20u);
  }

  if (!v15)
    goto LABEL_35;
  -[BRCFSReader _processLostItem:resolvedToPath:](self, "_processLostItem:resolvedToPath:", v12, v15);
  -[BRCRelativePath close](v15, "close");
LABEL_37:

  __brc_leave_section(v31);
}

- (void)_processDeadItem:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._schedulerWorkloop);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCFSReader _processDeadItem:].cold.1();

  objc_msgSend(v4, "markRemovedFromFilesystemForServerEdit:", 0);
  objc_msgSend(v4, "saveToDB");

}

- (void)_scanDone:(id)a3 atPath:(id)a4 lookup:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "byPath");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = -[BRCFSReader needsLookupReloadAfterHandlingCrossZoneMoveWithItem:relpath:](self, "needsLookupReloadAfterHandlingCrossZoneMoveWithItem:relpath:", v8, v9);
  if (v12 != 4)
  {
    if (v12 == 2)
    {

      objc_msgSend(v10, "byFileID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        brc_bread_crumbs();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.5();

      }
      -[BRCFSReader fseventOnDirectory:flags:lookup:](self, "fseventOnDirectory:flags:lookup:", v9, 131073, v10);
      v8 = 0;
    }
    else
    {
      objc_msgSend(v10, "parentItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "itemGlobalID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v8, "updateFromFSAtPath:parentGlobalID:", v9, v15);

      if ((v16 & 1) != 0)
      {
        if (v11 && v11 != v8)
        {
          objc_msgSend(v11, "markLostWhenReplacedByItem:", v8);
          objc_msgSend(v11, "saveToDB");
        }
        objc_msgSend(v8, "markFound");
        objc_msgSend(v8, "markNeedsUploadOrSyncingUp");
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v8, "clientZonesChildrenNeedingSyncUpAreIn", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v25;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v25 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21++), "scheduleSyncUp");
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v19);
        }

        objc_msgSend(v8, "saveToDB");
      }
      else
      {
        -[BRCFSReader reset](self, "reset");
      }
    }
  }

}

- (void)_scanDirectory:(id)a3 atPath:(id)a4 lookup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._schedulerWorkloop);
  if (self->_currentScan)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _scanDirectory:atPath:lookup:].cold.4();

  }
  if ((objc_msgSend(v9, "isUnixDir") & 1) == 0)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _scanDirectory:atPath:lookup:].cold.3();

  }
  if ((objc_msgSend(v9, "exists") & 1) == 0)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _processLostItem:resolvedToPath:].cold.3();

  }
  if ((objc_msgSend(v8, "isDirectory") & 1) == 0)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _scanDirectory:atPath:lookup:].cold.1();

  }
  objc_msgSend(v8, "_updatePropagatedInfoFromFSAtPath:", v9);
  if (objc_msgSend(v8, "diffAgainstOriginalItem"))
    objc_msgSend(v8, "saveToDB");
  objc_msgSend(v8, "markChildrenLost");
  if ((objc_msgSend(v8, "changedAtRelativePath:scanPackage:", v9, 1) & 1) != 0)
  {
    objc_msgSend(v8, "markLostClearGenerationID:backoffMode:", 0, 0);
    objc_msgSend(v8, "saveToDB");
    if (!-[BRCFSReader _slowScanDirectoryAtPath:](self, "_slowScanDirectoryAtPath:", v9))
      objc_msgSend(v8, "markLostClearGenerationID:backoffMode:", 0, 2);
  }
  else
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v21 = 138412802;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      v25 = 2112;
      v26 = v11;
      _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ hasn't changed at %@%@", (uint8_t *)&v21, 0x20u);
    }

    -[BRCFSReader _scanDone:atPath:lookup:](self, "_scanDone:atPath:lookup:", v8, v9, v10);
  }

}

- (BOOL)_slowScanDirectoryAtPath:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._schedulerWorkloop);
  if (self->_currentScan)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _scanDirectory:atPath:lookup:].cold.4();

  }
  if ((objc_msgSend(v4, "isUnixDir") & 1) == 0)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _scanDirectory:atPath:lookup:].cold.3();

  }
  if ((objc_msgSend(v4, "exists") & 1) == 0)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _processLostItem:resolvedToPath:].cold.3();

  }
  v18 = 0;
  if ((objc_msgSend(v4, "resolveAndKeepOpenMustExist:error:", 1, &v18) & 1) == 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v20 = v4;
      v21 = 1024;
      v22 = v18;
      v23 = 2112;
      v24 = v7;
      _os_log_error_impl(&dword_1CBD43000, v8, (os_log_type_t)0x90u, "[ERROR] failed opening %@ %{errno}d%@", buf, 0x1Cu);
    }

    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _slowScanDirectoryAtPath:].cold.2();
    goto LABEL_13;
  }
  objc_msgSend(v4, "appLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "close");
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _slowScanDirectoryAtPath:].cold.1();
LABEL_13:

    v6 = 0;
    goto LABEL_14;
  }
  -[BRCFSReader _startScanOfRelpath:](self, "_startScanOfRelpath:", v4);
  objc_msgSend(v4, "close");
  v6 = 1;
LABEL_14:

  return v6;
}

- (void)_startScanOfRegularAppLibrary:(id)a3
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
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  int v41;
  uint8_t buf[4];
  _BYTE v43[28];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._schedulerWorkloop);
  if (!self->_currentScan)
  {
    if (v4)
      goto LABEL_3;
    goto LABEL_27;
  }
  brc_bread_crumbs();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    -[BRCFSReader _scanDirectory:atPath:lookup:].cold.4();

  if (!v4)
  {
LABEL_27:
    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      -[BRCItemID(CKConversions) structureRecordIDForItemType:zone:aliasTargetZoneIsShared:].cold.2();

  }
LABEL_3:
  objc_msgSend(v4, "deepScanStamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _startScanOfRegularAppLibrary:].cold.3();

  }
  if (objc_msgSend(v4, "isiCloudDesktopAppLibrary"))
  {
    brc_bread_crumbs();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _startScanOfRegularAppLibrary:].cold.2();

  }
  objc_msgSend(v4, "root");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathRelativeToRoot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathWithChildAtPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0;
  objc_msgSend(v4, "fetchRootItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isNonDesktopRoot") & 1) == 0)
  {
    brc_bread_crumbs();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _startScanOfRegularAppLibrary:].cold.1();

  }
  objc_msgSend(v9, "clientZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markChildrenLostForItemID:inZone:fileID:", v10, v11, v12);

  if ((objc_msgSend(v8, "resolveAndKeepOpenMustExist:error:", 0, &v41) & 1) != 0)
  {
    if (objc_msgSend(v8, "exists"))
    {
      objc_msgSend(v8, "appLibrary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToAppLibrary:", v4);

      if (v14)
      {
        -[BRCFSReader _slowScanDirectoryAtPath:](self, "_slowScanDirectoryAtPath:", v8);
LABEL_19:
        objc_msgSend(v8, "close");
        goto LABEL_20;
      }
      objc_msgSend(v8, "appLibrary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "appLibraryID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appLibraryID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "caseInsensitiveCompare:", v23);

      if (!v24)
      {
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
        {
          objc_msgSend(v8, "appLibrary");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v43 = v4;
          *(_WORD *)&v43[8] = 2112;
          *(_QWORD *)&v43[10] = v30;
          *(_WORD *)&v43[18] = 2112;
          *(_QWORD *)&v43[20] = v27;
          _os_log_error_impl(&dword_1CBD43000, v28, (os_log_type_t)0x90u, "[ERROR] Not slow scanning an app library %@ which differs only in case from %@%@", buf, 0x20u);

        }
        objc_msgSend(v4, "updateFromFSAtPath:", v8);
        goto LABEL_19;
      }
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v8, "appLibrary");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v43 = v29;
        *(_WORD *)&v43[8] = 2112;
        *(_QWORD *)&v43[10] = v4;
        *(_WORD *)&v43[18] = 2112;
        *(_QWORD *)&v43[20] = v25;
        _os_log_fault_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: app libraries differ in db row id %@ vs %@%@", buf, 0x20u);

      }
      objc_msgSend(v4, "defaultClientZone");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("different-libraries");
    }
    else
    {
      objc_msgSend(v4, "defaultClientZone");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("start-scan");
    }
    objc_msgSend(v18, "scheduleResetServerAndClientTruthsForReason:", v20);

    goto LABEL_19;
  }
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v43 = v41;
    *(_WORD *)&v43[4] = 2112;
    *(_QWORD *)&v43[6] = v8;
    *(_WORD *)&v43[14] = 2112;
    *(_QWORD *)&v43[16] = v15;
    _os_log_fault_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: we should always be able to resolve under the root, since it's kept open %{errno}d\n   path: %@%@", buf, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D10B70], 76, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession dbBecameCorruptedWithDescription:error:](self->super._session, "dbBecameCorruptedWithDescription:error:", CFSTR("Couldn't resolve app library under root"), v17);

LABEL_20:
}

- (void)_finishedScanWithError:(int)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[BRCAsyncDirectoryEnumerator rootPath](self->_currentScan, "rootPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAsyncDirectoryEnumerator rootPath](self->_currentScan, "rootPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412802;
      v24 = v5;
      v25 = 1024;
      v26 = a3;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed scan at %@ %{errno}d%@", (uint8_t *)&v23, 0x1Cu);
    }

    +[BRCPathToItemLookup lookupForRelativePath:](BRCPathToItemLookup, "lookupForRelativePath:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "byFileIDGlobally");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asDirectory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "markLostClearGenerationID:backoffMode:", 0, 2);
    objc_msgSend(v12, "saveToDB");
    -[BRCFSReader _finishCurrentRelpathScan](self, "_finishCurrentRelpathScan");

  }
  else if (v5)
  {
    if (objc_msgSend(v5, "type") == 2 || objc_msgSend(v5, "type") == 3)
    {
      objc_msgSend(v7, "fetchRootItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateFromFSAtPath:", v5);
      objc_msgSend(v13, "itemID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isNonDesktopRoot");

      if ((v15 & 1) == 0)
        -[BRCFSReader _scanDone:atPath:lookup:](self, "_scanDone:atPath:lookup:", v13, v5, 0);
    }
    else
    {
      +[BRCPathToItemLookup lookupForRelativePath:](BRCPathToItemLookup, "lookupForRelativePath:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "byFileIDGlobally");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "asDirectory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v13, "parentItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "itemID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          -[BRCFSReader _scanDone:atPath:lookup:](self, "_scanDone:atPath:lookup:", v17, v5, v13);
      }

    }
    -[BRCAsyncDirectoryEnumerator rootPath](self->_currentScan, "rootPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[BRCFSReader _finishedScanWithError:].cold.1();

      -[BRCFSReader _finishCurrentRelpathScan](self, "_finishCurrentRelpathScan");
    }
  }

}

- (void)_startScanOfRelpath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BRCAsyncDirectoryEnumerator *v8;
  void *v9;
  void *v10;
  BRCAsyncDirectoryEnumerator *v11;
  BRCAsyncDirectoryEnumerator *currentScan;
  void *v13;
  NSObject *v14;
  BRCAsyncDirectoryEnumerator *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v4 = a3;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (int)objc_msgSend(v6, "readerScanBatchSize");

  if (self->_currentScan)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCFSReader _processLostItem:resolvedToPath:].cold.4();

  }
  v8 = [BRCAsyncDirectoryEnumerator alloc];
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serialQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BRCAsyncDirectoryEnumerator initForEnumeratingBelow:recursive:batchSize:targetQueue:](v8, "initForEnumeratingBelow:recursive:batchSize:targetQueue:", v4, 0, v7, v10);
  currentScan = self->_currentScan;
  self->_currentScan = v11;

  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[BRCFSReader _startScanOfRelpath:].cold.1();

  -[BRCFairSource suspend](self->_lostScanSource, "suspend");
  v15 = self->_currentScan;
  v18[4] = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __35__BRCFSReader__startScanOfRelpath___block_invoke;
  v19[3] = &unk_1E87657A8;
  v19[4] = self;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __35__BRCFSReader__startScanOfRelpath___block_invoke_70;
  v18[3] = &unk_1E87657D0;
  -[BRCAsyncDirectoryEnumerator scheduleWithProcessBlock:completion:](v15, "scheduleWithProcessBlock:completion:", v19, v18);

}

uint64_t __35__BRCFSReader__startScanOfRelpath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  if ((id)v7[11] == v5 && (objc_msgSend(v7, "isCancelled") & 1) == 0)
  {
    objc_msgSend(v5, "rootPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0
      && v11
      && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "containsObject:", v11) & 1) != 0)
    {
      objc_msgSend(v11, "db");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __35__BRCFSReader__startScanOfRelpath___block_invoke_68;
      v17[3] = &unk_1E8760018;
      v13 = v6;
      v14 = *(_QWORD *)(a1 + 32);
      v18 = v13;
      v19 = v14;
      objc_msgSend(v12, "groupInBatch:", v17);

      v8 = 1;
    }
    else
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        __35__BRCFSReader__startScanOfRelpath___block_invoke_cold_1();

      objc_msgSend(*(id *)(a1 + 32), "_cancelScan");
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __35__BRCFSReader__startScanOfRelpath___block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1D17A6BE8]();
        v14 = 0;
        if (objc_msgSend(v8, "resolveAndKeepOpenMustExist:error:", 1, &v14))
        {
          objc_msgSend(*(id *)(a1 + 40), "fseventAtPath:flags:", v8, 0);
          objc_msgSend(v8, "close");
        }
        else
        {
          brc_bread_crumbs();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "rootPath");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v20 = v8;
            v21 = 2112;
            v22 = v12;
            v23 = 1024;
            v24 = v14;
            v25 = 2112;
            v26 = v10;
            _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] can't resolve child %@ of %@ %{errno}d%@", buf, 0x26u);

          }
        }
        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
    }
    while (v5);
  }

}

void __35__BRCFSReader__startScanOfRelpath___block_invoke_70(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD *v4;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  int v10;

  v4 = *(_QWORD **)(a1 + 32);
  if (v4[11] == a2 && (objc_msgSend(v4, "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "rootPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appLibrary");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "db");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __35__BRCFSReader__startScanOfRelpath___block_invoke_2;
    v9[3] = &unk_1E8763430;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = a3;
    objc_msgSend(v7, "groupInBatch:", v9);

  }
}

uint64_t __35__BRCFSReader__startScanOfRelpath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedScanWithError:", *(unsigned int *)(a1 + 40));
}

- (void)_finishCurrentRelpathScan
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _currentScan%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_cancelScan
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v1 + 88), "rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] cancelling scan of %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)_lostScanSchedule
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┳%llx cancelling lost scan delay%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __32__BRCFSReader__lostScanSchedule__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  __int128 v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  v5 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 120);
  v6 = v2;
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __32__BRCFSReader__lostScanSchedule__block_invoke_cold_1();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "signal", v5, v6);
  __brc_leave_section((uint64_t *)&v5);
}

void __32__BRCFSReader__lostScanSchedule__block_invoke_72(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  char v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  int v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v2 = (void *)*((_QWORD *)a1[4] + 1);
  objc_msgSend(a1[5], "zoneRowID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverZoneByRowID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemByItemID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v36 = v7;
    if (!v7)
      v36 = a1[6];
    v42 = 138412546;
    v43 = v36;
    v44 = 2112;
    v45 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] lost scanning %@%@", (uint8_t *)&v42, 0x16u);
  }

  if ((objc_msgSend(v7, "isFSRoot") & 1) != 0
    || (objc_msgSend(a1[5], "itemID"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    objc_msgSend(*((id *)a1[4] + 1), "appLibraryScanThrottle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "incrementRetryCount:", objc_msgSend(a1[6], "hash"));

    objc_msgSend(a1[5], "itemID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(*((id *)a1[4] + 1), "lostItemThrottle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = a1[6];
      objc_msgSend(a1[5], "itemID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "incrementRetryCount:", objc_msgSend(v17, "throttleHashWithItemID:", v18));

      objc_msgSend(v7, "asFSRoot");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "appLibrary");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = a1[6];

      if (v20 == v21)
      {
        objc_msgSend(v7, "itemID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "rootItemID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqualToItemID:", v31);

        if ((v32 & 1) != 0)
        {
          if (!objc_msgSend(a1[6], "isiCloudDesktopAppLibrary"))
          {
            objc_msgSend(a1[4], "_startScanOfRegularAppLibrary:", a1[6]);
            goto LABEL_28;
          }
          if ((objc_msgSend(v7, "isLost") & 1) == 0)
            objc_msgSend(v7, "markLostClearGenerationID:backoffMode:", 0, 1);
          goto LABEL_6;
        }
        brc_bread_crumbs();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          v40 = a1[6];
          objc_msgSend(v40, "fetchRootItem");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 138413058;
          v43 = v7;
          v44 = 2112;
          v45 = v40;
          v46 = 2112;
          v47 = v41;
          v48 = 2112;
          v49 = v34;
          _os_log_fault_impl(&dword_1CBD43000, v35, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: we got an fsroot %@ that's not a root of its applibrary %@ - %@%@", (uint8_t *)&v42, 0x2Au);

        }
        objc_msgSend(a1[6], "defaultClientZone");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        v26 = CFSTR("fsroot doesn't match app library root");
      }
      else
      {
        brc_bread_crumbs();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v7, "asFSRoot");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "appLibrary");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = a1[6];
          v42 = 138412802;
          v43 = v38;
          v44 = 2112;
          v45 = v39;
          v46 = 2112;
          v47 = v22;
          _os_log_fault_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: wrong applibrary for fsroot %@ vs %@%@", (uint8_t *)&v42, 0x20u);

        }
        objc_msgSend(a1[6], "defaultClientZone");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        v26 = CFSTR("wrong applibrary for fsroot");
      }
      objc_msgSend(v24, "scheduleResetServerAndClientTruthsForReason:", v26);
    }
    else
    {
      if (!objc_msgSend(a1[6], "isiCloudDesktopAppLibrary"))
      {
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          __32__BRCFSReader__lostScanSchedule__block_invoke_72_cold_1();
        goto LABEL_22;
      }
      v27 = a1[6];
      objc_msgSend(v27, "root");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "updateFromFSAtPath:", v28);

      v29 = a1[4];
      objc_msgSend(a1[6], "root");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "fseventAtPath:flags:", v25, 0);
    }
LABEL_27:

    goto LABEL_28;
  }
  if (!v7)
  {
    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      __32__BRCFSReader__lostScanSchedule__block_invoke_72_cold_2();
LABEL_22:

    goto LABEL_27;
  }
  objc_msgSend(*((id *)a1[4] + 1), "lostItemThrottle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a1[6];
  objc_msgSend(a1[5], "itemID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "incrementRetryCount:", objc_msgSend(v12, "throttleHashWithItemID:", v13));

LABEL_6:
  objc_msgSend(a1[4], "_processLostItem:", v7);
LABEL_28:

}

- (void)unscheduleAppLibraryForLostScan:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_lostSet, "containsObject:", v4))
  {
    -[NSMutableSet removeObject:](self->_lostSet, "removeObject:", v4);
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCFSReader unscheduleAppLibraryForLostScan:].cold.2();

    -[BRCAsyncDirectoryEnumerator rootPath](self->_currentScan, "rootPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToAppLibrary:", v4);

    if (v9)
      -[BRCFSReader _cancelScan](self, "_cancelScan");
    if (!-[NSMutableSet count](self->_lostSet, "count"))
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[BRCFSReader unscheduleAppLibraryForLostScan:].cold.1();

      dispatch_group_leave((dispatch_group_t)self->_lostScanGroup);
    }
  }

}

- (void)scheduleAppLibraryForLostScan:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  if (!-[NSMutableSet count](self->_lostSet, "count"))
  {
    dispatch_group_enter((dispatch_group_t)self->_lostScanGroup);
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCFSReader scheduleAppLibraryForLostScan:].cold.3();

  }
  if ((-[NSMutableSet containsObject:](self->_lostSet, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_lostSet, "addObject:", v4);
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCFSReader scheduleAppLibraryForLostScan:].cold.2();

  }
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[BRCFSReader scheduleAppLibraryForLostScan:].cold.1();

  -[BRCFairSource signal](self->_lostScanSource, "signal");
}

- (BOOL)thumbnailChangedForItem:(id)a3 relpath:(id)a4 url:(id)a5 error:(id *)a6
{
  char *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
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
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  BOOL v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  const char *v40;
  const char *v41;
  _QWORD v42[4];
  char *v43;
  BRCFSReader *v44;
  id v45;
  uint64_t v46[3];
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v10 = (char *)a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0CB3600], "__itemAtURL:didChangeWithPurposeID:", v12, CFSTR("com.apple.bird"));
  memset(v46, 0, sizeof(v46));
  __brc_create_section(0, (uint64_t)"-[BRCFSReader thumbnailChangedForItem:relpath:url:error:]", 2783, v46);
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v48 = (const char *)v46[0];
    v49 = 2112;
    v50 = v10;
    v51 = 2112;
    v52 = v13;
    _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx thumbnail changed for %@%@", buf, 0x20u);
  }

  v15 = objc_msgSend(v11, "exists") ^ 1;
  if (!v10)
    LOBYTE(v15) = 1;
  if ((v15 & 1) == 0)
  {
    if (objc_msgSend(v10, "isDocument"))
    {
      objc_msgSend(v10, "clientZone");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "itemID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "serverItemByItemID:", v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "asDocument");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "currentVersion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ckInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "etag");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "latestVersion");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "ckInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "etag");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "triggerNotificationIfNeeded");
      objc_msgSend(v10, "asDocument");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "desiredVersion");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v24) = objc_msgSend(v27, "wantsThumbnail");

      if ((_DWORD)v24)
      {
        brc_bread_crumbs();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[BRCFSReader thumbnailChangedForItem:relpath:url:error:].cold.1();
      }
      else
      {
        objc_msgSend(v10, "asDocument");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "shouldTransferThumbnail");

        if ((v36 & 1) != 0)
        {
          if (v22 && objc_msgSend(v25, "isEqualToString:", v22))
          {
            objc_msgSend(v10, "clientZone");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "db");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v42[0] = MEMORY[0x1E0C809B0];
            v42[1] = 3221225472;
            v42[2] = __57__BRCFSReader_thumbnailChangedForItem_relpath_url_error___block_invoke;
            v42[3] = &unk_1E875E088;
            v43 = v10;
            v44 = self;
            v45 = v11;
            objc_msgSend(v38, "groupInBatch:", v42);

            v28 = v43;
LABEL_32:

            v34 = 1;
            goto LABEL_33;
          }
          brc_bread_crumbs();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v48 = (const char *)v22;
            v49 = 2112;
            v50 = (const char *)v25;
            v51 = 2112;
            v52 = v28;
            _os_log_debug_impl(&dword_1CBD43000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] Not clearing thumbnail signature when we don't have the most up-to-date version %@ vs %@%@", buf, 0x20u);
          }
        }
        else
        {
          brc_bread_crumbs();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            -[BRCFSReader thumbnailChangedForItem:relpath:url:error:].cold.2();
        }
      }

      goto LABEL_32;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 21);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      brc_bread_crumbs();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
      {
        v41 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v48 = "-[BRCFSReader thumbnailChangedForItem:relpath:url:error:]";
        v49 = 2080;
        if (!a6)
          v41 = "(ignored by caller)";
        v50 = v41;
        v51 = 2112;
        v52 = v18;
        v53 = 2112;
        v54 = v32;
        _os_log_error_impl(&dword_1CBD43000, v33, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a6)
      goto LABEL_20;
LABEL_21:
    v34 = 0;
    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 2);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v40 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v48 = "-[BRCFSReader thumbnailChangedForItem:relpath:url:error:]";
      v49 = 2080;
      if (!a6)
        v40 = "(ignored by caller)";
      v50 = v40;
      v51 = 2112;
      v52 = v18;
      v53 = 2112;
      v54 = v30;
      _os_log_debug_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (!a6)
    goto LABEL_21;
LABEL_20:
  v18 = objc_retainAutorelease(v18);
  v34 = 0;
  *a6 = v18;
LABEL_33:

  __brc_leave_section(v46);
  return v34;
}

void __57__BRCFSReader_thumbnailChangedForItem_relpath_url_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "asDocument");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearVersionSignatures:isPackage:", 2, 0);
  objc_msgSend(MEMORY[0x1E0C99D50], "brc_pendingPlaceholderForPackage:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLiveThumbnailSignature:", v2);

  if (objc_msgSend(v4, "needsUpload"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "fsUploader");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uploadItem:", v4);

  }
  objc_msgSend(v4, "saveToDB");
  objc_msgSend(*(id *)(a1 + 40), "fseventAtPath:flags:", *(_QWORD *)(a1 + 48), 0);

}

- (unint64_t)recoverAndReportMissingJobs
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_doc_id, ci.item_file_id, ci.item_generation, ci.item_localname, ci.item_processing_stamp, ci.item_staged_file_id, ci.item_staged_generation, ci.item_bouncedname, ci.item_scope, ci.item_tmpbounceno, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.desired_version, ci.item_live_conflict_loser_etags, ci.item_thumb_live_signature, ci.item_thumb_greedy, ci.version_block_sync_until_bundle_id, ci.version_block_sync_until_timestamp FROM client_items AS ci WHERE ci.item_localsyncupstate = 2 AND ci.item_localsyncupstate != 0 AND NOT EXISTS (SELECT 1 FROM client_reader_throttle AS reader WHERE ci.rowid = reader.throttle_id AND reader.throttle_state != 0)"));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __42__BRCFSReader_recoverAndReportMissingJobs__block_invoke;
  v18[3] = &unk_1E875E2C8;
  v18[4] = self;
  objc_msgSend(v4, "enumerateObjects:", v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    LODWORD(v8) = 0;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1D17A6BE8]();
        -[BRCFSReader createReadingJobForItem:state:](self, "createReadingJobForItem:state:", v11, 1);
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v7 != v10);
      v8 = (v8 + v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);

    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BRCFSReader recoverAndReportMissingJobs].cold.1((uint64_t)v13, v8, v14);

    -[BRCFSReader schedule](self, "schedule");
  }
  else
  {

    v8 = 0;
  }
  v15 = +[AppTelemetryTimeSeriesEvent newMissingReaderJobEventWithNumberMissing:](AppTelemetryTimeSeriesEvent, "newMissingReaderJobEventWithNumberMissing:", v8);
  -[BRCAccountSession analyticsReporter](self->super._session, "analyticsReporter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v15);

  return (int)v8;
}

id __42__BRCFSReader_recoverAndReportMissingJobs__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

- (BRCFSReader)initWithAccountSession:(id)a3
{
  id v4;
  BRCFSReader *v5;
  BRCCountedSet *v6;
  BRCCountedSet *coordinatedReaders;
  uint64_t v8;
  NSMutableSet *lostSet;
  dispatch_group_t v10;
  OS_dispatch_group *lostScanGroup;
  BRCFairSource *v12;
  void *v13;
  uint64_t v14;
  BRCFairSource *lostScanSource;
  uint64_t v16;
  brc_task_tracker *taskTracker;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BRCFSReader;
  v5 = -[BRCFSSchedulerBase initWithSession:name:tableName:](&v22, sel_initWithSession_name_tableName_, v4, CFSTR("Reader"), CFSTR("client_reader_throttle"));
  if (v5)
  {
    v6 = objc_alloc_init(BRCCountedSet);
    coordinatedReaders = v5->_coordinatedReaders;
    v5->_coordinatedReaders = v6;

    v8 = objc_opt_new();
    lostSet = v5->_lostSet;
    v5->_lostSet = (NSMutableSet *)v8;

    v10 = dispatch_group_create();
    lostScanGroup = v5->_lostScanGroup;
    v5->_lostScanGroup = (OS_dispatch_group *)v10;

    objc_initWeak(&location, v5);
    v12 = [BRCFairSource alloc];
    -[BRCAccountSession fairClientDBScheduler](v5->super._session, "fairClientDBScheduler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[BRCFairSource initWithName:scheduler:](v12, "initWithName:scheduler:", CFSTR("lost-scan"), v13);
    lostScanSource = v5->_lostScanSource;
    v5->_lostScanSource = (BRCFairSource *)v14;

    -[BRCFairSource setWorkloop:](v5->_lostScanSource, "setWorkloop:", v5->super._schedulerWorkloop);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __38__BRCFSReader_initWithAccountSession___block_invoke;
    v19[3] = &unk_1E875DC98;
    objc_copyWeak(&v20, &location);
    -[BRCFairSource setEventHandler:](v5->_lostScanSource, "setEventHandler:", v19);
    brc_task_tracker_create("com.apple.brc.fs.reader");
    v16 = objc_claimAutoreleasedReturnValue();
    taskTracker = v5->_taskTracker;
    v5->_taskTracker = (brc_task_tracker *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __38__BRCFSReader_initWithAccountSession___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_lostScanSchedule");

}

- (void)reset
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17[3];
  uint8_t v18[128];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertOnQueue");

  memset(v17, 0, sizeof(v17));
  __brc_create_section(0, (uint64_t)"-[BRCFSReader reset]", 2881, v17);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = v17[0];
    v11 = (void *)objc_opt_class();
    *(_DWORD *)buf = 134218498;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v4;
    v12 = v11;
    _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx resetting the %@%@", buf, 0x20u);

  }
  if (self->_currentScan)
    -[BRCFSReader _cancelScan](self, "_cancelScan");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BRCAccountSession fsEventsMonitors](self->super._session, "fsEventsMonitors", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9++), "resetWithReason:", CFSTR("reader reset"));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);
  }

  __brc_leave_section(v17);
}

- (void)cancel
{
  NSObject *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_2_0();
  v2 = v1;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] cancelling the %@%@", v4);

  OUTLINED_FUNCTION_3_0();
}

- (void)_close
{
  NSObject *lostScanDelay;
  OS_dispatch_source *v4;
  BRCFairSource *lostScanSource;
  BRCCountedSet *coordinatedReaders;
  void *v7;
  NSObject *v8;
  objc_super v9;

  if (!-[BRCFSSchedulerBase isCancelled](self, "isCancelled"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCTransferStream close].cold.1();

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._schedulerWorkloop);
  if (self->_currentScan)
    -[BRCFSReader _cancelScan](self, "_cancelScan");
  lostScanDelay = self->_lostScanDelay;
  if (lostScanDelay)
  {
    dispatch_source_cancel(lostScanDelay);
    v4 = self->_lostScanDelay;
    self->_lostScanDelay = 0;

  }
  lostScanSource = self->_lostScanSource;
  if (lostScanSource)
  {
    if (!self->_resumed)
    {
      -[BRCFairSource resume](lostScanSource, "resume");
      lostScanSource = self->_lostScanSource;
    }
    self->_lostScanSource = 0;

  }
  brc_task_tracker_wait((uint64_t)self->_taskTracker);
  if (self->_readerCountReachedMax)
  {
    coordinatedReaders = self->_coordinatedReaders;
    self->_coordinatedReaders = 0;

    self->_readerCountReachedMax = 0;
    -[BRCFSReader resume](self, "resume");
  }
  v9.receiver = self;
  v9.super_class = (Class)BRCFSReader;
  -[BRCFSSchedulerBase _close](&v9, sel__close);
}

- (void)suspend
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] suspending reader%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)resume
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] resuming reader%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __21__BRCFSReader_resume__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "fetch:", CFSTR("SELECT zone_rowid, app_library_rowid FROM mark_children_lost_progress GROUP BY zone_rowid, app_library_rowid"));

  if (objc_msgSend(v3, "next"))
  {
    *(_QWORD *)&v4 = 138412290;
    v19 = v4;
    do
    {
      v5 = (void *)MEMORY[0x1D17A6BE8]();
      objc_msgSend(v3, "objectOfClass:atIndex:", objc_opt_class(), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectOfClass:atIndex:", objc_opt_class(), 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "serverZoneByRowID:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "clientZone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "appLibraryByRowID:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v11 = v9 == 0;
      else
        v11 = 1;
      if (v11)
      {
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v19;
          v24 = v17;
          _os_log_fault_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: appLibrary && zone%@", buf, 0xCu);
        }

      }
      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
      objc_msgSend(v10, "db", v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "serialQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __21__BRCFSReader_resume__block_invoke_112;
      v20[3] = &unk_1E875D470;
      v21 = v10;
      v22 = v9;
      v15 = v9;
      v16 = v10;
      brc_task_tracker_async_with_logs(v12, v14, v20, &__block_literal_global_50);

      objc_autoreleasePoolPop(v5);
    }
    while ((objc_msgSend(v3, "next") & 1) != 0);
  }

}

void __21__BRCFSReader_resume__block_invoke_112(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __21__BRCFSReader_resume__block_invoke_2;
  v3[3] = &unk_1E8760018;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "groupInBatch:", v3);

}

uint64_t __21__BRCFSReader_resume__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "continueMarkingChildrenLostInZone:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Reader dealloced with containers still in the lost heap%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (OS_dispatch_group)lostScanGroup
{
  return self->_lostScanGroup;
}

- (brc_task_tracker)taskTracker
{
  return self->_taskTracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lostScanGroup, 0);
  objc_storeStrong((id *)&self->_taskTracker, 0);
  objc_storeStrong((id *)&self->_lostScanDelay, 0);
  objc_storeStrong((id *)&self->_lostScanSource, 0);
  objc_storeStrong((id *)&self->_lostSet, 0);
  objc_storeStrong((id *)&self->_currentScan, 0);
  objc_storeStrong((id *)&self->_coordinatedReaders, 0);
}

- (void)_attemptSchedulingCoordinatedReadForItem:path:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] attempting to schedule a coordinated read on item: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleReadJobWithID:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "itemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] %@ is lost and isn't pending-lost in the reader queue%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)_scheduleReadJobWithID:.cold.2()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_9_0();
  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "itemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ isn't needs reading, and is in the reader queue%@", v3, 0x16u);

  OUTLINED_FUNCTION_6();
}

void __38__BRCFSReader__scheduleReadJobWithID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: item.isDocument%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)startReadCoordinationInAppLibrary:.cold.1()
{
  NSObject *v0;
  id *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_3(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v2, "[DEBUG] Reader: reached maximum allowed number of coordinations (%ld)%@", v3);
  OUTLINED_FUNCTION_3_0();
}

- (void)endReadCoordinationInAppLibrary:.cold.1()
{
  NSObject *v0;
  id *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_3(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v2, "[DEBUG] Reader: below half maximum allowed number of coordinations (%ld)%@", v3);
  OUTLINED_FUNCTION_3_0();
}

- (void)endReadCoordinationInAppLibrary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [_coordinatedReaders containsObject:appLibrary]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)readUnderCoordinationWithLookup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: something is wrong, we got a coordinated inside a package%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)readUnderCoordinationWithLookup:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] ignoring coordinated read without any corresponding items%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)readUnderCoordinationWithLookup:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] item is busy on disk, we must give up reading the file for now%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)readUnderCoordinationWithLookup:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] item has unscanned changes on disk, reading the file%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)readUnderCoordinationWithLookup:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: -updateLocationAndMetaFromFSAtPath should always work on documents%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)readUnderCoordinationWithLookup:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] nothing to read%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)readUnderCoordinationWithLookup:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] ignoring coordinated read without a live item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)readUnderCoordinationWithLookup:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] item is missing, let's mark it lost%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)readUnderCoordinationWithLookup:(NSObject *)a3 .cold.9(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "byPathRelpath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v6, "[DEBUG] there is nothing to read at %@%@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_6();
}

- (void)lookupAndReadItemUnderCoordinationAtURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _session.clientDB.isBatchSuspended%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateLookupAfterHandlingPathMatchWithFSRoot:relpath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: after bouncing to a unique path, we still have match!%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateLookupAfterHandlingPathMatchWithFSRoot:relpath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] We need to bounce a document clashing with our FS root%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateLookupAfterHandlingPathMatchWithFSRoot:relpath:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] We need to bounce a directory clashing with our FS root%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fseventAtPath:flags:unresolvedLastPathComponent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: relpath%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fseventAtPath:flags:options:unresolvedLastPathComponent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Ignoring FSEvent in unknown container%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fseventAtPath:flags:options:unresolvedLastPathComponent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: appLibrary.isiCloudDesktopAppLibrary == NO%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fseventAtPath:flags:options:unresolvedLastPathComponent:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ignoring fsevent on %@ until the parent arrives%@");
  OUTLINED_FUNCTION_2();
}

- (void)fseventAtPath:flags:options:unresolvedLastPathComponent:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] can't update lookup for fs-root match on %@, ignoring fsevent%@");
  OUTLINED_FUNCTION_2();
}

- (void)fseventAtPath:flags:options:unresolvedLastPathComponent:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Ignoring FSEvent in container pending needs-scan: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)fseventRecursiveAtRoot:withReason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: root should exist%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fseventRecursiveAtRoot:withReason:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: root.type == BRCRelativePathTypeRoot || root.type == BRCRelativePathTypeDesktopOrDocuments%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fseventOnContainer:flags:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "logName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] Marking container %@ as needs-scan%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)fseventOnSymlink:flags:lookup:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "relpathOfItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] Ignoring fsevent on desktop symlink path %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)fseventOnSymlink:flags:lookup:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: lookupByFileID != item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fseventOnSymlink:flags:lookup:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] byPath:%@ moved elsewhere%@");
  OUTLINED_FUNCTION_2();
}

- (void)fseventOnSymlink:flags:lookup:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !item || item.isOnDisk%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fseventOnSymlink:flags:lookup:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: lookup.byFileID == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fseventOnAlias:flags:lookup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] deleting the alias because it can't reference an item in a shared zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fseventOnAlias:flags:lookup:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] marking alias lost because its target exists on disk but we haven't scanned it yet%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fseventOnAlias:flags:lookup:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] deleting the alias because it can't be resolved%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fseventOnAlias:flags:lookup:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] deleting the alias on-disk because it can't be resolved and isn't in our database%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fseventOnAlias:flags:lookup:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Ignoring non-alias lookup-by-itemID %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)itemForCreatedDocumentsDirectory:appLibrary:path:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Found the Documents folder%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)itemForCreatedDocumentsDirectory:appLibrary:path:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Reviving %@ because it is dead%@");
  OUTLINED_FUNCTION_2();
}

- (void)fseventOnDirectory:flags:lookup:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Dropping fsevent on a directory with kBundle bit set at '%@'%@");
  OUTLINED_FUNCTION_2();
}

- (void)fseventOnDirectory:flags:lookup:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Found reserved item clashing %@. Marking that item live.%@");
  OUTLINED_FUNCTION_2();
}

- (void)fseventOnDirectory:flags:lookup:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] we got a path-match with a server item: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)fseventOnDirectory:flags:lookup:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] directory %@ moved elsewhere%@");
  OUTLINED_FUNCTION_2();
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: relpathOfItem.birthTime == lookupByFileID.st.birthtime%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_fseventOnDocument:(uint64_t)a3 flags:(double)a4 options:item:lookup:unresolvedLastPathComponent:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, double a4)
{
  int v4;
  double v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 134218242;
  v5 = a4;
  v6 = 2112;
  v7 = a1;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a2, a3, "[DEBUG] Delaying reading item by %.03fs because it's a package%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] scheduling unthrottled package item read%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] inserting a zero-byte file, let's mark it lost%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] we got a path-match with a server item during initial scan: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] [hardlink] this is an event about the path we knew for this item, go on%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] [hardlink] unable to find this hardlink at its previous path, go on%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Someone replaced a fault with content, clearing ETag for the version%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: lookup.byDocumentID == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: relpathOfItem%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_fetchNextLostItemID:parentID:appLibraryRowID:tooManyScans:stamp:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] app library being skipped for per-item lost scan %@%@");
  OUTLINED_FUNCTION_2();
}

void __80__BRCFSReader__fetchNextLostItemID_parentID_appLibraryRowID_tooManyScans_stamp___block_invoke_cold_1()
{
  _QWORD *v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v1, v2, "[CRIT] UNREACHABLE: nil app library for rowID %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __80__BRCFSReader__fetchNextLostItemID_parentID_appLibraryRowID_tooManyScans_stamp___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: ![self->_lostSet containsObject:appLibrary]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __80__BRCFSReader__fetchNextLostItemID_parentID_appLibraryRowID_tooManyScans_stamp___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: App library %@ is in needs-lost state, but missing from the lost set!%@");
  OUTLINED_FUNCTION_2();
}

- (void)_nextLostItemIDWithBackoff:appLibrary:now:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: backoff < BRC_TIMESTAMP_FAR_FUTURE%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_nextLostItemIDWithBackoff:appLibrary:now:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: shallowestALRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_nextLostItemIDWithBackoff:appLibrary:now:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _session.clientDB.changes == 1%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_nextLostItemIDWithBackoff:appLibrary:now:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Updating lost stamp for item %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_nextLostItemIDWithBackoff:(_BYTE *)a1 appLibrary:now:.cold.5(_BYTE *a1)
{
  const __CFString *v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  v1 = CFSTR(" because too many deep scans");
  if (!*a1)
    v1 = &stru_1E8769030;
  LODWORD(v4) = 138412546;
  *(_QWORD *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v2, v3, "[DEBUG] Done with all normal lost scanning for now%@%@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_2();
}

- (void)_recoverFromUnknownParentLoopAtPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] No parent item found for path, checking parent's parent recursively %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_recoverFromUnknownParentLoopAtPath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Can't resolve parent path by fileID, bailing out%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_processLostItem:resolvedToPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: We seem to be stuck lost scanning because we are repeatedly scanning items under an unknown parent. Scheduling scan of first parent%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_processLostItem:resolvedToPath:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] can't update lookup for fs-root match on %@, can't lost scan%@");
  OUTLINED_FUNCTION_2();
}

- (void)_processLostItem:resolvedToPath:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: relpath.exists%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_processLostItem:resolvedToPath:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _currentScan == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resolveDocumentID:zone:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: err == ENOSYS || err == EINTR || err == EBUSY%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resolveDocumentID:zone:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: documentID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_didResolvedDocumentID:fileID:zone:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] couldn't locate %@ per documentID: it's gone%@");
  OUTLINED_FUNCTION_2();
}

- (void)_processDeadItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] lost item %@ can't be located, it's gone%@");
  OUTLINED_FUNCTION_2();
}

- (void)_scanDirectory:atPath:lookup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: item.isDirectory%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_scanDirectory:atPath:lookup:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: relpath.isUnixDir%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_scanDirectory:atPath:lookup:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_currentScan%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_slowScanDirectoryAtPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Can't scan a path with no container: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_slowScanDirectoryAtPath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: the relpath is already open, so -resolveAndKeepOpen should work%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_startScanOfRegularAppLibrary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: rootItemID.isNonDesktopRoot%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_startScanOfRegularAppLibrary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !appLibrary.isiCloudDesktopAppLibrary%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_startScanOfRegularAppLibrary:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: appLibrary.deepScanStamp%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_finishedScanWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] finishing scan of %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_startScanOfRelpath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] beginning scan of %@%@");
  OUTLINED_FUNCTION_2();
}

void __35__BRCFSReader__startScanOfRelpath___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: The scan should already be cancelled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __32__BRCFSReader__lostScanSchedule__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┳%llx scheduling lost scan after backoff%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __32__BRCFSReader__lostScanSchedule__block_invoke_72_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: no itemID for a non-iCloud Desktop all library%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __32__BRCFSReader__lostScanSchedule__block_invoke_72_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: we just got the itemID from the db, we should be able to get the item as well%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)unscheduleAppLibraryForLostScan:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Lost Scan: done scanning lost items in %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)unscheduleAppLibraryForLostScan:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Lost Scan: no lost items anymore in %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)scheduleAppLibraryForLostScan:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "logName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] %@: signaling lost scan%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)scheduleAppLibraryForLostScan:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Lost Scan: lost items in %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)scheduleAppLibraryForLostScan:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Lost Scan: starting to scan lost items in %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)thumbnailChangedForItem:relpath:url:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Not clearing the thumbnail signature, because we're still waiting for thumbnail download%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)thumbnailChangedForItem:relpath:url:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Not clearing the thumbnail signature, because this is a thumbnail we can regenerate%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)recoverAndReportMissingJobs
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Reader: Recovered from %u missing reader jobs%@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_2();
}

@end
