@implementation MSASPersonModel

- (MSASPersonModel)initWithPersonID:(id)a3
{
  id v4;
  void *v5;
  MSASPersonModel *v6;
  objc_super v8;

  v4 = a3;
  MSPathAlbumSharingPersistentStoreForPersonID(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)MSASPersonModel;
  v6 = -[MSASModelBase initWithPersonID:databasePath:currentVersion:](&v8, sel_initWithPersonID_databasePath_currentVersion_, v4, v5, 8);

  return v6;
}

- (BOOL)dbQueueUpgradeFromDatabaseVersion:(int)a3 currentVersion:(int)a4
{
  unsigned int v6;
  NSObject *v7;
  const char *v8;
  char *errmsg;
  objc_super v11;
  uint8_t buf[4];
  MSASPersonModel *v13;
  __int16 v14;
  char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)MSASPersonModel;
  v6 = -[MSASModelBase dbQueueUpgradeFromDatabaseVersion:currentVersion:](&v11, sel_dbQueueUpgradeFromDatabaseVersion_currentVersion_, *(_QWORD *)&a3, *(_QWORD *)&a4);
  if (v6)
  {
    if (a3 < 0)
    {
      errmsg = 0;
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create table if not exists CommandQueue (\n   ord                   integer,\n   command               text,\n   params                blob,\n   personID              text,\n   albumGUID             text,\n   assetCollectionGUID   text\n);",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          v7 = MEMORY[0x1E0C81028];
          v8 = "%{public}@: Could not create person model command queue. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists CommandQueueByOrder on CommandQueue (ord asc);",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          v7 = MEMORY[0x1E0C81028];
          v8 = "%{public}@: Could not create command queueindex. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create table if not exists PendingCommandQueue (\n   ord                   integer,\n   command               text,\n   params                blob,\n   personID              text,\n   albumGUID             text,\n   assetCollectionGUID   text\n);",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          v7 = MEMORY[0x1E0C81028];
          v8 = "%{public}@: Could not create person model pending command queue. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists PendingCommandQueueByOrder on PendingCommandQueue (ord asc);",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          v7 = MEMORY[0x1E0C81028];
          v8 = "%{public}@: Could not create pending command queue index. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create table if not exists PendingAssetCollections (\n   assetCollectionGUID   text unique,\n   albumGUID             text\n);",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          v7 = MEMORY[0x1E0C81028];
          v8 = "%{public}@: Could not create person model pending asset collections table. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create table if not exists DownloadQueue (\n  ord                  integer,\n  isThumbnail          integer default 0,\n  isInflight           integer default 0,\n  GUID                 text,\n  albumGUID            text,\n  assetCollectionGUID  text,\n  batchCreationDate    real,\n  photoCreationDate    real,\n  errorCount           integer default 0,\n  album                blob,\n  object               blob\n);",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          v7 = MEMORY[0x1E0C81028];
          v8 = "%{public}@: Could not create download queue tables. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists DownloadQueueGeneralOrder on DownloadQueue (isThumbnail asc, albumGUID asc, batchCreationDate asc, photoCreationDate asc);",
             0,
             0,
             &errmsg))
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_100;
        goto LABEL_46;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists DownloadQueueGeneralReverseOrder on DownloadQueue (isThumbnail asc, albumGUID asc, batchCreationDate desc, photoCreationDate asc);",
             0,
             0,
             &errmsg))
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_100;
        goto LABEL_13;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create table if not exists UploadQueue (\n  ord                  integer,\n  uploadPriority       integer default 0,\n  GUID                 text,\n  albumGUID            text,\n  errorCount           integer default 0,\n  album                blob,\n  object               blob\n);",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          v7 = MEMORY[0x1E0C81028];
          v8 = "%{public}@: Could not create upload queue tables. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists UploadQueueByOrder on UploadQueue (ord asc);",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          v7 = MEMORY[0x1E0C81028];
          v8 = "%{public}@: Could not create upload queue order index. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists UploadQueueByGUID on UploadQueue (GUID asc);",
             0,
             0,
             &errmsg))
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_100;
        goto LABEL_40;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists DownloadQueueByGUID on DownloadQueue (GUID asc);",
             0,
             0,
             &errmsg))
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_100;
        goto LABEL_98;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "analyze;", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not analyze database. Ignoring. Error: %{public}s", buf, 0x16u);
        }
        sqlite3_free(errmsg);
      }
      goto LABEL_107;
    }
    if (a3 <= 2)
    {
      errmsg = 0;
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "alter table DownloadQueue add column batchCreationDate real;",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
LABEL_6:
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          v7 = MEMORY[0x1E0C81028];
          v8 = "%{public}@: Could not add download queue column. Error: %{public}s";
LABEL_99:
          _os_log_error_impl(&dword_1D3E94000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0x16u);
        }
LABEL_100:
        sqlite3_free(errmsg);
        goto LABEL_101;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "alter table DownloadQueue add column photoCreationDate real;",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_6;
        goto LABEL_100;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists DownloadQueueGeneralOrder on DownloadQueue (isThumbnail asc, albumGUID asc, batchCreationDate asc, photoCreationDate asc);",
             0,
             0,
             &errmsg))
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_100;
LABEL_46:
        *(_DWORD *)buf = 138543618;
        v13 = self;
        v14 = 2082;
        v15 = errmsg;
        v7 = MEMORY[0x1E0C81028];
        v8 = "%{public}@: Could not create download queue index. Error: %{public}s";
        goto LABEL_99;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "analyze;", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not analyze database. Ignoring. Error: %{public}s", buf, 0x16u);
        }
        sqlite3_free(errmsg);
      }
      goto LABEL_11;
    }
    if (a3 == 3)
    {
LABEL_11:
      errmsg = 0;
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists DownloadQueueGeneralReverseOrder on DownloadQueue (isThumbnail asc, albumGUID asc, batchCreationDate desc, photoCreationDate asc);",
             0,
             0,
             &errmsg))
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_100;
LABEL_13:
        *(_DWORD *)buf = 138543618;
        v13 = self;
        v14 = 2082;
        v15 = errmsg;
        v7 = MEMORY[0x1E0C81028];
        v8 = "%{public}@: Could not create download queue reverse index. Error: %{public}s";
        goto LABEL_99;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "analyze;", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not analyze database. Ignoring. Error: %{public}s", buf, 0x16u);
        }
        sqlite3_free(errmsg);
      }
      goto LABEL_31;
    }
    if (a3 <= 4)
    {
LABEL_31:
      errmsg = 0;
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "alter table PendingAssetCollections add column albumGUID text;",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          v7 = MEMORY[0x1E0C81028];
          v8 = "%{public}@: Could not add albumGUID column to pending asset collections queue. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "analyze;", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not analyze database. Ignoring. Error: %{public}s", buf, 0x16u);
        }
        sqlite3_free(errmsg);
      }
      goto LABEL_38;
    }
    if (a3 == 5)
    {
LABEL_38:
      errmsg = 0;
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists UploadQueueByGUID on UploadQueue (GUID asc);",
             0,
             0,
             &errmsg))
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_100;
LABEL_40:
        *(_DWORD *)buf = 138543618;
        v13 = self;
        v14 = 2082;
        v15 = errmsg;
        v7 = MEMORY[0x1E0C81028];
        v8 = "%{public}@: Could not create upload queue GUID index. Error: %{public}s";
        goto LABEL_99;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists DownloadQueueByGUID on DownloadQueue (GUID asc);",
             0,
             0,
             &errmsg))
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_100;
LABEL_98:
        *(_DWORD *)buf = 138543618;
        v13 = self;
        v14 = 2082;
        v15 = errmsg;
        v7 = MEMORY[0x1E0C81028];
        v8 = "%{public}@: Could not create download queue GUID index. Error: %{public}s";
        goto LABEL_99;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "analyze;", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not analyze database. Ignoring. Error: %{public}s", buf, 0x16u);
        }
        sqlite3_free(errmsg);
      }
      goto LABEL_61;
    }
    if (a3 <= 6)
    {
LABEL_61:
      errmsg = 0;
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "alter table UploadQueue add column uploadPriority integer", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          v7 = MEMORY[0x1E0C81028];
          v8 = "%{public}@: Could not add uploadPriority column to UploadQueue. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "alter table DownloadQueue drop column album", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not drop album column in DownloadQueue. Ignoring. Error: %{public}s", buf, 0x16u);
        }
        sqlite3_free(errmsg);
      }
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "analyze;", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not analyze database. Ignoring. Error: %{public}s", buf, 0x16u);
        }
        sqlite3_free(errmsg);
      }
      goto LABEL_72;
    }
    if (a3 == 8)
    {
LABEL_107:
      LOBYTE(v6) = 1;
      return v6;
    }
    if (a3 == 7)
    {
LABEL_72:
      errmsg = 0;
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "alter table DownloadQueue add column isInflight integer", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v13 = self;
          v14 = 2082;
          v15 = errmsg;
          v7 = MEMORY[0x1E0C81028];
          v8 = "%{public}@: Could not add isInflight column to DownloadQueue. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      goto LABEL_107;
    }
    v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v6)
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 1024;
      LODWORD(v15) = a3;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Not supporting migration from version %d. Recreating database.", buf, 0x12u);
LABEL_101:
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (int64_t)dbQueueNextCommandSequenceNumber
{
  sqlite3_stmt *v3;
  uint64_t v4;
  int v5;
  int64_t v6;
  int v7;
  int v9;
  MSASPersonModel *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select max(ord) from CommandQueue;"));
  v4 = sqlite3_reset(v3);
  v5 = v4;
  MSSqliteTrapForDBLockError(v4);
  if (v5)
  {
LABEL_2:
    sqlite3_reset(v3);
    return 0;
  }
  v7 = sqlite3_step(v3);
  if (v7 == 101)
  {
    v6 = 0;
  }
  else
  {
    if (v7 != 100)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v9 = 138543618;
        v10 = self;
        v11 = 2082;
        v12 = sqlite3_errmsg(-[MSASModelBase dbQueueDB](self, "dbQueueDB"));
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not retrieve next command sequence number. sqlite error: %{public}s", (uint8_t *)&v9, 0x16u);
      }
      goto LABEL_2;
    }
    v6 = sqlite3_column_int64(v3, 0) + 1;
  }
  sqlite3_reset(v3);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2048;
    v12 = (const char *)v6;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: ...next command sequence: %lld", (uint8_t *)&v9, 0x16u);
  }
  return v6;
}

- (int64_t)dbQueueSmallestCommandSequenceNumber
{
  sqlite3_stmt *v3;
  uint64_t v4;
  int v5;
  sqlite3_int64 v6;
  int v7;
  int v9;
  MSASPersonModel *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select min(ord) from CommandQueue;"));
  v4 = sqlite3_reset(v3);
  v5 = v4;
  MSSqliteTrapForDBLockError(v4);
  if (v5)
  {
LABEL_2:
    sqlite3_reset(v3);
    return 0;
  }
  v7 = sqlite3_step(v3);
  if (v7 == 101)
  {
    v6 = 0;
  }
  else
  {
    if (v7 != 100)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v9 = 138543618;
        v10 = self;
        v11 = 2082;
        v12 = sqlite3_errmsg(-[MSASModelBase dbQueueDB](self, "dbQueueDB"));
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not retrieve next command sequence number. sqlite error: %{public}s", (uint8_t *)&v9, 0x16u);
      }
      goto LABEL_2;
    }
    v6 = sqlite3_column_int64(v3, 0);
  }
  sqlite3_reset(v3);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2048;
    v12 = (const char *)v6;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: ...smallest command number: %lld", (uint8_t *)&v9, 0x16u);
  }
  return v6;
}

- (void)dbQueueEnqueueCommand:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v17 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)MEMORY[0x1D8255C20]();
  -[MSASPersonModel dbQueueEnqueueCommand:params:personID:albumGUID:assetCollectionGUID:sequenceNumber:](self, "dbQueueEnqueueCommand:params:personID:albumGUID:assetCollectionGUID:sequenceNumber:", v17, v12, v13, v14, v15, -[MSASPersonModel dbQueueNextCommandSequenceNumber](self, "dbQueueNextCommandSequenceNumber"));
  objc_autoreleasePoolPop(v16);

}

- (void)enqueueCommand:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __80__MSASPersonModel_enqueueCommand_params_personID_albumGUID_assetCollectionGUID___block_invoke;
  v23[3] = &unk_1E95BC758;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(v17, v23);

}

- (void)enqueueCommandAtHeadOfQueue:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __93__MSASPersonModel_enqueueCommandAtHeadOfQueue_params_personID_albumGUID_assetCollectionGUID___block_invoke;
  v23[3] = &unk_1E95BC758;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(v17, v23);

}

- (void)dbQueueEnqueueCommand:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7 sequenceNumber:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  sqlite3_stmt *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  MSASPersonModel *v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  id v39;
  uint8_t buf[4];
  MSASPersonModel *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  int64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    v41 = self;
    v42 = 2114;
    v43 = v14;
    v44 = 2048;
    v45 = a8;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Enqueueing command %{public}@ at sequence number %lld.", buf, 0x20u);
  }
  v19 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("insert into CommandQueue (ord, command, params, personID, albumGUID, assetCollectionGUID) values (?, ?, ?, ?, ?, ?);"));
  v20 = sqlite3_bind_int64(v19, 1, a8);
  v21 = v20;
  MSSqliteTrapForDBLockError(v20);
  if (!v21)
  {
    v22 = MSSqliteBindStringOrNull(v19, 2, v14);
    v23 = v22;
    MSSqliteTrapForDBLockError(v22);
    if (!v23)
    {
      v39 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, &v39);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v39;
      v26 = v25;
      if (v24)
      {
        v27 = MSSqliteBindDataOrNull(v19, 3, v24);
      }
      else
      {
        v28 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v25, "userInfo");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("Failed to archive params object. Error: %@ Info: %@"), v26, v29);
        v30 = (MSASPersonModel *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v30;
          _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }

        v27 = sqlite3_bind_null(v19, 3);
      }
      v31 = v27;
      MSSqliteTrapForDBLockError(v27);
      if (!v31)
      {
        v32 = MSSqliteBindStringOrNull(v19, 4, v16);
        v33 = v32;
        MSSqliteTrapForDBLockError(v32);
        if (!v33)
        {
          v34 = MSSqliteBindStringOrNull(v19, 5, v17);
          v35 = v34;
          MSSqliteTrapForDBLockError(v34);
          if (!v35)
          {
            v36 = MSSqliteBindStringOrNull(v19, 6, v18);
            v37 = v36;
            MSSqliteTrapForDBLockError(v36);
            if (!v37)
            {
              v38 = sqlite3_step(v19);
              MSSqliteTrapForDBLockError(v38);
            }
          }
        }
      }

    }
  }
  if (v19)
    sqlite3_reset(v19);

}

- (void)enqueueCommand:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 pendingOnAssetCollectionGUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __89__MSASPersonModel_enqueueCommand_params_personID_albumGUID_pendingOnAssetCollectionGUID___block_invoke;
  v23[3] = &unk_1E95BC758;
  v23[4] = self;
  v24 = v16;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = v16;
  dispatch_async(v17, v23);

}

- (void)dbQueueRequeuePendingCommandsWithQueryStatement:(sqlite3_stmt *)a3 deleteStatement:(sqlite3_stmt *)a4
{
  sqlite3_stmt *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  sqlite3 *v15;
  MSASPersonModel *v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  char v32;
  uint64_t v33;
  int v34;
  int64_t v36;
  uint8_t buf[4];
  MSASPersonModel *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  int64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[MSASModelBase beginTransaction](self, "beginTransaction");
  v36 = -[MSASPersonModel dbQueueNextCommandSequenceNumber](self, "dbQueueNextCommandSequenceNumber");
  v6 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("insert into CommandQueue (ord, command, params, personID, albumGUID, assetCollectionGUID) values (?, ?, ?, ?, ?, ?);"));
  v7 = sqlite3_step(a3);
  while (v7 == 100)
  {
    MSSqliteStringFromStatementColumn(a3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MSSqliteDataFromStatementColumn(a3, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MSSqliteStringFromStatementColumn(a3, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MSSqliteStringFromStatementColumn(a3, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MSSqliteStringFromStatementColumn(a3, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543874;
      v38 = self;
      v39 = 2114;
      v40 = v8;
      v41 = 2048;
      v42 = v36;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Requeueing pended command: %{public}@ at position %lld", buf, 0x20u);
    }
    v13 = sqlite3_reset(v6);
    v14 = v13;
    MSSqliteTrapForDBLockError(v13);
    if (v14)
    {
      v15 = -[MSASModelBase dbQueueDB](self, "dbQueueDB");
      v16 = self;
      v17 = 573;
LABEL_22:
      MSLogSqliteError(v15, (uint64_t)v16, v17);
      v32 = 0;
      v7 = 100;
      goto LABEL_23;
    }
    v18 = sqlite3_bind_int64(v6, 1, v36);
    v19 = v18;
    MSSqliteTrapForDBLockError(v18);
    if (v19)
    {
      v15 = -[MSASModelBase dbQueueDB](self, "dbQueueDB");
      v16 = self;
      v17 = 574;
      goto LABEL_22;
    }
    v20 = MSSqliteBindStringOrNull(v6, 2, v8);
    v21 = v20;
    MSSqliteTrapForDBLockError(v20);
    if (v21)
    {
      v15 = -[MSASModelBase dbQueueDB](self, "dbQueueDB");
      v16 = self;
      v17 = 575;
      goto LABEL_22;
    }
    v22 = MSSqliteBindDataOrNull(v6, 3, v9);
    v23 = v22;
    MSSqliteTrapForDBLockError(v22);
    if (v23)
    {
      v15 = -[MSASModelBase dbQueueDB](self, "dbQueueDB");
      v16 = self;
      v17 = 576;
      goto LABEL_22;
    }
    v24 = MSSqliteBindStringOrNull(v6, 4, v10);
    v25 = v24;
    MSSqliteTrapForDBLockError(v24);
    if (v25)
    {
      v15 = -[MSASModelBase dbQueueDB](self, "dbQueueDB");
      v16 = self;
      v17 = 577;
      goto LABEL_22;
    }
    v26 = MSSqliteBindStringOrNull(v6, 5, v11);
    v27 = v26;
    MSSqliteTrapForDBLockError(v26);
    if (v27)
    {
      v15 = -[MSASModelBase dbQueueDB](self, "dbQueueDB");
      v16 = self;
      v17 = 578;
      goto LABEL_22;
    }
    v28 = MSSqliteBindStringOrNull(v6, 6, v12);
    v29 = v28;
    MSSqliteTrapForDBLockError(v28);
    if (v29)
    {
      v15 = -[MSASModelBase dbQueueDB](self, "dbQueueDB");
      v16 = self;
      v17 = 579;
      goto LABEL_22;
    }
    v30 = sqlite3_step(v6);
    v31 = v30;
    MSSqliteTrapForDBLockError(v30);
    if (v31 != 101)
    {
      v15 = -[MSASModelBase dbQueueDB](self, "dbQueueDB");
      v16 = self;
      v17 = 580;
      goto LABEL_22;
    }
    ++v36;
    v7 = sqlite3_step(a3);
    v32 = 1;
LABEL_23:

    if ((v32 & 1) == 0)
      goto LABEL_27;
  }
  v33 = sqlite3_step(a4);
  v34 = v33;
  MSSqliteTrapForDBLockError(v33);
  if (v34 != 101)
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 586);
LABEL_27:
  if (v6)
    sqlite3_reset(v6);
  -[MSASModelBase endTransaction](self, "endTransaction");
}

- (void)dbQueueRequeuePendingCommandsWithAssetCollectionGUID:(id)a3
{
  sqlite3_stmt *v4;
  uint64_t v5;
  int v6;
  sqlite3_stmt *v7;
  uint64_t v8;
  int v9;
  id v10;

  v10 = a3;
  v4 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select command, params, personID, albumGUID, assetCollectionGUID from PendingCommandQueue where assetCollectionGUID = ?;"));
  v5 = MSSqliteBindStringOrNull(v4, 1, v10);
  v6 = v5;
  MSSqliteTrapForDBLockError(v5);
  if (v6)
  {
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 597);
    v7 = 0;
    if (!v4)
      goto LABEL_7;
    goto LABEL_6;
  }
  v7 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("delete from PendingCommandQueue where AssetCollectionGUID = ?;"));
  v8 = MSSqliteBindStringOrNull(v7, 1, v10);
  v9 = v8;
  MSSqliteTrapForDBLockError(v8);
  if (v9)
  {
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 600);
    if (!v4)
      goto LABEL_7;
    goto LABEL_6;
  }
  -[MSASPersonModel dbQueueRequeuePendingCommandsWithQueryStatement:deleteStatement:](self, "dbQueueRequeuePendingCommandsWithQueryStatement:deleteStatement:", v4, v7);
  if (v4)
LABEL_6:
    sqlite3_reset(v4);
LABEL_7:
  if (v7)
    sqlite3_reset(v7);

}

- (void)dbQueueRequeuePendingCommandsWithAlbumGUID:(id)a3
{
  sqlite3_stmt *v4;
  uint64_t v5;
  int v6;
  sqlite3_stmt *v7;
  uint64_t v8;
  int v9;
  id v10;

  v10 = a3;
  v4 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select command, params, personID, albumGUID, assetCollectionGUID from PendingCommandQueue where albumGUID = ?;"));
  v5 = MSSqliteBindStringOrNull(v4, 1, v10);
  v6 = v5;
  MSSqliteTrapForDBLockError(v5);
  if (v6)
  {
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 613);
    v7 = 0;
    if (!v4)
      goto LABEL_7;
    goto LABEL_6;
  }
  v7 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("delete from PendingCommandQueue where albumGUID = ?;"));
  v8 = MSSqliteBindStringOrNull(v7, 1, v10);
  v9 = v8;
  MSSqliteTrapForDBLockError(v8);
  if (v9)
  {
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 616);
    if (!v4)
      goto LABEL_7;
    goto LABEL_6;
  }
  -[MSASPersonModel dbQueueRequeuePendingCommandsWithQueryStatement:deleteStatement:](self, "dbQueueRequeuePendingCommandsWithQueryStatement:deleteStatement:", v4, v7);
  if (v4)
LABEL_6:
    sqlite3_reset(v4);
LABEL_7:
  if (v7)
    sqlite3_reset(v7);

}

- (id)_commandWithMinimumIdentifier:(id)a3 outParams:(id *)a4 outCommandIdentifier:(int64_t *)a5 outPersonID:(id *)a6 outAlbumGUID:(id *)a7 outAssetCollectionGUID:(id *)a8
{
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v20;
  MSASPersonModel *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;

  v11 = a3;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__4448;
  v60 = __Block_byref_object_dispose__4449;
  v61 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__4448;
  v54 = __Block_byref_object_dispose__4449;
  v55 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__4448;
  v44 = __Block_byref_object_dispose__4449;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__4448;
  v38 = __Block_byref_object_dispose__4449;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__4448;
  v32 = __Block_byref_object_dispose__4449;
  v33 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__MSASPersonModel__commandWithMinimumIdentifier_outParams_outCommandIdentifier_outPersonID_outAlbumGUID_outAssetCollectionGUID___block_invoke;
  block[3] = &unk_1E95BBC78;
  v13 = v11;
  v20 = v13;
  v21 = self;
  v22 = &v56;
  v23 = &v50;
  v24 = &v46;
  v25 = &v40;
  v26 = &v34;
  v27 = &v28;
  dispatch_sync(v12, block);

  if (a4)
    *a4 = objc_retainAutorelease((id)v51[5]);
  if (a5)
    *a5 = v47[3];
  if (a6)
    *a6 = objc_retainAutorelease((id)v41[5]);
  if (a7)
    *a7 = objc_retainAutorelease((id)v35[5]);
  if (a8)
    *a8 = objc_retainAutorelease((id)v29[5]);
  v14 = (id)v57[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  return v14;
}

- (id)commandAtHeadOfQueueOutParams:(id *)a3 outCommandIdentifier:(int64_t *)a4 outPersonID:(id *)a5 outAlbumGUID:(id *)a6 outAssetCollectionGUID:(id *)a7
{
  return -[MSASPersonModel _commandWithMinimumIdentifier:outParams:outCommandIdentifier:outPersonID:outAlbumGUID:outAssetCollectionGUID:](self, "_commandWithMinimumIdentifier:outParams:outCommandIdentifier:outPersonID:outAlbumGUID:outAssetCollectionGUID:", 0, a3, a4, a5, a6, a7);
}

- (id)commandWithMinimumIdentifier:(int64_t)a3 outParams:(id *)a4 outCommandIdentifier:(int64_t *)a5 outPersonID:(id *)a6 outAlbumGUID:(id *)a7 outAssetCollectionGUID:(id *)a8
{
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASPersonModel _commandWithMinimumIdentifier:outParams:outCommandIdentifier:outPersonID:outAlbumGUID:outAssetCollectionGUID:](self, "_commandWithMinimumIdentifier:outParams:outCommandIdentifier:outPersonID:outAlbumGUID:outAssetCollectionGUID:", v14, a4, a5, a6, a7, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setParams:(id)a3 forCommandWithIdentifier:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MSASPersonModel_setParams_forCommandWithIdentifier___block_invoke;
  block[3] = &unk_1E95BBFC0;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)dbQueueRemoveCommandAtHeadOfQueue
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASModelBase dbQueue](self, "dbQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MSASPersonModel_dbQueueRemoveCommandAtHeadOfQueue__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)removeCommandIdentifier:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[MSASModelBase dbQueue](self, "dbQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__MSASPersonModel_removeCommandIdentifier___block_invoke;
  v6[3] = &unk_1E95BCF48;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)dbQueueRemoveCommandIdentifier:(int64_t)a3
{
  sqlite3_stmt *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  MSASPersonModel *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2048;
    v14 = a3;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Removing command at order %lld.", (uint8_t *)&v11, 0x16u);
  }
  v5 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("delete from CommandQueue where ord = ?;"));
  v6 = sqlite3_reset(v5);
  v7 = v6;
  MSSqliteTrapForDBLockError(v6);
  if (!v7)
  {
    v8 = sqlite3_bind_int64(v5, 1, a3);
    v9 = v8;
    MSSqliteTrapForDBLockError(v8);
    if (!v9)
    {
      v10 = sqlite3_step(v5);
      MSSqliteTrapForDBLockError(v10);
    }
  }
  sqlite3_reset(v5);
}

- (void)dbQueueRemoveAllEntriesFromTable:(id)a3
{
  id v4;
  void *v5;
  sqlite3_stmt *v6;
  uint64_t v7;
  uint8_t buf[4];
  MSASPersonModel *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v4;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Removing all entries from table %{public}@.", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("delete from %@;"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MSASModelBase statementForString:](self, "statementForString:", v5);

  v7 = sqlite3_step(v6);
  LODWORD(v5) = v7;
  MSSqliteTrapForDBLockError(v7);
  if ((_DWORD)v5 != 101)
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 773);
  if (v6)
    sqlite3_reset(v6);

}

- (void)purgeCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__MSASPersonModel_purgeCompletionBlock___block_invoke;
  v7[3] = &unk_1E95BCF98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (int64_t)countOfEnqueuedCommand:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MSASPersonModel_countOfEnqueuedCommand___block_invoke;
  block[3] = &unk_1E95BC2F0;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (int64_t)countOfEnqueuedCommands
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__MSASPersonModel_countOfEnqueuedCommands__block_invoke;
  v6[3] = &unk_1E95BCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isAssetCollectionWithGUIDPending:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MSASPersonModel_isAssetCollectionWithGUIDPending___block_invoke;
  block[3] = &unk_1E95BC2F0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (BOOL)dbQueueIsAssetCollectionWithGUIDPending:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  uint64_t v6;
  int v7;
  BOOL v8;

  v4 = a3;
  v5 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select assetCollectionGUID from PendingAssetCollections where assetCollectionGUID = ? limit 1;"));
  v6 = MSSqliteBindStringOrNull(v5, 1, v4);

  MSSqliteTrapForDBLockError(v6);
  if (!(_DWORD)v6)
  {
    v7 = sqlite3_step(v5);
    v8 = v7 == 100;
    if ((v7 & 0xFFFFFFFE) == 0x64)
      goto LABEL_5;
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 870);
  }
  v8 = 0;
LABEL_5:
  if (v5)
    sqlite3_reset(v5);
  return v8;
}

- (void)addPendingAssetCollectionGUID:(id)a3 albumGUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MSASPersonModel_addPendingAssetCollectionGUID_albumGUID___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)requeuePendingAssetCollectionGUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__MSASPersonModel_requeuePendingAssetCollectionGUID___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)requeuePendingAssetCollectionsWithAlbumGUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__MSASPersonModel_requeuePendingAssetCollectionsWithAlbumGUID___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (int)dbQueueAssetCountAlbumGUID:(id)a3 inQueue:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  sqlite3_stmt *v10;
  uint64_t v11;
  int v12;
  _BOOL4 v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  uint64_t v17;
  int v18;
  uint8_t buf[4];
  MSASPersonModel *v21;
  __int16 v22;
  _BYTE v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
    v8 = CFSTR("select count(*) from %@ where albumGUID = ?");
  else
    v8 = CFSTR("select count(*) from %@;");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MSASModelBase statementForString:](self, "statementForString:", v9);

  v11 = sqlite3_reset(v10);
  LODWORD(v9) = v11;
  MSSqliteTrapForDBLockError(v11);
  if ((_DWORD)v9)
    goto LABEL_5;
  if (v6)
  {
    v17 = sqlite3_bind_text(v10, 1, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, 0);
    v18 = v17;
    MSSqliteTrapForDBLockError(v17);
    if (v18)
      goto LABEL_5;
  }
  if (sqlite3_step(v10) != 100)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v21 = self;
      v22 = 2114;
      *(_QWORD *)v23 = v7;
      *(_WORD *)&v23[8] = 2082;
      *(_QWORD *)&v23[10] = sqlite3_errmsg(-[MSASModelBase dbQueueDB](self, "dbQueueDB"));
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Cannot count number of assets enqueued in %{public}@. Error: %{public}s", buf, 0x20u);
    }
LABEL_5:
    v12 = 0;
    if (!v10)
      goto LABEL_7;
    goto LABEL_6;
  }
  v12 = sqlite3_column_int(v10, 0);
  if (v10)
LABEL_6:
    sqlite3_reset(v10);
LABEL_7:
  v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138544130;
      v21 = self;
      v22 = 1024;
      *(_DWORD *)v23 = v12;
      *(_WORD *)&v23[4] = 2114;
      *(_QWORD *)&v23[6] = v7;
      *(_WORD *)&v23[14] = 2114;
      *(_QWORD *)&v23[16] = v6;
      v14 = MEMORY[0x1E0C81028];
      v15 = "%{public}@: Found %d assets enqueued in %{public}@ for album GUID %{public}@.";
      v16 = 38;
LABEL_20:
      _os_log_debug_impl(&dword_1D3E94000, v14, OS_LOG_TYPE_DEBUG, v15, buf, v16);
    }
  }
  else if (v13)
  {
    *(_DWORD *)buf = 138543874;
    v21 = self;
    v22 = 1024;
    *(_DWORD *)v23 = v12;
    *(_WORD *)&v23[4] = 2114;
    *(_QWORD *)&v23[6] = v7;
    v14 = MEMORY[0x1E0C81028];
    v15 = "%{public}@: Found %d assets enqueued in %{public}@.";
    v16 = 28;
    goto LABEL_20;
  }

  return v12;
}

- (void)dbQueueSetErrorCount:(int)a3 forGUID:(id)a4 inQueue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  sqlite3_stmt *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint8_t buf[4];
  MSASPersonModel *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138544130;
    v19 = self;
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v9;
    v24 = 1024;
    v25 = a3;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Setting error count for GUID %{public}@ in %{public}@ to %d.", buf, 0x26u);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("update %@ set errorCount = ? where GUID = ?;"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MSASModelBase statementForString:](self, "statementForString:", v10);

  v12 = sqlite3_reset(v11);
  LODWORD(v10) = v12;
  MSSqliteTrapForDBLockError(v12);
  if (!(_DWORD)v10)
  {
    v13 = sqlite3_bind_int(v11, 1, a3);
    v14 = v13;
    MSSqliteTrapForDBLockError(v13);
    if (!v14)
    {
      v15 = sqlite3_bind_text(v11, 2, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, 0);
      v16 = v15;
      MSSqliteTrapForDBLockError(v15);
      if (!v16)
      {
        v17 = sqlite3_step(v11);
        MSSqliteTrapForDBLockError(v17);
      }
    }
  }
  sqlite3_reset(v11);

}

- (void)dbQueueRemoveGUID:(id)a3 fromQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  sqlite3_stmt *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint8_t buf[4];
  MSASPersonModel *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    v15 = self;
    v16 = 2114;
    v17 = v6;
    v18 = 2114;
    v19 = v7;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Removing GUID %{public}@ from %{public}@.", buf, 0x20u);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("delete from %@ where GUID = ?;"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MSASModelBase statementForString:](self, "statementForString:", v8);

  v10 = sqlite3_reset(v9);
  LODWORD(v8) = v10;
  MSSqliteTrapForDBLockError(v10);
  if (!(_DWORD)v8)
  {
    v11 = sqlite3_bind_text(v9, 1, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v12 = v11;
    MSSqliteTrapForDBLockError(v11);
    if (!v12)
    {
      v13 = sqlite3_step(v9);
      MSSqliteTrapForDBLockError(v13);
    }
  }
  sqlite3_reset(v9);

}

- (BOOL)dbQueueIsGUIDQueued:(id)a3 inQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  sqlite3_stmt *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  int v13;
  _BOOL4 v14;
  int v16;
  uint8_t buf[4];
  MSASPersonModel *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("select GUID from %@ where GUID = ? limit 1;"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MSASModelBase statementForString:](self, "statementForString:", v8);

  v10 = sqlite3_reset(v9);
  LODWORD(v8) = v10;
  MSSqliteTrapForDBLockError(v10);
  if ((_DWORD)v8
    || (v11 = objc_retainAutorelease(v6),
        v12 = sqlite3_bind_text(v9, 1, (const char *)objc_msgSend(v11, "UTF8String"), -1, 0),
        v13 = v12,
        MSSqliteTrapForDBLockError(v12),
        v13))
  {
    sqlite3_reset(v9);
    LOBYTE(v14) = 0;
  }
  else
  {
    v16 = sqlite3_step(v9);
    v14 = v16 == 100;
    if ((v16 & 0xFFFFFFFE) != 0x64 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v18 = self;
      v19 = 2114;
      v20 = v11;
      v21 = 2114;
      v22 = v7;
      v23 = 2082;
      v24 = sqlite3_errmsg(-[MSASModelBase dbQueueDB](self, "dbQueueDB"));
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Cannot check if GUID %{public}@ is in %{public}@. Error: %{public}s", buf, 0x2Au);
    }
    sqlite3_reset(v9);
  }

  return v14;
}

- (int64_t)nextMMCSItemID
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__MSASPersonModel_nextMMCSItemID__block_invoke;
  v6[3] = &unk_1E95BCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)enqueueAssetForDownload:(id)a3 inAlbumWithGUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MSASPersonModel_enqueueAssetForDownload_inAlbumWithGUID___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (int)assetsInDownloadQueue
{
  MSASPersonModel *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__MSASPersonModel_assetsInDownloadQueue__block_invoke;
  v5[3] = &unk_1E95BCEF8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

- (int)assetsInDownloadQueueAlbumGUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MSASPersonModel_assetsInDownloadQueueAlbumGUID___block_invoke;
  block[3] = &unk_1E95BC2F0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LODWORD(v4) = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return (int)v4;
}

- (id)nextItemsForDownloadFocusAlbumGUID:(id)a3 focusAssetCollectionGUID:(id)a4 thumbnails:(BOOL)a5 maxCount:(int)a6 isInflight:(BOOL)a7
{
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v20;
  id v21;
  uint64_t *v22;
  int v23;
  BOOL v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v12 = a3;
  v13 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4448;
  v30 = __Block_byref_object_dispose__4449;
  v31 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__MSASPersonModel_nextItemsForDownloadFocusAlbumGUID_focusAssetCollectionGUID_thumbnails_maxCount_isInflight___block_invoke;
  block[3] = &unk_1E95BBCA0;
  v24 = a5;
  block[4] = self;
  v20 = v12;
  v25 = a7;
  v21 = v13;
  v22 = &v26;
  v23 = a6;
  v15 = v13;
  v16 = v12;
  dispatch_sync(v14, block);

  v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v17;
}

- (id)nextItemsForDownloadFocusAlbumGUID:(id)a3 focusAssetCollectionGUID:(id)a4 maxCount:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  -[MSASPersonModel nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:thumbnails:maxCount:isInflight:](self, "nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:thumbnails:maxCount:isInflight:", v8, v9, 1, v5, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {
    -[MSASPersonModel nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:thumbnails:maxCount:isInflight:](self, "nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:thumbnails:maxCount:isInflight:", v8, v9, 1, v5, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  if (!objc_msgSend(v10, "count"))
  {
    -[MSASPersonModel nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:thumbnails:maxCount:isInflight:](self, "nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:thumbnails:maxCount:isInflight:", v8, v9, 0, v5, 1);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  if (!objc_msgSend(v10, "count"))
  {
    -[MSASPersonModel nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:thumbnails:maxCount:isInflight:](self, "nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:thumbnails:maxCount:isInflight:", v8, v9, 0, v5, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }

  return v10;
}

- (BOOL)hasItemsForDownloadCountFocusAlbumGUID:(id)a3 focusAssetCollectionGUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__MSASPersonModel_hasItemsForDownloadCountFocusAlbumGUID_focusAssetCollectionGUID___block_invoke;
  v12[3] = &unk_1E95BBCC8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v8) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v8;
}

- (int)itemsForDownloadCountFocusAlbumGUID:(id)a3 focusAssetCollectionGUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__MSASPersonModel_itemsForDownloadCountFocusAlbumGUID_focusAssetCollectionGUID___block_invoke;
  v12[3] = &unk_1E95BBCC8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v12);

  LODWORD(v8) = *((_DWORD *)v17 + 6);
  _Block_object_dispose(&v16, 8);
  return (int)v8;
}

- (void)setErrorCount:(int)a3 forAssetInDownloadQueue:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MSASPersonModel_setErrorCount_forAssetInDownloadQueue___block_invoke;
  block[3] = &unk_1E95BC610;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)setInFlightAssets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "GUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    -[MSASModelBase dbQueue](self, "dbQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __37__MSASPersonModel_setInFlightAssets___block_invoke;
    v14[3] = &unk_1E95BCFC0;
    v14[4] = self;
    v15 = v5;
    v13 = v5;
    dispatch_async(v12, v14);

  }
}

- (void)removeAssetsFromDownloadQueue:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__MSASPersonModel_removeAssetsFromDownloadQueue___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)enqueueAssetCollectionForUpload:(id)a3 album:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MSASPersonModel_enqueueAssetCollectionForUpload_album___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (int)assetCollectionsInUploadQueue
{
  MSASPersonModel *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__MSASPersonModel_assetCollectionsInUploadQueue__block_invoke;
  v5[3] = &unk_1E95BCEF8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

- (int)assetCollectionsInUploadQueueAlbumGUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MSASPersonModel_assetCollectionsInUploadQueueAlbumGUID___block_invoke;
  block[3] = &unk_1E95BC2F0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LODWORD(v4) = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return (int)v4;
}

- (id)itemsForUpload
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4448;
  v11 = __Block_byref_object_dispose__4449;
  v12 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__MSASPersonModel_itemsForUpload__block_invoke;
  v6[3] = &unk_1E95BCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)nextItemsForUploadMaxCount:(int)a3
{
  return -[MSASPersonModel nextItemsForUploadAlbumGUID:maxPriority:maxCount:](self, "nextItemsForUploadAlbumGUID:maxPriority:maxCount:", 0, 0x7FFFFFFFLL, *(_QWORD *)&a3);
}

- (id)nextItemsForUploadAlbumGUID:(id)a3 maxPriority:(int)a4 maxCount:(int)a5
{
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4448;
  v22 = __Block_byref_object_dispose__4449;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[MSASModelBase dbQueue](self, "dbQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__MSASPersonModel_nextItemsForUploadAlbumGUID_maxPriority_maxCount___block_invoke;
  v13[3] = &unk_1E95BBD10;
  v13[4] = self;
  v14 = v8;
  v16 = a5;
  v17 = a4;
  v15 = &v18;
  v10 = v8;
  dispatch_sync(v9, v13);

  v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (void)setErrorCount:(int)a3 forAssetCollectionInUploadQueue:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MSASPersonModel_setErrorCount_forAssetCollectionInUploadQueue___block_invoke;
  block[3] = &unk_1E95BC610;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)removeAssetCollectionsFromUploadQueue:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[MSASModelBase dbQueue](self, "dbQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__MSASPersonModel_removeAssetCollectionsFromUploadQueue___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)shouldDownloadEarliestPhotosFirst
{
  return self->_shouldDownloadEarliestPhotosFirst;
}

- (void)setShouldDownloadEarliestPhotosFirst:(BOOL)a3
{
  self->_shouldDownloadEarliestPhotosFirst = a3;
}

uint64_t __57__MSASPersonModel_removeAssetCollectionsFromUploadQueue___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dbQueueBeginTransaction");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "GUID", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "dbQueueRemoveGUID:fromQueue:", v8, CFSTR("UploadQueue"));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "dbQueueEndTransaction");
}

void __65__MSASPersonModel_setErrorCount_forAssetCollectionInUploadQueue___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(unsigned int *)(a1 + 48);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "GUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dbQueueSetErrorCount:forGUID:inQueue:", v1, v3, CFSTR("UploadQueue"));

}

void __68__MSASPersonModel_nextItemsForUploadAlbumGUID_maxPriority_maxCount___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  sqlite3_stmt *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  void *v18;
  const void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  const void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  int v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v29 = *(void **)(a1 + 32);
    v30 = *(_QWORD *)(a1 + 40);
    v31 = *(_DWORD *)(a1 + 56);
    v36 = 138543874;
    v37 = v29;
    v38 = 2114;
    v39 = v30;
    v40 = 1024;
    v41 = v31;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Querying for next items to upload. Album GUID: %{public}@. Max: %d.", (uint8_t *)&v36, 0x1Cu);
  }
  if (*(_QWORD *)(a1 + 40))
    v2 = CFSTR("select object, album, errorCount from UploadQueue where albumGUID = :alb and uploadPriority <= :priority order by uploadPriority,ord limit :lim;");
  else
    v2 = CFSTR("select object, album, errorCount from UploadQueue where uploadPriority <= :priority order by uploadPriority,ord limit :lim;");
  v3 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", v2);
  v4 = sqlite3_reset(v3);
  v5 = v4;
  MSSqliteTrapForDBLockError(v4);
  if (v5)
    goto LABEL_7;
  if (*(_QWORD *)(a1 + 40))
  {
    v8 = sqlite3_bind_parameter_index(v3, ":alb");
    v9 = sqlite3_bind_text(v3, v8, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
    v10 = v9;
    MSSqliteTrapForDBLockError(v9);
    if (v10)
      goto LABEL_7;
  }
  v11 = sqlite3_bind_parameter_index(v3, ":lim");
  v12 = sqlite3_bind_int(v3, v11, *(_DWORD *)(a1 + 56));
  v13 = v12;
  MSSqliteTrapForDBLockError(v12);
  if (v13)
    goto LABEL_7;
  v14 = sqlite3_bind_parameter_index(v3, ":priority");
  v15 = sqlite3_bind_int(v3, v14, *(_DWORD *)(a1 + 60));
  v16 = v15;
  MSSqliteTrapForDBLockError(v15);
  if (v16)
    goto LABEL_7;
  while (1)
  {
    v17 = sqlite3_step(v3);
    if (v17 != 100)
      break;
    v18 = (void *)objc_opt_new();
    v19 = sqlite3_column_blob(v3, 0);
    v20 = sqlite3_column_bytes(v3, 0);
    v21 = (void *)MEMORY[0x1E0CB3710];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v19, v20, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "MSSafeUnarchiveObjectWithData:outError:", v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setObject:", v23);
    v24 = sqlite3_column_blob(v3, 1);
    v25 = sqlite3_column_bytes(v3, 1);
    v26 = (void *)MEMORY[0x1E0CB3710];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v24, v25, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "MSSafeUnarchiveObjectWithData:outError:", v27, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setAlbum:", v28);
    objc_msgSend(v18, "setErrorCount:", sqlite3_column_int(v3, 2));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v18);

  }
  if (v17 != 101)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v34 = *(void **)(a1 + 32);
      v35 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v34, "dbQueueDB"));
      v36 = 138543618;
      v37 = v34;
      v38 = 2082;
      v39 = (uint64_t)v35;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Error retrieving items for upload. Error: %{public}s", (uint8_t *)&v36, 0x16u);
    }
LABEL_7:
    sqlite3_reset(v3);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    return;
  }
  sqlite3_reset(v3);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v32 = *(void **)(a1 + 32);
    v33 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
    v36 = 138543618;
    v37 = v32;
    v38 = 2048;
    v39 = v33;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: ...found %ld items.", (uint8_t *)&v36, 0x16u);
  }
}

void __33__MSASPersonModel_itemsForUpload__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "dbQueueDB");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("select object, album, errorCount from UploadQueue;"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[MSASModelEnumerator enumeratorWithDatabase:query:stepBlock:](MSASModelEnumerator, "enumeratorWithDatabase:query:stepBlock:", v2, v6, &__block_literal_global_4459);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __33__MSASPersonModel_itemsForUpload__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v3;
  const void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  const void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  v4 = sqlite3_column_blob(a2, 0);
  v5 = sqlite3_column_bytes(a2, 0);
  v6 = (void *)MEMORY[0x1E0CB3710];
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v4, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MSSafeUnarchiveObjectWithData:outError:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:", v8);
  v9 = sqlite3_column_blob(a2, 1);
  v10 = sqlite3_column_bytes(a2, 1);
  v11 = (void *)MEMORY[0x1E0CB3710];
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v9, v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "MSSafeUnarchiveObjectWithData:outError:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAlbum:", v13);
  objc_msgSend(v3, "setErrorCount:", sqlite3_column_int(a2, 2));

  return v3;
}

uint64_t __58__MSASPersonModel_assetCollectionsInUploadQueueAlbumGUID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dbQueueAssetCountAlbumGUID:inQueue:", *(_QWORD *)(a1 + 40), CFSTR("UploadQueue"));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __48__MSASPersonModel_assetCollectionsInUploadQueue__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dbQueueAssetCountAlbumGUID:inQueue:", 0, CFSTR("UploadQueue"));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __57__MSASPersonModel_enqueueAssetCollectionForUpload_album___block_invoke(id *a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  sqlite3_stmt *v6;
  uint64_t v7;
  int v8;
  void *v9;
  double v10;
  uint64_t v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  int v21;
  id v22;
  uint64_t v23;
  int v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  int v35;
  id v36;
  uint64_t v37;
  int v38;
  id v39;
  uint64_t v40;
  int v41;
  id v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v26 = a1[4];
    v27 = a1[5];
    objc_msgSend(a1[6], "GUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v52 = v26;
    v53 = 2114;
    v54 = v27;
    v55 = 2114;
    v56 = v28;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Enqueueing upload for asset collection: %{public}@\n In album with GUID: %{public}@", buf, 0x20u);

  }
  v2 = a1[4];
  objc_msgSend(a1[5], "GUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "dbQueueIsGUIDQueued:inQueue:", v3, CFSTR("UploadQueue"));

  if ((_DWORD)v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v4 = a1[4];
      v5 = a1[5];
      *(_DWORD *)buf = 138543618;
      v52 = v4;
      v53 = 2114;
      v54 = v5;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Attempting to re-enqueue asset collection %{public}@ for upload. Ignoring.", buf, 0x16u);
    }
  }
  else
  {
    v6 = (sqlite3_stmt *)objc_msgSend(a1[4], "statementForString:", CFSTR("insert into UploadQueue (ord, object, album, GUID, albumGUID, uploadPriority) values (?, ?, ?, ?, ?, ?);"));
    v7 = sqlite3_reset(v6);
    v8 = v7;
    MSSqliteTrapForDBLockError(v7);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceReferenceDate");
      v11 = sqlite3_bind_double(v6, 1, v10);
      v12 = v11;
      MSSqliteTrapForDBLockError(v11);

      if (!v12)
      {
        v13 = a1[5];
        v50 = 0;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v50);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v50;
        v16 = v15;
        if (!v14)
        {
          v17 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v15, "userInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("Failed to archive an assetCollection object. Error: %@ Info: %@"), v16, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v52 = v19;
            _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }

        }
        v20 = objc_msgSend(v14, "length");
        if (v20 >> 31)
          __assert_rtn("-[MSASPersonModel enqueueAssetCollectionForUpload:album:]_block_invoke", "MSASPersonModel.m", 1356, "objectArchiveLength <= INT_MAX");
        v21 = v20;
        v22 = objc_retainAutorelease(v14);
        v23 = sqlite3_bind_blob(v6, 2, (const void *)objc_msgSend(v22, "bytes"), v21, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        v24 = v23;
        MSSqliteTrapForDBLockError(v23);
        if (v24)
        {
          v25 = v16;
        }
        else
        {
          v29 = a1[6];
          v49 = v16;
          objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v29, 1, &v49);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v49;

          if (!v30)
          {
            v31 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v25, "userInfo");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "stringWithFormat:", CFSTR("Failed to archive an album object. Error: %@ Info: %@"), v25, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v52 = v33;
              _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
            }

          }
          v34 = objc_msgSend(v30, "length");
          if (v34 >> 31)
            __assert_rtn("-[MSASPersonModel enqueueAssetCollectionForUpload:album:]_block_invoke", "MSASPersonModel.m", 1364, "albumArchiveLength <= INT_MAX");
          v35 = v34;
          v36 = objc_retainAutorelease(v30);
          v37 = sqlite3_bind_blob(v6, 3, (const void *)objc_msgSend(v36, "bytes"), v35, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          v38 = v37;
          MSSqliteTrapForDBLockError(v37);
          if (!v38)
          {
            objc_msgSend(a1[5], "GUID");
            v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v40 = sqlite3_bind_text(v6, 4, (const char *)objc_msgSend(v39, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
            v41 = v40;
            MSSqliteTrapForDBLockError(v40);

            if (!v41)
            {
              objc_msgSend(a1[6], "GUID");
              v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v43 = sqlite3_bind_text(v6, 5, (const char *)objc_msgSend(v42, "UTF8String"), -1, 0);
              v44 = v43;
              MSSqliteTrapForDBLockError(v43);

              if (!v44)
              {
                if (objc_msgSend(a1[5], "isVideo"))
                  v45 = 10;
                else
                  v45 = 0;
                v46 = sqlite3_bind_int(v6, 6, v45);
                v47 = v46;
                MSSqliteTrapForDBLockError(v46);
                if (!v47)
                {
                  v48 = sqlite3_step(v6);
                  MSSqliteTrapForDBLockError(v48);
                }
              }
            }
          }

        }
      }
    }
    sqlite3_reset(v6);
  }
}

uint64_t __49__MSASPersonModel_removeAssetsFromDownloadQueue___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dbQueueBeginTransaction");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "GUID", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "dbQueueRemoveGUID:fromQueue:", v8, CFSTR("DownloadQueue"));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "dbQueueEndTransaction");
}

void __37__MSASPersonModel_setInFlightAssets___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v26 = v16;
    v27 = 2114;
    v28 = v17;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Setting inflight for assets with GUIDs %{public}@ in DownloadQueue.", buf, 0x16u);
  }
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("update or ignore DownloadQueue set isInflight = 1 where GUID = ?;"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v7);
        v9 = sqlite3_reset(v2);
        v10 = v9;
        MSSqliteTrapForDBLockError(v9);
        if (v10
          || (v11 = objc_retainAutorelease(v8),
              v12 = sqlite3_bind_text(v2, 1, (const char *)objc_msgSend(v11, "UTF8String", (_QWORD)v20), -1, 0),
              v13 = v12,
              MSSqliteTrapForDBLockError(v12),
              v13)
          || (v14 = sqlite3_step(v2), v15 = v14, MSSqliteTrapForDBLockError(v14), v15 != 101))
        {

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v18 = *(_QWORD *)(a1 + 32);
            v19 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            v26 = v18;
            v27 = 2114;
            v28 = v19;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to set inflight for assets with GUIDs %{public}@ in DownloadQueue.", buf, 0x16u);
          }
          return;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v5)
        continue;
      break;
    }
  }

}

void __57__MSASPersonModel_setErrorCount_forAssetInDownloadQueue___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(unsigned int *)(a1 + 48);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "GUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dbQueueSetErrorCount:forGUID:inQueue:", v1, v3, CFSTR("DownloadQueue"));

}

void __80__MSASPersonModel_itemsForDownloadCountFocusAlbumGUID_focusAssetCollectionGUID___block_invoke(_QWORD *a1)
{
  void *v2;
  const __CFString *v3;
  sqlite3_stmt *v4;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  int v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v14 = (void *)a1[4];
    v15 = (const char *)a1[5];
    v16 = a1[6];
    v19 = 138543874;
    v20 = v14;
    v21 = 2114;
    v22 = v15;
    v23 = 2114;
    v24 = v16;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Counting number of assets to download using criteria: focus album GUID: %{public}@ focus asset collection GUID: %{public}@", (uint8_t *)&v19, 0x20u);
  }
  if (a1[6])
  {
    v2 = (void *)a1[4];
    v3 = CFSTR("select count(*) from DownloadQueue where assetCollectionGUID = :assetcol;");
  }
  else
  {
    v2 = (void *)a1[4];
    if (a1[5])
      v3 = CFSTR("select count(*) from DownloadQueue where albumGUID = :album;");
    else
      v3 = CFSTR("select count(*) from DownloadQueue;");
  }
  v4 = (sqlite3_stmt *)objc_msgSend(v2, "statementForString:", v3);
  v5 = sqlite3_reset(v4);
  v6 = v5;
  MSSqliteTrapForDBLockError(v5);
  if (v6)
    goto LABEL_22;
  if (a1[6])
  {
    v7 = sqlite3_bind_parameter_index(v4, ":assetcol");
    v8 = (void *)a1[6];
  }
  else
  {
    if (!a1[5])
      goto LABEL_16;
    v7 = sqlite3_bind_parameter_index(v4, ":album");
    v8 = (void *)a1[5];
  }
  v9 = sqlite3_bind_text(v4, v7, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, 0);
  v10 = v9;
  MSSqliteTrapForDBLockError(v9);
  if (v10)
  {
LABEL_22:
    sqlite3_reset(v4);
    return;
  }
LABEL_16:
  while (1)
  {
    v11 = sqlite3_step(v4);
    if (v11 != 100)
      break;
    *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = sqlite3_column_int(v4, 0);
  }
  if (v11 != 101)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)a1[4];
      v18 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v17, "dbQueueDB"));
      v19 = 138543618;
      v20 = v17;
      v21 = 2082;
      v22 = v18;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Error counting items for download. Error: %{public}s", (uint8_t *)&v19, 0x16u);
    }
    goto LABEL_22;
  }
  sqlite3_reset(v4);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v12 = (void *)a1[4];
    v13 = *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    v19 = 138543618;
    v20 = v12;
    v21 = 1024;
    LODWORD(v22) = v13;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: ...found %d assets.", (uint8_t *)&v19, 0x12u);
  }
}

void __83__MSASPersonModel_hasItemsForDownloadCountFocusAlbumGUID_focusAssetCollectionGUID___block_invoke(_QWORD *a1)
{
  void *v2;
  const __CFString *v3;
  sqlite3_stmt *v4;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  int v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v14 = (void *)a1[4];
    v15 = (const char *)a1[5];
    v16 = a1[6];
    v19 = 138543874;
    v20 = v14;
    v21 = 2114;
    v22 = v15;
    v23 = 2114;
    v24 = v16;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Checking if there are assets to download using criteria: focus album GUID: %{public}@ focus asset collection GUID: %{public}@", (uint8_t *)&v19, 0x20u);
  }
  if (a1[6])
  {
    v2 = (void *)a1[4];
    v3 = CFSTR("select ord from DownloadQueue where assetCollectionGUID = :assetcol limit 1;");
  }
  else
  {
    v2 = (void *)a1[4];
    if (a1[5])
      v3 = CFSTR("select ord from DownloadQueue where albumGUID = :album limit 1;");
    else
      v3 = CFSTR("select ord from DownloadQueue limit 1;");
  }
  v4 = (sqlite3_stmt *)objc_msgSend(v2, "statementForString:", v3);
  v5 = sqlite3_reset(v4);
  v6 = v5;
  MSSqliteTrapForDBLockError(v5);
  if (v6)
    goto LABEL_21;
  if (a1[6])
  {
    v7 = sqlite3_bind_parameter_index(v4, ":assetcol");
    v8 = (void *)a1[6];
  }
  else
  {
    if (!a1[5])
      goto LABEL_14;
    v7 = sqlite3_bind_parameter_index(v4, ":album");
    v8 = (void *)a1[5];
  }
  v9 = sqlite3_bind_text(v4, v7, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, 0);
  v10 = v9;
  MSSqliteTrapForDBLockError(v9);
  if (v10)
  {
LABEL_21:
    sqlite3_reset(v4);
    return;
  }
LABEL_14:
  while (1)
  {
    v11 = sqlite3_step(v4);
    if (v11 != 100)
      break;
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
  if (v11 != 101)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)a1[4];
      v18 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v17, "dbQueueDB"));
      v19 = 138543618;
      v20 = v17;
      v21 = 2082;
      v22 = v18;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Error checking for assets to download. Error: %{public}s", (uint8_t *)&v19, 0x16u);
    }
    goto LABEL_21;
  }
  sqlite3_reset(v4);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v12 = (void *)a1[4];
    v13 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
    v19 = 138543618;
    v20 = v12;
    v21 = 1024;
    LODWORD(v22) = v13;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: result: %d", (uint8_t *)&v19, 0x12u);
  }
}

void __110__MSASPersonModel_nextItemsForDownloadFocusAlbumGUID_focusAssetCollectionGUID_thumbnails_maxCount_isInflight___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  sqlite3_stmt *v10;
  uint64_t v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  int v16;
  int v17;
  const char *v18;
  uint64_t v19;
  int v20;
  int v21;
  const char *v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  void *v29;
  const void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  int v45;
  void *v46;
  __int16 v47;
  _BYTE v48[14];
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  const __CFString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v36 = *(unsigned __int8 *)(a1 + 68);
    v37 = *(void **)(a1 + 32);
    v38 = *(_QWORD *)(a1 + 40);
    v39 = *(_QWORD *)(a1 + 48);
    if (*(_BYTE *)(a1 + 69))
      v40 = CFSTR("1");
    else
      v40 = CFSTR("0");
    v45 = 138544386;
    v46 = v37;
    v47 = 1024;
    *(_DWORD *)v48 = v36;
    *(_WORD *)&v48[4] = 2114;
    *(_QWORD *)&v48[6] = v38;
    v49 = 2114;
    v50 = v39;
    v51 = 2114;
    v52 = v40;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Querying for the next assets to download using criteria: thumbnail: %d focus album GUID: %{public}@ focus asset collection GUID: %{public}@ isInflight: %{public}@", (uint8_t *)&v45, 0x30u);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(a1 + 48))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "shouldDownloadEarliestPhotosFirst");
    v6 = *(void **)(a1 + 32);
    if (v5)
      v7 = CFSTR("select object, albumGUID, errorCount from DownloadQueue where assetCollectionGUID = :assetcol and isThumbnail = :thumb and isInflight = :inflight order by albumGUID asc, batchCreationDate asc, photoCreationDate asc limit:lim;");
    else
      v7 = CFSTR("select object, albumGUID, errorCount from DownloadQueue where assetCollectionGUID = :assetcol and isThumbnail = :thumb and isInflight = :inflight order by albumGUID asc, batchCreationDate desc, photoCreationDate asc limit:lim;");
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = objc_msgSend(*(id *)(a1 + 32), "shouldDownloadEarliestPhotosFirst");
    v6 = *(void **)(a1 + 32);
    if (v8)
    {
      if (v9)
        v7 = CFSTR("select object, albumGUID, errorCount from DownloadQueue where albumGUID = :album and isThumbnail = :thumb and isInflight = :inflight order by albumGUID asc, batchCreationDate asc, photoCreationDate asc limit:lim;");
      else
        v7 = CFSTR("select object, albumGUID, errorCount from DownloadQueue where albumGUID = :album and isThumbnail = :thumb and isInflight = :inflight order by albumGUID asc, batchCreationDate desc, photoCreationDate asc limit:lim;");
    }
    else if (v9)
    {
      v7 = CFSTR("select object, albumGUID, errorCount from DownloadQueue where isThumbnail = :thumb and isInflight = :inflight order by albumGUID asc, batchCreationDate asc, photoCreationDate asc limit:lim;");
    }
    else
    {
      v7 = CFSTR("select object, albumGUID, errorCount from DownloadQueue where isThumbnail = :thumb and isInflight = :inflight order by albumGUID asc, batchCreationDate desc, photoCreationDate asc limit:lim;");
    }
  }
  v10 = (sqlite3_stmt *)objc_msgSend(v6, "statementForString:", v7);
  v11 = sqlite3_reset(v10);
  v12 = v11;
  MSSqliteTrapForDBLockError(v11);
  if (v12)
    goto LABEL_39;
  if (*(_QWORD *)(a1 + 48))
  {
    v13 = sqlite3_bind_parameter_index(v10, ":assetcol");
    v14 = *(void **)(a1 + 48);
  }
  else
  {
    if (!*(_QWORD *)(a1 + 40))
      goto LABEL_19;
    v13 = sqlite3_bind_parameter_index(v10, ":album");
    v14 = *(void **)(a1 + 40);
  }
  v15 = sqlite3_bind_text(v10, v13, (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"), -1, 0);
  v16 = v15;
  MSSqliteTrapForDBLockError(v15);
  if (v16)
  {
LABEL_39:
    sqlite3_reset(v10);
    return;
  }
LABEL_19:
  v17 = sqlite3_bind_parameter_index(v10, ":thumb");
  if (*(_BYTE *)(a1 + 68))
    v18 = "1";
  else
    v18 = "0";
  v19 = sqlite3_bind_text(v10, v17, v18, -1, 0);
  v20 = v19;
  MSSqliteTrapForDBLockError(v19);
  if (v20)
    goto LABEL_39;
  v21 = sqlite3_bind_parameter_index(v10, ":inflight");
  v22 = *(_BYTE *)(a1 + 69) ? "1" : "0";
  v23 = sqlite3_bind_text(v10, v21, v22, -1, 0);
  v24 = v23;
  MSSqliteTrapForDBLockError(v23);
  if (v24)
    goto LABEL_39;
  v25 = sqlite3_bind_parameter_index(v10, ":lim");
  v26 = sqlite3_bind_int(v10, v25, *(_DWORD *)(a1 + 64));
  v27 = v26;
  MSSqliteTrapForDBLockError(v26);
  if (v27)
    goto LABEL_39;
  while (1)
  {
    v28 = sqlite3_step(v10);
    if (v28 != 100)
      break;
    v29 = (void *)objc_opt_new();
    v30 = sqlite3_column_blob(v10, 0);
    v31 = sqlite3_column_bytes(v10, 0);
    v32 = (void *)MEMORY[0x1E0CB3710];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v30, v31, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "MSSafeUnarchiveObjectWithData:outError:", v33, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "setObject:", v34);
    MSSqliteStringFromStatementColumn(v10, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAlbumGUID:", v35);
    objc_msgSend(v29, "setErrorCount:", sqlite3_column_int(v10, 2));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v29);

  }
  if (v28 != 101)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v43 = *(void **)(a1 + 32);
      v44 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v43, "dbQueueDB"));
      v45 = 138543618;
      v46 = v43;
      v47 = 2082;
      *(_QWORD *)v48 = v44;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Error retrieving items for download. Error: %{public}s", (uint8_t *)&v45, 0x16u);
    }
    goto LABEL_39;
  }
  sqlite3_reset(v10);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v41 = *(void **)(a1 + 32);
    v42 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
    v45 = 138543618;
    v46 = v41;
    v47 = 2048;
    *(_QWORD *)v48 = v42;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: ...found %ld assets.", (uint8_t *)&v45, 0x16u);
  }
}

uint64_t __50__MSASPersonModel_assetsInDownloadQueueAlbumGUID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dbQueueAssetCountAlbumGUID:inQueue:", *(_QWORD *)(a1 + 40), CFSTR("DownloadQueue"));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __40__MSASPersonModel_assetsInDownloadQueue__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dbQueueAssetCountAlbumGUID:inQueue:", 0, CFSTR("DownloadQueue"));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __59__MSASPersonModel_enqueueAssetForDownload_inAlbumWithGUID___block_invoke(id *a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  sqlite3_stmt *v7;
  uint64_t v8;
  int v9;
  void *v10;
  double v11;
  uint64_t v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  int v22;
  id v23;
  uint64_t v24;
  int v25;
  id v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  id v31;
  uint64_t v32;
  int v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  char v39;
  uint64_t v40;
  _BOOL4 v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  int v48;
  void *v49;
  void *v50;
  double v51;
  uint64_t v52;
  int v53;
  void *v54;
  void *v55;
  double v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  objc_msgSend(a1[5], "GUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "dbQueueIsGUIDQueued:inQueue:", v3, CFSTR("DownloadQueue"));

  if ((_DWORD)v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v4 = a1[4];
      objc_msgSend(a1[5], "GUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "assetCollectionGUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v62 = v4;
      v63 = 2114;
      v64 = v5;
      v65 = 2114;
      v66 = v6;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Attempting to re-enqueue asset (GUID: %{public}@ collectionGUID: %{public}@) for download. Ignoring.", buf, 0x20u);

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v43 = a1[4];
      objc_msgSend(a1[5], "GUID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "assetCollectionGUID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = a1[6];
      *(_DWORD *)buf = 138544130;
      v62 = v43;
      v63 = 2114;
      v64 = v44;
      v65 = 2114;
      v66 = v45;
      v67 = 2114;
      v68 = v46;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Enqueueing download for asset (GUID: %{public}@ collectionGUID: %{public}@) in album with GUID: %{public}@.", buf, 0x2Au);

    }
    v7 = (sqlite3_stmt *)objc_msgSend(a1[4], "statementForString:", CFSTR("insert into DownloadQueue (ord, object, GUID, albumGUID, assetCollectionGUID, isThumbnail, batchCreationDate, photoCreationDate) values (?, ?, ?, ?, ?, ?, ?, ?);"));
    v8 = sqlite3_reset(v7);
    v9 = v8;
    MSSqliteTrapForDBLockError(v8);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceReferenceDate");
      v12 = sqlite3_bind_double(v7, 1, v11);
      v13 = v12;
      MSSqliteTrapForDBLockError(v12);

      if (!v13)
      {
        v14 = a1[5];
        v60 = 0;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v60);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v60;
        v17 = v16;
        if (!v15)
        {
          v18 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v16, "userInfo");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", CFSTR("Failed to archive an assetArchive object. Error: %@ Info: %@"), v17, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v62 = v20;
            _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }

        }
        v21 = objc_msgSend(v15, "length");
        if (v21 >> 31)
          __assert_rtn("-[MSASPersonModel enqueueAssetForDownload:inAlbumWithGUID:]_block_invoke", "MSASPersonModel.m", 1058, "assetArchiveLength <= INT_MAX");
        v22 = v21;
        v23 = objc_retainAutorelease(v15);
        v24 = sqlite3_bind_blob(v7, 2, (const void *)objc_msgSend(v23, "bytes"), v22, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        v25 = v24;
        MSSqliteTrapForDBLockError(v24);
        if (!v25)
        {
          objc_msgSend(a1[5], "GUID");
          v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v27 = sqlite3_bind_text(v7, 3, (const char *)objc_msgSend(v26, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          v28 = v27;
          MSSqliteTrapForDBLockError(v27);

          if (!v28)
          {
            v29 = sqlite3_bind_text(v7, 4, (const char *)objc_msgSend(objc_retainAutorelease(a1[6]), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
            v30 = v29;
            MSSqliteTrapForDBLockError(v29);
            if (!v30)
            {
              objc_msgSend(a1[5], "assetCollectionGUID");
              v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v32 = sqlite3_bind_text(v7, 5, (const char *)objc_msgSend(v31, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
              v33 = v32;
              MSSqliteTrapForDBLockError(v32);

              if (!v33)
              {
                objc_msgSend(a1[5], "metadata");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "objectForKey:", CFSTR("MSAssetMetadataAssetType"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("thumbnail"));

                if ((v36 & 1) != 0
                  || (objc_msgSend(a1[5], "metadata"),
                      v37 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_msgSend(v37, "objectForKey:", CFSTR("MSAssetMetadataAssetTypeFlags")),
                      v38 = (void *)objc_claimAutoreleasedReturnValue(),
                      v39 = objc_msgSend(v38, "intValue"),
                      v38,
                      v37,
                      (v39 & 1) != 0))
                {
                  v42 = 1;
                }
                else
                {
                  v40 = objc_msgSend(a1[5], "mediaAssetType");
                  v42 = v40 == 5 || v40 == 2;
                }
                v47 = sqlite3_bind_int(v7, 6, v42);
                v48 = v47;
                MSSqliteTrapForDBLockError(v47);
                if (!v48)
                {
                  objc_msgSend(a1[5], "batchCreationDate");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v49
                    || (objc_msgSend(a1[5], "batchCreationDate"),
                        v50 = (void *)objc_claimAutoreleasedReturnValue(),
                        objc_msgSend(v50, "timeIntervalSinceReferenceDate"),
                        v52 = sqlite3_bind_double(v7, 7, v51),
                        v53 = v52,
                        MSSqliteTrapForDBLockError(v52),
                        v50,
                        !v53))
                  {
                    objc_msgSend(a1[5], "photoCreationDate");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v54
                      || (objc_msgSend(a1[5], "photoCreationDate"),
                          v55 = (void *)objc_claimAutoreleasedReturnValue(),
                          objc_msgSend(v55, "timeIntervalSinceReferenceDate"),
                          v57 = sqlite3_bind_double(v7, 8, v56),
                          v58 = v57,
                          MSSqliteTrapForDBLockError(v57),
                          v55,
                          !v58))
                    {
                      v59 = sqlite3_step(v7);
                      MSSqliteTrapForDBLockError(v59);
                    }
                  }
                }
              }
            }
          }
        }

      }
    }
    sqlite3_reset(v7);
  }
}

void __33__MSASPersonModel_nextMMCSItemID__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "dbQueuePersistentObjectForKey:", CFSTR("nextMMCSItemID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "longLongValue");

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dbQueueSetPersistentObject:forKey:", v4, CFSTR("nextMMCSItemID"));

}

uint64_t __63__MSASPersonModel_requeuePendingAssetCollectionsWithAlbumGUID___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138543618;
    v12 = v9;
    v13 = 2114;
    v14 = v10;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Removing asset collections from album with GUID %{public}@ from pending list.", (uint8_t *)&v11, 0x16u);
  }
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("delete from PendingAssetCollections where albumGUID = ?;"));
  v3 = MSSqliteBindStringOrNull(v2, 1, *(id *)(a1 + 40));
  v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4)
  {
    v5 = 914;
  }
  else
  {
    v6 = sqlite3_step(v2);
    v7 = v6;
    MSSqliteTrapForDBLockError(v6);
    if (v7 == 101)
      goto LABEL_8;
    v5 = 915;
  }
  MSLogSqliteError((sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "dbQueueDB"), *(_QWORD *)(a1 + 32), v5);
LABEL_8:
  if (v2)
    sqlite3_reset(v2);
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueRequeuePendingCommandsWithAlbumGUID:", *(_QWORD *)(a1 + 40));
}

uint64_t __53__MSASPersonModel_requeuePendingAssetCollectionGUID___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Removing asset collection GUID %{public}@ from pending list.", (uint8_t *)&v9, 0x16u);
  }
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("delete from PendingAssetCollections where assetCollectionGUID = ?;"));
  v3 = MSSqliteBindStringOrNull(v2, 1, *(id *)(a1 + 40));
  v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (!v4)
  {
    v5 = sqlite3_step(v2);
    MSSqliteTrapForDBLockError(v5);
  }
  if (v2)
    sqlite3_reset(v2);
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueRequeuePendingCommandsWithAssetCollectionGUID:", *(_QWORD *)(a1 + 40));
}

uint64_t __59__MSASPersonModel_addPendingAssetCollectionGUID_albumGUID___block_invoke(id *a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  int v4;
  uint64_t result;
  uint64_t v6;
  int v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v9 = a1[4];
    v10 = a1[5];
    v11 = a1[6];
    v12 = 138543874;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Adding asset collection GUID %{public}@ in album GUID %{public}@ as pending.", (uint8_t *)&v12, 0x20u);
  }
  v2 = (sqlite3_stmt *)objc_msgSend(a1[4], "statementForString:", CFSTR("insert or ignore into PendingAssetCollections (assetCollectionGUID, albumGUID) values (?, ?);"));
  v3 = MSSqliteBindStringOrNull(v2, 1, a1[5]);
  v4 = v3;
  result = MSSqliteTrapForDBLockError(v3);
  if (!v4)
  {
    v6 = MSSqliteBindStringOrNull(v2, 2, a1[6]);
    v7 = v6;
    result = MSSqliteTrapForDBLockError(v6);
    if (!v7)
    {
      v8 = sqlite3_step(v2);
      result = MSSqliteTrapForDBLockError(v8);
    }
  }
  if (v2)
    return sqlite3_reset(v2);
  return result;
}

uint64_t __52__MSASPersonModel_isAssetCollectionWithGUIDPending___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dbQueueIsAssetCollectionWithGUIDPending:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __42__MSASPersonModel_countOfEnqueuedCommands__block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  int v4;
  int v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v8 = *(void **)(a1 + 32);
    v11 = 138543362;
    v12 = v8;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Counting number of commands queued", (uint8_t *)&v11, 0xCu);
  }
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("select count(*) from CommandQueue;"));
  v3 = sqlite3_reset(v2);
  v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4)
    goto LABEL_4;
  v5 = sqlite3_step(v2);
  if (v5 != 101)
  {
    if (v5 != 100)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v6 = *(void **)(a1 + 32);
        v7 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v6, "dbQueueDB"));
        v11 = 138543618;
        v12 = v6;
        v13 = 2082;
        v14 = v7;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Error counting number of commands enqueued.sqlite error: %{public}s", (uint8_t *)&v11, 0x16u);
      }
LABEL_4:
      sqlite3_reset(v2);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      return;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_column_int64(v2, 0);
  }
  sqlite3_reset(v2);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v9 = *(void **)(a1 + 32);
    v10 = *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v11 = 138543618;
    v12 = v9;
    v13 = 2048;
    v14 = v10;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: ...found %lld commands in the queue.", (uint8_t *)&v11, 0x16u);
  }
}

void __42__MSASPersonModel_countOfEnqueuedCommand___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v15 = 138543618;
    v16 = v10;
    v17 = 2114;
    v18 = v11;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Counting number of queued command %{public}@", (uint8_t *)&v15, 0x16u);
  }
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("select count(*) from CommandQueue where command = ?;"));
  v3 = sqlite3_bind_text(v2, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
  v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4)
    goto LABEL_5;
  v5 = sqlite3_reset(v2);
  v6 = v5;
  MSSqliteTrapForDBLockError(v5);
  if (v6)
    goto LABEL_5;
  v7 = sqlite3_step(v2);
  if (v7 != 101)
  {
    if (v7 != 100)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v12 = *(void **)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 40);
        v14 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v12, "dbQueueDB"));
        v15 = 138543874;
        v16 = v12;
        v17 = 2114;
        v18 = v13;
        v19 = 2082;
        v20 = v14;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Error counting number of “%{public}@” commands enqueued.sqlite error: %{public}s", (uint8_t *)&v15, 0x20u);
      }
LABEL_5:
      sqlite3_reset(v2);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      return;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = sqlite3_column_int64(v2, 0);
  }
  sqlite3_reset(v2);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v15 = 138543618;
    v16 = v8;
    v17 = 2048;
    v18 = v9;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: ...found %lld instances.", (uint8_t *)&v15, 0x16u);
  }
}

void __40__MSASPersonModel_purgeCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "dbQueueBeginTransaction");
  objc_msgSend(*(id *)(a1 + 32), "dbQueueRemoveAllEntriesFromTable:", CFSTR("CommandQueue"));
  objc_msgSend(*(id *)(a1 + 32), "dbQueueRemoveAllEntriesFromTable:", CFSTR("PendingCommandQueue"));
  objc_msgSend(*(id *)(a1 + 32), "dbQueueRemoveAllEntriesFromTable:", CFSTR("PendingAssetCollections"));
  objc_msgSend(*(id *)(a1 + 32), "dbQueueRemoveAllEntriesFromTable:", CFSTR("DownloadQueue"));
  objc_msgSend(*(id *)(a1 + 32), "dbQueueRemoveAllEntriesFromTable:", CFSTR("UploadQueue"));
  objc_msgSend(*(id *)(a1 + 32), "dbQueueEndTransaction");
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v3, v2);

  }
}

uint64_t __43__MSASPersonModel_removeCommandIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueRemoveCommandIdentifier:", *(_QWORD *)(a1 + 40));
}

uint64_t __52__MSASPersonModel_dbQueueRemoveCommandAtHeadOfQueue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueRemoveCommandIdentifier:", objc_msgSend(*(id *)(a1 + 32), "dbQueueSmallestCommandSequenceNumber"));
}

void __54__MSASPersonModel_setParams_forCommandWithIdentifier___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  int v13;
  id v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v19 = *(void **)(a1 + 32);
    v20 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v26 = v19;
    v27 = 2048;
    v28 = v20;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Setting parameters for command at sequence number %lld.", buf, 0x16u);
  }
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("update CommandQueue set params = ? where ord = ?;"));
  v3 = sqlite3_reset(v2);
  v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4)
    goto LABEL_12;
  v5 = *(_QWORD *)(a1 + 40);
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v24;
  v8 = v7;
  if (!v6)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Failed to archive a paramsData object. Error: %@ Info: %@"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

  }
  v12 = objc_msgSend(v6, "length");
  if (v12 >= 0x7FFFFFFF)
    __assert_rtn("-[MSASPersonModel setParams:forCommandWithIdentifier:]_block_invoke", "MSASPersonModel.m", 732, "paramsDataLength < INT_MAX");
  v13 = v12;
  v14 = objc_retainAutorelease(v6);
  v15 = sqlite3_bind_blob(v2, 1, (const void *)objc_msgSend(v14, "bytes"), v13, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v16 = v15;
  MSSqliteTrapForDBLockError(v15);
  if (v16 || (v17 = sqlite3_bind_int64(v2, 2, *(_QWORD *)(a1 + 48)), v18 = v17, MSSqliteTrapForDBLockError(v17), v18))
  {

LABEL_12:
    sqlite3_reset(v2);
    return;
  }
  v21 = sqlite3_step(v2);
  v22 = v21;
  MSSqliteTrapForDBLockError(v21);

  sqlite3_reset(v2);
  if (v22 == 101 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v23 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v26 = v23;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: ...done.", buf, 0xCu);
  }
}

void __128__MSASPersonModel__commandWithMinimumIdentifier_outParams_outCommandIdentifier_outPersonID_outAlbumGUID_outAssetCollectionGUID___block_invoke(uint64_t a1)
{
  const char *v2;
  _BOOL4 v3;
  sqlite3_stmt *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  sqlite3_int64 v12;
  const void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  sqlite3_int64 v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = *(const char **)(a1 + 32);
  v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v3)
    {
      v24 = *(void **)(a1 + 40);
      v27 = 138543618;
      v28 = v24;
      v29 = 2114;
      v30 = v2;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieving command with minimum identifier %{public}@.", (uint8_t *)&v27, 0x16u);
    }
    v4 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 40), "statementForString:", CFSTR("select ord, command, params, personID, albumGUID, assetCollectionGUID from CommandQueue where ord >= ? order by ord limit 1;"));
    v5 = sqlite3_bind_int64(v4, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
    v6 = v5;
    MSSqliteTrapForDBLockError(v5);
    if (v6)
      MSLogSqliteError((sqlite3 *)objc_msgSend(*(id *)(a1 + 40), "dbQueueDB"), *(_QWORD *)(a1 + 40), 644);
  }
  else
  {
    if (v3)
    {
      v25 = *(void **)(a1 + 40);
      v27 = 138543362;
      v28 = v25;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieving command at the head of the queue.", (uint8_t *)&v27, 0xCu);
    }
    v4 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 40), "statementForString:", CFSTR("select ord, command, params, personID, albumGUID, assetCollectionGUID from CommandQueue order by ord limit 1;"));
  }
  v7 = sqlite3_reset(v4);
  v8 = v7;
  MSSqliteTrapForDBLockError(v7);
  if (v8)
    goto LABEL_10;
  v11 = sqlite3_step(v4);
  if (v11 == 101)
  {
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v12 = 0;
    v15 = 0;
    v10 = 0;
  }
  else
  {
    if (v11 != 100)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v22 = *(void **)(a1 + 40);
        v23 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v22, "dbQueueDB"));
        v27 = 138543618;
        v28 = v22;
        v29 = 2082;
        v30 = v23;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Error retrieving command at the head of the queue. sqlite error: %{public}s", (uint8_t *)&v27, 0x16u);
      }
LABEL_10:
      sqlite3_reset(v4);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = 0;
      goto LABEL_18;
    }
    v12 = sqlite3_column_int64(v4, 0);
    MSSqliteStringFromStatementColumn(v4, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = sqlite3_column_blob(v4, 2);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v13, sqlite3_column_bytes(v4, 2), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3710], "MSSafeUnarchiveObjectWithData:outError:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MSSqliteStringFromStatementColumn(v4, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    MSSqliteStringFromStatementColumn(v4, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    MSSqliteStringFromStatementColumn(v4, 5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  sqlite3_reset(v4);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v10);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v15);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v12;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v16);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v17);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;
  v21 = v18;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v26 = *(void **)(a1 + 40);
    v27 = 138544642;
    v28 = v26;
    v29 = 2114;
    v30 = (const char *)v10;
    v31 = 2048;
    v32 = v12;
    v33 = 2112;
    v34 = v16;
    v35 = 2114;
    v36 = v17;
    v37 = 2112;
    v38 = v21;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: ...retrieved command %{public}@ at sequence number %lld for personID %@, album GUID %{public}@,  asset collection GUID %@", (uint8_t *)&v27, 0x3Eu);
  }

LABEL_18:
}

void __89__MSASPersonModel_enqueueCommand_params_personID_albumGUID_pendingOnAssetCollectionGUID___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  int v3;
  sqlite3_int64 v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  sqlite3_stmt *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "dbQueueIsAssetCollectionWithGUIDPending:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "dbQueueEnqueueCommand:params:personID:albumGUID:assetCollectionGUID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v15 = *(void **)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v31 = v15;
    v32 = 2114;
    v33 = v16;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Enqueueing pending command “%{public}@”.", buf, 0x16u);
  }
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("select max(ord) from PendingCommandQueue;"));
  v3 = sqlite3_step(v2);
  if (v3 == 101)
  {
    v4 = 0;
    if (!v2)
      goto LABEL_11;
LABEL_10:
    sqlite3_reset(v2);
    goto LABEL_11;
  }
  if (v3 != 100)
  {
    MSLogSqliteError((sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "dbQueueDB"), *(_QWORD *)(a1 + 32), 526);
    goto LABEL_16;
  }
  v4 = sqlite3_column_int(v2, 0) + 1;
  if (v2)
    goto LABEL_10;
LABEL_11:
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("insert into PendingCommandQueue (ord, command, params, personID, albumGUID, assetCollectionGUID) values (?, ?, ?, ?, ?, ?);"));
  v5 = sqlite3_bind_int64(v2, 1, v4);
  v6 = v5;
  MSSqliteTrapForDBLockError(v5);
  if (v6 || (v7 = MSSqliteBindStringOrNull(v2, 2, *(id *)(a1 + 48)), v8 = v7, MSSqliteTrapForDBLockError(v7), v8))
  {
LABEL_16:
    if (!v2)
      return;
    goto LABEL_17;
  }
  v9 = *(_QWORD *)(a1 + 56);
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v29;
  v12 = v11;
  if (v10)
  {
    v13 = v2;
    v14 = v10;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Failed to archive params object. Error: %@ Info: %@"), v12, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v19;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    v13 = v2;
    v14 = 0;
  }
  v20 = MSSqliteBindDataOrNull(v13, 3, v14);
  v21 = v20;
  MSSqliteTrapForDBLockError(v20);
  if (!v21)
  {
    v22 = MSSqliteBindStringOrNull(v2, 4, *(id *)(a1 + 64));
    v23 = v22;
    MSSqliteTrapForDBLockError(v22);
    if (!v23)
    {
      v24 = MSSqliteBindStringOrNull(v2, 5, *(id *)(a1 + 72));
      v25 = v24;
      MSSqliteTrapForDBLockError(v24);
      if (!v25)
      {
        v26 = MSSqliteBindStringOrNull(v2, 6, *(id *)(a1 + 40));
        v27 = v26;
        MSSqliteTrapForDBLockError(v26);
        if (!v27)
        {
          v28 = sqlite3_step(v2);
          MSSqliteTrapForDBLockError(v28);
        }
      }
    }
  }

  if (v2)
LABEL_17:
    sqlite3_reset(v2);
}

uint64_t __93__MSASPersonModel_enqueueCommandAtHeadOfQueue_params_personID_albumGUID_assetCollectionGUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueEnqueueCommand:params:personID:albumGUID:assetCollectionGUID:sequenceNumber:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), objc_msgSend(*(id *)(a1 + 32), "dbQueueSmallestCommandSequenceNumber") - 1);
}

uint64_t __80__MSASPersonModel_enqueueCommand_params_personID_albumGUID_assetCollectionGUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueEnqueueCommand:params:personID:albumGUID:assetCollectionGUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

@end
