@implementation BRCFSTransferScheduler

- (void)moveAppLibraryTransfers:(id)a3 toAppLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BRCFSTransferScheduler *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[BRCAccountSession clientDB](self->super._session, "clientDB");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCFSSchedulerBase tableName](self, "tableName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dbRowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transferSyncContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contextIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dbRowID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transferSyncContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contextIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "execute:", CFSTR("UPDATE %@ SET app_library_rowid = %@,transfer_queue = %@ WHERE app_library_rowid = %@ AND transfer_queue = %@"), v25, v8, v10, v11, v13);

  v14 = self;
  v15 = objc_msgSend(v26, "changes");
  -[BRCFSSchedulerBase tableName](self, "tableName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dbRowID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dbRowID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "execute:", CFSTR("UPDATE %@ SET app_library_rowid = %@ WHERE app_library_rowid = %@"), v16, v17, v18);

  v19 = objc_msgSend(v26, "changes") + v15;
  if (v19)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      -[BRCFSSchedulerBase name](v14, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appLibraryID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appLibraryID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v28 = v22;
      v29 = 2048;
      v30 = v19;
      v31 = 2112;
      v32 = v23;
      v33 = 2112;
      v34 = v24;
      v35 = 2112;
      v36 = v20;
      _os_log_debug_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: moved %lld throttles from %@ to %@%@", buf, 0x34u);

    }
    -[BRCFSSchedulerBase signal](v14, "signal");
  }

}

@end
