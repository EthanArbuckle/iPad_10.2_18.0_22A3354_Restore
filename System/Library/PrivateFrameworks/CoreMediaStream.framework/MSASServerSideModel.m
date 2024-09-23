@implementation MSASServerSideModel

- (MSASServerSideModel)initWithPersonID:(id)a3
{
  id v4;
  void *v5;
  MSASServerSideModel *v6;

  v4 = a3;
  MSPathAlbumSharingModelForPersonID(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MSASServerSideModel initWithPersonID:databasePath:eventQueue:](self, "initWithPersonID:databasePath:eventQueue:", v4, v5, MEMORY[0x1E0C80D38]);

  return v6;
}

- (void)retainBusy
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASServerSideModel eventQueue](self, "eventQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MSASServerSideModel_retainBusy__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)releaseBusy
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASServerSideModel eventQueue](self, "eventQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MSASServerSideModel_releaseBusy__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (MSASServerSideModel)initWithPersonID:(id)a3 databasePath:(id)a4
{
  return -[MSASServerSideModel initWithPersonID:databasePath:eventQueue:](self, "initWithPersonID:databasePath:eventQueue:", a3, a4, MEMORY[0x1E0C80D38]);
}

- (MSASServerSideModel)initWithPersonID:(id)a3 databasePath:(id)a4 eventQueue:(id)a5
{
  id v8;
  MSASServerSideModel *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *memberQueue;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *eventQueue;
  OS_dispatch_queue *v14;
  id v15;
  MSASServerSideModelGroupedCommandQueue *v16;
  MSASServerSideModelGroupedCommandQueue *commandQueue;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  MSASServerSideModel *v23;
  objc_super v24;

  v8 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MSASServerSideModel;
  v9 = -[MSASModelBase initWithPersonID:databasePath:currentVersion:](&v24, sel_initWithPersonID_databasePath_currentVersion_, a3, a4, 8);
  if (v9)
  {
    v10 = dispatch_queue_create("MSASServerSideModel member queue", MEMORY[0x1E0C80D50]);
    memberQueue = v9->_memberQueue;
    v9->_memberQueue = (OS_dispatch_queue *)v10;

    if (v8)
    {
      v12 = (OS_dispatch_queue *)v8;
      eventQueue = v9->_eventQueue;
      v9->_eventQueue = v12;
    }
    else
    {
      v14 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v15 = MEMORY[0x1E0C80D38];
      eventQueue = v9->_eventQueue;
      v9->_eventQueue = v14;
    }

    v16 = objc_alloc_init(MSASServerSideModelGroupedCommandQueue);
    commandQueue = v9->_commandQueue;
    v9->_commandQueue = v16;

    -[MSASGroupedQueue setModel:](v9->_commandQueue, "setModel:", v9);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __64__MSASServerSideModel_initWithPersonID_databasePath_eventQueue___block_invoke;
    v22[3] = &unk_1E95BC268;
    v23 = v9;
    v20 = (id)objc_msgSend(v18, "addObserverForName:object:queue:usingBlock:", CFSTR("MSASServerSideConfigDidChangeNotification"), 0, v19, v22);

  }
  return v9;
}

- (int)maxGroupedCallbackEventBatchCount
{
  void *v2;
  int v3;

  -[MSASServerSideModel commandQueue](self, "commandQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxGroupedCallbackEventBatchCount");

  return v3;
}

- (void)setMaxGroupedCallbackEventBatchCount:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[MSASServerSideModel commandQueue](self, "commandQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxGroupedCallbackEventBatchCount:", v3);

}

- (double)maxGroupedCallbackEventStaleness
{
  void *v2;
  double v3;
  double v4;

  -[MSASServerSideModel commandQueue](self, "commandQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maxGroupedCallbackEventStaleness");
  v4 = v3;

  return v4;
}

- (void)setMaxGroupedCallbackEventStaleness:(double)a3
{
  id v4;

  -[MSASServerSideModel commandQueue](self, "commandQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxGroupedCallbackEventStaleness:", a3);

}

- (double)maxGroupedCallbackEventIdleInterval
{
  void *v2;
  double v3;
  double v4;

  -[MSASServerSideModel commandQueue](self, "commandQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maxGroupedCallbackEventIdleInterval");
  v4 = v3;

  return v4;
}

- (void)setMaxGroupedCallbackEventIdleInterval:(double)a3
{
  id v4;

  -[MSASServerSideModel commandQueue](self, "commandQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxGroupedCallbackEventIdleInterval:", a3);

}

- (BOOL)dbQueueUpgradeFromDatabaseVersion:(int)a3 currentVersion:(int)a4
{
  unsigned int v6;
  _BOOL4 v7;
  NSObject *v8;
  const char *v9;
  uint32_t v10;
  NSObject *v11;
  const char *v12;
  char *errmsg;
  objc_super v15;
  uint8_t buf[4];
  MSASServerSideModel *v17;
  __int16 v18;
  _WORD v19[9];

  *(_QWORD *)&v19[5] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)MSASServerSideModel;
  v6 = -[MSASModelBase dbQueueUpgradeFromDatabaseVersion:currentVersion:](&v15, sel_dbQueueUpgradeFromDatabaseVersion_currentVersion_, *(_QWORD *)&a3, *(_QWORD *)&a4);
  LOBYTE(v7) = 0;
  if (a3 < 9 || !v6)
    return v7;
  if (a3 < 0)
  {
    errmsg = 0;
    if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create table if not exists Albums (\n  GUID             text unique primary key,\n  name             text,\n  ctag             text,\n  foreignCtag      text,\n  url              text,\n  obj              blob,\n  userInfo         blob\n);",
           0,
           0,
           &errmsg))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_66:
        LOBYTE(v7) = 0;
        return v7;
      }
      *(_DWORD *)buf = 138543618;
      v17 = self;
      v18 = 2082;
      *(_QWORD *)v19 = errmsg;
      v8 = MEMORY[0x1E0C81028];
      v9 = "%{public}@: Could not create album tables. Error: %{public}s";
      v10 = 22;
LABEL_9:
      _os_log_error_impl(&dword_1D3E94000, v8, OS_LOG_TYPE_ERROR, v9, buf, v10);
      goto LABEL_66;
    }
    if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists AlbumsByName on Albums (name asc);",
           0,
           0,
           &errmsg))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v17 = self;
        v18 = 2082;
        *(_QWORD *)v19 = errmsg;
        v11 = MEMORY[0x1E0C81028];
        v12 = "%{public}@: Could not create album by name index. Error: %{public}s";
LABEL_64:
        _os_log_error_impl(&dword_1D3E94000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
      }
    }
    else if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists AlbumsByGUID on Albums (GUID asc);",
                0,
                0,
                &errmsg))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v17 = self;
        v18 = 2082;
        *(_QWORD *)v19 = errmsg;
        v11 = MEMORY[0x1E0C81028];
        v12 = "%{public}@: Could not create album by GUID index. Error: %{public}s";
        goto LABEL_64;
      }
    }
    else
    {
      errmsg = 0;
      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create table if not exists AlbumMetadata (\n  albumGUID        text, \n  key              text, \n  value            text,\n  constraint UniquePerAlbum primary key (albumGUID, key) on conflict replace);",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v17 = self;
          v18 = 2082;
          *(_QWORD *)v19 = errmsg;
          v11 = MEMORY[0x1E0C81028];
          v12 = "%{public}@: Could not create synced album metadata tables. Error: %{public}s";
          goto LABEL_64;
        }
      }
      else
      {
        errmsg = 0;
        if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create table if not exists AccessControls (\n  GUID             text unique primary key,\n  email            text,\n  albumGUID        text,\n  obj              blob,\n  userInfo         blob\n);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v17 = self;
            v18 = 2082;
            *(_QWORD *)v19 = errmsg;
            v11 = MEMORY[0x1E0C81028];
            v12 = "%{public}@: Could not create access control tables. Error: %{public}s";
            goto LABEL_64;
          }
        }
        else if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists AccessControlsByAlbumGUID on AccessControls (albumGUID asc);",
                    0,
                    0,
                    &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v17 = self;
            v18 = 2082;
            *(_QWORD *)v19 = errmsg;
            v11 = MEMORY[0x1E0C81028];
            v12 = "%{public}@: Could not create access control Album GUID index. Error: %{public}s";
            goto LABEL_64;
          }
        }
        else if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists AccessControlsByAlbumGUID on AccessControls (email asc);",
                    0,
                    0,
                    &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v17 = self;
            v18 = 2082;
            *(_QWORD *)v19 = errmsg;
            v11 = MEMORY[0x1E0C81028];
            v12 = "%{public}@: Could not create access control email index. Error: %{public}s";
            goto LABEL_64;
          }
        }
        else
        {
          errmsg = 0;
          if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create table if not exists Invitations (\n  GUID             text unique primary key,\n  albumGUID        text,\n  email            text,\n  obj              blob,\n  userInfo         blob\n);",
                 0,
                 0,
                 &errmsg))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v17 = self;
              v18 = 2082;
              *(_QWORD *)v19 = errmsg;
              v11 = MEMORY[0x1E0C81028];
              v12 = "%{public}@: Could not create invitation tables. Error: %{public}s";
              goto LABEL_64;
            }
          }
          else if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists InvitationsByAlbumGUID on Invitations (albumGUID asc);",
                      0,
                      0,
                      &errmsg))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v17 = self;
              v18 = 2082;
              *(_QWORD *)v19 = errmsg;
              v11 = MEMORY[0x1E0C81028];
              v12 = "%{public}@: Could not create invitation index. Error: %{public}s";
              goto LABEL_64;
            }
          }
          else if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists InvitationsByEmail on Invitations (albumGUID asc);",
                      0,
                      0,
                      &errmsg))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v17 = self;
              v18 = 2082;
              *(_QWORD *)v19 = errmsg;
              v11 = MEMORY[0x1E0C81028];
              v12 = "%{public}@: Could not create invitation email index. Error: %{public}s";
              goto LABEL_64;
            }
          }
          else
          {
            errmsg = 0;
            if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create table if not exists AssetCollections (\n  GUID                text unique primary key,\n  ctag                text,\n  albumGUID           text,\n  batchDate           real,\n  photoDate           real,\n  photoNumber         int,\n  obj                 blob,\n  userInfo            blob\n);",
                   0,
                   0,
                   &errmsg))
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v17 = self;
                v18 = 2082;
                *(_QWORD *)v19 = errmsg;
                v11 = MEMORY[0x1E0C81028];
                v12 = "%{public}@: Could not create asset collection tables. Error: %{public}s";
                goto LABEL_64;
              }
            }
            else if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists AssetCollectionsByAlbumGUID on AssetCollections (albumGUID asc, batchDate asc, photoDate asc, GUID asc);",
                        0,
                        0,
                        &errmsg))
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v17 = self;
                v18 = 2082;
                *(_QWORD *)v19 = errmsg;
                v11 = MEMORY[0x1E0C81028];
                v12 = "%{public}@: Could not create asset collection index. Error: %{public}s";
                goto LABEL_64;
              }
            }
            else
            {
              errmsg = 0;
              if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create table if not exists AssetCollectionMetadata (\n  assetCollectionGUID  text, \n  albumGUID            text, \n  key                  text, \n  value                text,\n  constraint UniquePerAssetCollection primary key (assetCollectionGUID, key) on conflict replace);",
                     0,
                     0,
                     &errmsg))
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v17 = self;
                  v18 = 2082;
                  *(_QWORD *)v19 = errmsg;
                  v11 = MEMORY[0x1E0C81028];
                  v12 = "%{public}@: Could not create synced asset collection metadata tables. Error: %{public}s";
                  goto LABEL_64;
                }
              }
              else if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists AssetCollectionMetadataByAlbum on AssetCollectionMetadata (albumGUID asc);",
                          0,
                          0,
                          &errmsg))
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v17 = self;
                  v18 = 2082;
                  *(_QWORD *)v19 = errmsg;
                  v11 = MEMORY[0x1E0C81028];
                  v12 = "%{public}@: Could not create asset collection metadata index. Error: %{public}s";
                  goto LABEL_64;
                }
              }
              else
              {
                errmsg = 0;
                if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create table if not exists Comments (\n  GUID                 text unique primary key,\n  id                   int,\n  timestamp            real,\n  assetCollectionGUID  text,\n  isCaption            int,\n  isMine               int,\n  obj                  blob,\n  userInfo             blob\n);",
                       0,
                       0,
                       &errmsg))
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543618;
                    v17 = self;
                    v18 = 2082;
                    *(_QWORD *)v19 = errmsg;
                    v11 = MEMORY[0x1E0C81028];
                    v12 = "%{public}@: Could not create comment tables. Error: %{public}s";
                    goto LABEL_64;
                  }
                }
                else if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists CommentsByAssetCollectionGUID on Comments (assetCollectionGUID asc, timestamp asc, GUID asc);",
                            0,
                            0,
                            &errmsg))
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543618;
                    v17 = self;
                    v18 = 2082;
                    *(_QWORD *)v19 = errmsg;
                    v11 = MEMORY[0x1E0C81028];
                    v12 = "%{public}@: Could not create comment index. Error: %{public}s";
                    goto LABEL_64;
                  }
                }
                else if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create index if not exists CommentsByAssetCollectionGUIDAndMine on Comments (assetCollectionGUID asc, timestamp asc, isMine asc);",
                            0,
                            0,
                            &errmsg))
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543618;
                    v17 = self;
                    v18 = 2082;
                    *(_QWORD *)v19 = errmsg;
                    v11 = MEMORY[0x1E0C81028];
                    v12 = "%{public}@: Could not create comment ownership index. Error: %{public}s";
                    goto LABEL_64;
                  }
                }
                else
                {
                  errmsg = 0;
                  if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create table if not exists GroupedCommand (\n  command              text,\n  variant              blob,\n  invariant            blob\n);",
                         0,
                         0,
                         &errmsg))
                  {
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543618;
                      v17 = self;
                      v18 = 2082;
                      *(_QWORD *)v19 = errmsg;
                      v11 = MEMORY[0x1E0C81028];
                      v12 = "%{public}@: Could not create grouped command tables. Error: %{public}s";
                      goto LABEL_64;
                    }
                  }
                  else
                  {
                    errmsg = 0;
                    if (!sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "create table if not exists CommentCheckQueue (\n  assetCollectionGUID  text unique,\n  albumGUID            text\n);",
                            0,
                            0,
                            &errmsg))
                    {
                      errmsg = 0;
                      if (sqlite3_exec(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), "analyze;", 0, 0, &errmsg))
                      {
                        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138543618;
                          v17 = self;
                          v18 = 2082;
                          *(_QWORD *)v19 = errmsg;
                          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not analyze database indexes. Ignoring. Error: %{public}s", buf, 0x16u);
                        }
                        sqlite3_free(errmsg);
                      }
                      LOBYTE(v7) = 1;
                      return v7;
                    }
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543618;
                      v17 = self;
                      v18 = 2082;
                      *(_QWORD *)v19 = errmsg;
                      v11 = MEMORY[0x1E0C81028];
                      v12 = "%{public}@: Could not create comment checking queue. Error: %{public}s";
                      goto LABEL_64;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    sqlite3_free(errmsg);
    goto LABEL_66;
  }
  v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v7)
  {
    *(_DWORD *)buf = 138543874;
    v17 = self;
    v18 = 1024;
    *(_DWORD *)v19 = a3;
    v19[2] = 1024;
    *(_DWORD *)&v19[3] = 8;
    v8 = MEMORY[0x1E0C81028];
    v9 = "%{public}@: Cannot migrate from database version %d to %d. Recreating database.";
    v10 = 24;
    goto LABEL_9;
  }
  return v7;
}

- (void)cancel
{
  id v2;

  -[MSASServerSideModel stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelCompletionBlock:", 0);

}

- (void)shutDown
{
  -[MSASServerSideModel shutDownForDestruction:completionBlock:](self, "shutDownForDestruction:completionBlock:", 0, 0);
}

- (void)shutDownForDestruction:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _BOOL8 v8;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  v4 = a3;
  v6 = a4;
  -[MSASServerSideModel commandQueue](self, "commandQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v8 = !v4;
  v10[2] = __62__MSASServerSideModel_shutDownForDestruction_completionBlock___block_invoke;
  v10[3] = &unk_1E95BCF70;
  v12 = v4;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "shutDownFlush:completionBlock:", v8, v10);

}

- (BOOL)hasCommandsInGroupedCommandQueue
{
  void *v2;
  char v3;

  -[MSASServerSideModel commandQueue](self, "commandQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasEnqueuedItems");

  return v3;
}

- (BOOL)hasEnqueuedActivities
{
  void *v2;
  char v3;

  -[MSASServerSideModel stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasEnqueuedActivities");

  return v3;
}

- (NSCountedSet)observers
{
  NSCountedSet *observers;
  NSCountedSet *v4;
  NSCountedSet *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[MSASServerSideModel observers](self, "observers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[MSASServerSideModel observers](self, "observers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (id)albums
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
  v10 = __Block_byref_object_copy__6323;
  v11 = __Block_byref_object_dispose__6324;
  v12 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__MSASServerSideModel_albums__block_invoke;
  v6[3] = &unk_1E95BCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)albumGUIDs
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
  v10 = __Block_byref_object_copy__6323;
  v11 = __Block_byref_object_dispose__6324;
  v12 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__MSASServerSideModel_albumGUIDs__block_invoke;
  v6[3] = &unk_1E95BCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)dbQueueAlbumGUIDs
{
  return +[MSASModelEnumerator enumeratorWithDatabase:query:stepBlock:](MSASModelEnumerator, "enumeratorWithDatabase:query:stepBlock:", -[MSASModelBase dbQueueDB](self, "dbQueueDB"), CFSTR("select GUID from Albums order by GUID asc;"),
           &__block_literal_global_132);
}

- (id)albumWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__MSASServerSideModel_albumWithGUID___block_invoke;
    block[3] = &unk_1E95BC2F0;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)accessControlsForAlbumWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__MSASServerSideModel_accessControlsForAlbumWithGUID___block_invoke;
    block[3] = &unk_1E95BC2F0;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)dbQueueAccessControlsForAlbumWithGUID:(id)a3
{
  id v4;
  sqlite3 *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = a3;
    v5 = -[MSASModelBase dbQueueDB](self, "dbQueueDB");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("select obj from AccessControls where albumGUID = '%@' order by email asc;"),
      v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MSASModelEnumerator enumeratorWithDatabase:query:stepBlock:](MSASModelEnumerator, "enumeratorWithDatabase:query:stepBlock:", v5, v6, &__block_literal_global_136);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)accessControlGUIDsForAlbumWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__MSASServerSideModel_accessControlGUIDsForAlbumWithGUID___block_invoke;
    block[3] = &unk_1E95BC2F0;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)dbQueueAccessControlGUIDsForAlbumWithGUID:(id)a3
{
  id v4;
  sqlite3 *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = a3;
    v5 = -[MSASModelBase dbQueueDB](self, "dbQueueDB");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("select GUID from AccessControls where albumGUID = '%@' order by email asc;"),
      v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MSASModelEnumerator enumeratorWithDatabase:query:stepBlock:](MSASModelEnumerator, "enumeratorWithDatabase:query:stepBlock:", v5, v6, &__block_literal_global_139);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)accessControlWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__MSASServerSideModel_accessControlWithGUID___block_invoke;
    block[3] = &unk_1E95BC2F0;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)invitations
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
  v10 = __Block_byref_object_copy__6323;
  v11 = __Block_byref_object_dispose__6324;
  v12 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__MSASServerSideModel_invitations__block_invoke;
  v6[3] = &unk_1E95BCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)invitationGUIDs
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
  v10 = __Block_byref_object_copy__6323;
  v11 = __Block_byref_object_dispose__6324;
  v12 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__MSASServerSideModel_invitationGUIDs__block_invoke;
  v6[3] = &unk_1E95BCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)invitationForAlbumWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__MSASServerSideModel_invitationForAlbumWithGUID___block_invoke;
    block[3] = &unk_1E95BC2F0;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)dbQueueInvitationForAlbumWithGUID:(id)a3
{
  id v4;

  if (!a3)
    return 0;
  v4 = 0;
  -[MSASServerSideModel dbQueueInvitationWithAlbumGUID:outObject:outInvitationGUID:outEmail:outUserInfoData:](self, "dbQueueInvitationWithAlbumGUID:outObject:outInvitationGUID:outEmail:outUserInfoData:", a3, &v4, 0, 0, 0);
  return v4;
}

- (id)invitationWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__MSASServerSideModel_invitationWithGUID___block_invoke;
    block[3] = &unk_1E95BC2F0;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)isPublicAccessEnabledForAlbumWithGUID:(id)a3
{
  return 0;
}

- (void)videoURLForAssetCollectionWithGUID:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__MSASServerSideModel_videoURLForAssetCollectionWithGUID_completionBlock___block_invoke;
    block[3] = &unk_1E95BC528;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

- (void)videoURLsForAssetCollectionWithGUID:(id)a3 forMediaAssetType:(unint64_t)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  unint64_t v14;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __93__MSASServerSideModel_videoURLsForAssetCollectionWithGUID_forMediaAssetType_completionBlock___block_invoke;
    v11[3] = &unk_1E95BC3E8;
    v11[4] = self;
    v12 = v8;
    v14 = a4;
    v13 = v9;
    dispatch_async(v10, v11);

  }
}

- (id)assetCollectionsInAlbumWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__MSASServerSideModel_assetCollectionsInAlbumWithGUID___block_invoke;
    block[3] = &unk_1E95BC2F0;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)assetCollectionGUIDsInAlbumWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__MSASServerSideModel_assetCollectionGUIDsInAlbumWithGUID___block_invoke;
    block[3] = &unk_1E95BC2F0;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)dbQueueAssetCollectionGUIDsInAlbumWithGUID:(id)a3
{
  id v4;
  sqlite3 *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = a3;
    v5 = -[MSASModelBase dbQueueDB](self, "dbQueueDB");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("select GUID from AssetCollections where albumGUID = '%@' order by albumGUID asc, batchDate asc, photoDate asc, GUID asc;"),
      v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MSASModelEnumerator enumeratorWithDatabase:query:stepBlock:](MSASModelEnumerator, "enumeratorWithDatabase:query:stepBlock:", v5, v6, &__block_literal_global_153);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)assetCollectionWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__MSASServerSideModel_assetCollectionWithGUID___block_invoke;
    block[3] = &unk_1E95BC2F0;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)commentsForAssetCollectionWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__MSASServerSideModel_commentsForAssetCollectionWithGUID___block_invoke;
    block[3] = &unk_1E95BC2F0;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)dbQueueCommentsForAssetCollectionWithGUID:(id)a3
{
  id v4;
  sqlite3 *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = a3;
    v5 = -[MSASModelBase dbQueueDB](self, "dbQueueDB");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("select obj from Comments where assetCollectionGUID = '%@' order by timestamp asc;"),
      v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MSASModelEnumerator enumeratorWithDatabase:query:stepBlock:](MSASModelEnumerator, "enumeratorWithDatabase:query:stepBlock:", v5, v6, &__block_literal_global_156);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)commentWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__MSASServerSideModel_commentWithGUID___block_invoke;
    block[3] = &unk_1E95BC2F0;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)captionForAssetCollectionWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__MSASServerSideModel_captionForAssetCollectionWithGUID___block_invoke;
    block[3] = &unk_1E95BC2F0;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setUserInfo:(id)a3 forAlbumWithGUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__MSASServerSideModel_setUserInfo_forAlbumWithGUID___block_invoke;
    block[3] = &unk_1E95BCE30;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

- (id)userInfoForAlbumWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__MSASServerSideModel_userInfoForAlbumWithGUID___block_invoke;
    block[3] = &unk_1E95BC2F0;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setUserInfo:(id)a3 forAssetCollectionWithGUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__MSASServerSideModel_setUserInfo_forAssetCollectionWithGUID___block_invoke;
    block[3] = &unk_1E95BCE30;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

- (id)userInfoForAssetCollectionWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__MSASServerSideModel_userInfoForAssetCollectionWithGUID___block_invoke;
    block[3] = &unk_1E95BC2F0;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setUserInfo:(id)a3 forAccessControlWithGUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__MSASServerSideModel_setUserInfo_forAccessControlWithGUID___block_invoke;
    block[3] = &unk_1E95BCE30;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

- (id)userInfoForAccessControlWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__MSASServerSideModel_userInfoForAccessControlWithGUID___block_invoke;
    block[3] = &unk_1E95BC2F0;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setUserInfo:(id)a3 forInvitationWithGUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__MSASServerSideModel_setUserInfo_forInvitationWithGUID___block_invoke;
    block[3] = &unk_1E95BCE30;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

- (id)userInfoForInvitationWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__MSASServerSideModel_userInfoForInvitationWithGUID___block_invoke;
    block[3] = &unk_1E95BC2F0;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setUserInfo:(id)a3 forCommentWithGUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__MSASServerSideModel_setUserInfo_forCommentWithGUID___block_invoke;
    block[3] = &unk_1E95BCE30;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

- (id)userInfoForCommentWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__MSASServerSideModel_userInfoForCommentWithGUID___block_invoke;
    block[3] = &unk_1E95BC2F0;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)serverCommunicationBackoffDate
{
  void *v2;
  void *v3;

  -[MSASServerSideModel stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverCommunicationBackoffDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)MSASStateMachineDidUpdateServerCommunicationBackoffDate:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__MSASServerSideModel_MSASStateMachineDidUpdateServerCommunicationBackoffDate___block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)reconstruct
{
  void *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  MSASServerSideModel *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Reconstructing model from the server.", buf, 0xCu);
  }
  -[MSASServerSideModel stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__MSASServerSideModel_reconstruct__block_invoke;
  v4[3] = &unk_1E95BCED0;
  v4[4] = self;
  objc_msgSend(v3, "purgeEverythingCompletionBlock:", v4);

}

- (void)_reconstruct
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASServerSideModel eventQueue](self, "eventQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MSASServerSideModel__reconstruct__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

  -[MSASServerSideModel refreshResetSync:](self, "refreshResetSync:", 1);
}

- (void)refreshResetSync:(BOOL)a3
{
  -[MSASServerSideModel refreshResetSync:info:](self, "refreshResetSync:info:", a3, 0);
}

- (void)refreshResetSync:(BOOL)a3 info:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[MSASServerSideModel stateMachine](self, "stateMachine");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "checkForChangesResetSync:info:", v4, v6);

}

- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4
{
  -[MSASServerSideModel refreshContentOfAlbumWithGUID:resetSync:info:](self, "refreshContentOfAlbumWithGUID:resetSync:info:", a3, a4, 0);
}

- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4 info:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__MSASServerSideModel_refreshContentOfAlbumWithGUID_resetSync_info___block_invoke;
    v11[3] = &unk_1E95BC438;
    v11[4] = self;
    v12 = v8;
    v14 = a4;
    v13 = v9;
    dispatch_async(v10, v11);

  }
}

- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4
{
  if (a3)
    -[MSASServerSideModel refreshCommentsForAssetCollectionWithGUID:resetSync:info:](self, "refreshCommentsForAssetCollectionWithGUID:resetSync:info:", a3, a4, 0);
}

- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4 info:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  MSASServerSideModel *v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  id v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__6323;
    v37 = __Block_byref_object_dispose__6324;
    v38 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__6323;
    v31 = __Block_byref_object_dispose__6324;
    v32 = &unk_1E95D3370;
    -[MSASModelBase dbQueue](self, "dbQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __80__MSASServerSideModel_refreshCommentsForAssetCollectionWithGUID_resetSync_info___block_invoke;
    v21 = &unk_1E95BC460;
    v22 = self;
    v11 = v8;
    v23 = v11;
    v24 = &v33;
    v26 = a4;
    v25 = &v27;
    dispatch_sync(v10, &v18);

    v12 = v28[5];
    v39 = v11;
    v40[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1, v18, v19, v20, v21, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASServerSideModel stateMachine](self, "stateMachine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v34[5], "GUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "checkForCommentChanges:inAlbumWithGUID:", v13, v15);

    -[MSASServerSideModel stateMachine](self, "stateMachine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v34[5], "GUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scheduleEvent:assetCollectionGUID:albumGUID:info:", CFSTR("flushPendingCommentQueue"), v11, v17, v9);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);

  }
}

- (void)refreshAccessControlListForAlbumWithGUID:(id)a3
{
  -[MSASServerSideModel refreshAccessControlListForAlbumWithGUID:info:](self, "refreshAccessControlListForAlbumWithGUID:info:", a3, 0);
}

- (void)refreshAccessControlListForAlbumWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__6323;
    v18 = __Block_byref_object_dispose__6324;
    v19 = 0;
    -[MSASModelBase dbQueue](self, "dbQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__MSASServerSideModel_refreshAccessControlListForAlbumWithGUID_info___block_invoke;
    block[3] = &unk_1E95BC2F0;
    v13 = &v14;
    block[4] = self;
    v12 = v6;
    dispatch_sync(v8, block);

    -[MSASServerSideModel stateMachine](self, "stateMachine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v15[5]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getAccessControlsForAlbums:info:", v10, v7);

    _Block_object_dispose(&v14, 8);
  }

}

- (void)addAlbum:(id)a3
{
  -[MSASServerSideModel addAlbum:info:](self, "addAlbum:info:", a3, 0);
}

- (void)addAlbum:(id)a3 info:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "MSASAddIsLocalChange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[MSASModelBase dbQueue](self, "dbQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__MSASServerSideModel_addAlbum_info___block_invoke;
    block[3] = &unk_1E95BCE30;
    block[4] = self;
    v12 = v6;
    v13 = v8;
    v10 = v8;
    dispatch_async(v9, block);

  }
}

- (void)modifyAlbumMetadata:(id)a3
{
  -[MSASServerSideModel modifyAlbumMetadata:info:](self, "modifyAlbumMetadata:info:", a3, 0);
}

- (void)modifyAlbumMetadata:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  MSASServerSideModel *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__MSASServerSideModel_modifyAlbumMetadata_info___block_invoke;
    block[3] = &unk_1E95BCE30;
    v10 = v7;
    v11 = self;
    v12 = v6;
    dispatch_async(v8, block);

  }
}

- (void)deleteAlbumWithGUID:(id)a3
{
  -[MSASServerSideModel deleteAlbumWithGUID:info:](self, "deleteAlbumWithGUID:info:", a3, 0);
}

- (void)deleteAlbumWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  MSASServerSideModel *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__MSASServerSideModel_deleteAlbumWithGUID_info___block_invoke;
    block[3] = &unk_1E95BCE30;
    v10 = v7;
    v11 = self;
    v12 = v6;
    dispatch_async(v8, block);

  }
}

- (void)markAlbumGUIDAsViewed:(id)a3
{
  -[MSASServerSideModel markAlbumGUIDAsViewed:info:](self, "markAlbumGUIDAsViewed:info:", a3, 0);
}

- (void)markAlbumGUIDAsViewed:(id)a3 info:(id)a4
{
  -[MSASServerSideModel markAlbumGUIDAsViewed:moveLastViewedAssetCollectionMarker:info:](self, "markAlbumGUIDAsViewed:moveLastViewedAssetCollectionMarker:info:", a3, 1, a4);
}

- (void)markAlbumGUIDAsViewed:(id)a3 moveLastViewedAssetCollectionMarker:(BOOL)a4 info:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  MSASServerSideModel *v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __86__MSASServerSideModel_markAlbumGUIDAsViewed_moveLastViewedAssetCollectionMarker_info___block_invoke;
    v11[3] = &unk_1E95BC438;
    v12 = v9;
    v13 = self;
    v14 = v8;
    v15 = a4;
    dispatch_async(v10, v11);

  }
}

- (void)subscribeToAlbumWithGUID:(id)a3
{
  -[MSASServerSideModel subscribeToAlbumWithGUID:info:](self, "subscribeToAlbumWithGUID:info:", a3, 0);
}

- (void)subscribeToAlbumWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  MSASServerSideModel *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__MSASServerSideModel_subscribeToAlbumWithGUID_info___block_invoke;
    block[3] = &unk_1E95BCE30;
    v10 = v7;
    v11 = self;
    v12 = v6;
    dispatch_async(v8, block);

  }
}

- (void)unsubscribeFromAlbumWithGUID:(id)a3
{
  -[MSASServerSideModel unsubscribeFromAlbumWithGUID:info:](self, "unsubscribeFromAlbumWithGUID:info:", a3, 0);
}

- (void)unsubscribeFromAlbumWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  MSASServerSideModel *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__MSASServerSideModel_unsubscribeFromAlbumWithGUID_info___block_invoke;
    block[3] = &unk_1E95BCE30;
    v10 = v7;
    v11 = self;
    v12 = v6;
    dispatch_async(v8, block);

  }
}

- (void)acceptInvitationWithToken:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__MSASServerSideModel_acceptInvitationWithToken_completionBlock___block_invoke;
  v8[3] = &unk_1E95BC4B0;
  v9 = v6;
  v7 = v6;
  -[MSASServerSideModel acceptInvitationWithToken:info:completionBlock:](self, "acceptInvitationWithToken:info:completionBlock:", a3, 0, v8);

}

- (void)acceptInvitationWithToken:(id)a3 info:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASAddIsLocalChange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[MSASServerSideModel stateMachine](self, "stateMachine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__MSASServerSideModel_acceptInvitationWithToken_info_completionBlock___block_invoke;
    v16[3] = &unk_1E95BC4D8;
    v16[4] = self;
    v17 = v9;
    objc_msgSend(v12, "acceptInvitationWithToken:info:completionBlock:", v8, v11, v16);

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MODEL_INVALID_INVITATION"));
    objc_msgSend(v13, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASModelErrorDomain"), 5, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v15);
  }

}

- (void)validateInvitationForAlbum:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[MSASServerSideModel stateMachine](self, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__MSASServerSideModel_validateInvitationForAlbum_completionBlock___block_invoke;
  v10[3] = &unk_1E95BC500;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "validateInvitationForAlbum:completionBlock:", v7, v10);

}

- (void)acceptInvitationWithGUID:(id)a3
{
  -[MSASServerSideModel acceptInvitationWithGUID:info:](self, "acceptInvitationWithGUID:info:", a3, 0);
}

- (void)acceptInvitationWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  MSASServerSideModel *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__MSASServerSideModel_acceptInvitationWithGUID_info___block_invoke;
    block[3] = &unk_1E95BCE30;
    v10 = v7;
    v11 = self;
    v12 = v6;
    dispatch_async(v8, block);

  }
}

- (void)rejectInvitationWithGUID:(id)a3
{
  -[MSASServerSideModel rejectInvitationWithGUID:info:](self, "rejectInvitationWithGUID:info:", a3, 0);
}

- (void)rejectInvitationWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  MSASServerSideModel *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__MSASServerSideModel_rejectInvitationWithGUID_info___block_invoke;
    block[3] = &unk_1E95BCE30;
    v10 = v7;
    v11 = self;
    v12 = v6;
    dispatch_async(v8, block);

  }
}

- (void)markAsSpamAlbumWithGUID:(id)a3 info:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  MSASServerSideModel *v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSASServerSideModel.m"), 1551, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("albumGUID"));

  }
  -[MSASModelBase dbQueue](self, "dbQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MSASServerSideModel_markAsSpamAlbumWithGUID_info___block_invoke;
  block[3] = &unk_1E95BCE30;
  v14 = v8;
  v15 = self;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, block);

}

- (void)markAsSpamInvitationWithGUID:(id)a3 info:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  MSASServerSideModel *v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSASServerSideModel.m"), 1563, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invitationGUID"));

  }
  -[MSASModelBase dbQueue](self, "dbQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MSASServerSideModel_markAsSpamInvitationWithGUID_info___block_invoke;
  block[3] = &unk_1E95BCE30;
  v14 = v8;
  v15 = self;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, block);

}

- (void)MSASStateMachine:(id)a3 didFinishMarkingAsSpamInvitationForAlbum:(id)a4 invitationGUID:(id)a5 info:(id)a6 error:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v10 = a5;
  v11 = a6;
  v12 = a7;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __107__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForAlbum_invitationGUID_info_error___block_invoke;
  v17[3] = &unk_1E95BCE58;
  v17[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, v17);

}

- (void)markAsSpamInvitationWithToken:(id)a3 info:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  MSASServerSideModel *v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSASServerSideModel.m"), 1606, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invitationToken"));

  }
  -[MSASModelBase dbQueue](self, "dbQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MSASServerSideModel_markAsSpamInvitationWithToken_info___block_invoke;
  block[3] = &unk_1E95BCE30;
  v14 = v8;
  v15 = self;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, block);

}

- (void)MSASStateMachine:(id)a3 didFinishMarkingAsSpamInvitationForToken:(id)a4 info:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __92__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForToken_info_error___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4
{
  -[MSASServerSideModel addAccessControlEntries:toAlbumWithGUID:info:](self, "addAccessControlEntries:toAlbumWithGUID:info:", a3, a4, 0);
}

- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  MSASServerSideModel *v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__MSASServerSideModel_addAccessControlEntries_toAlbumWithGUID_info___block_invoke;
    v12[3] = &unk_1E95BCE58;
    v13 = v10;
    v14 = self;
    v15 = v9;
    v16 = v8;
    dispatch_async(v11, v12);

  }
}

- (void)removeAccessControlEntryWithGUID:(id)a3
{
  -[MSASServerSideModel removeAccessControlEntryWithGUID:info:](self, "removeAccessControlEntryWithGUID:info:", a3, 0);
}

- (void)removeAccessControlEntryWithGUID:(id)a3 info:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  MSASServerSideModel *v11;
  id v12;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__MSASServerSideModel_removeAccessControlEntryWithGUID_info___block_invoke;
    block[3] = &unk_1E95BCE30;
    v10 = v6;
    v11 = self;
    v12 = v8;
    dispatch_sync(v7, block);

  }
}

- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 completionBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_completionBlock___block_invoke;
  v10[3] = &unk_1E95BC4B0;
  v11 = v8;
  v9 = v8;
  -[MSASServerSideModel setPublicAccessEnabled:forAlbumWithGUID:info:completionBlock:](self, "setPublicAccessEnabled:forAlbumWithGUID:info:completionBlock:", v6, a4, 0, v10);

}

- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 info:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a4;
  v11 = a6;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "MSASAddIsLocalChange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[MSASModelBase dbQueue](self, "dbQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke;
    block[3] = &unk_1E95BC5A8;
    block[4] = self;
    v20 = a3;
    v17 = v10;
    v18 = v13;
    v19 = v11;
    v15 = v13;
    dispatch_async(v14, block);

  }
}

- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 completionBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_completionBlock___block_invoke;
  v10[3] = &unk_1E95BC4B0;
  v11 = v8;
  v9 = v8;
  -[MSASServerSideModel setMultipleContributorsEnabled:forAlbumWithGUID:info:completionBlock:](self, "setMultipleContributorsEnabled:forAlbumWithGUID:info:completionBlock:", v6, a4, 0, v10);

}

- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 info:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a4;
  v11 = a6;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "MSASAddIsLocalChange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[MSASModelBase dbQueue](self, "dbQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke;
    block[3] = &unk_1E95BC5A8;
    block[4] = self;
    v20 = a3;
    v17 = v10;
    v18 = v13;
    v19 = v11;
    v15 = v13;
    dispatch_async(v14, block);

  }
}

- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4
{
  -[MSASServerSideModel addAssetCollections:toAlbumWithGUID:info:](self, "addAssetCollections:toAlbumWithGUID:info:", a3, a4, 0);
}

- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  MSASServerSideModel *v27;
  void *v28;
  id v29;
  id obj;
  void *v31;
  _QWORD block[4];
  id v33;
  MSASServerSideModel *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "count");
  v31 = v9;
  if (v9 && v11)
  {
    v27 = self;
    v28 = v10;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v29 = v8;
    obj = v8;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (!v12)
    {
      v14 = 0;
      v15 = 0;
      goto LABEL_20;
    }
    v13 = v12;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v38;
    while (1)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x1D8255C20]();
        objc_msgSend(v18, "metadata");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", CFSTR("batchGUID"));
        v21 = objc_claimAutoreleasedReturnValue();
        if (!v21
          || (v22 = (void *)v21,
              objc_msgSend(v20, "objectForKey:", CFSTR("batchDateCreated")),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              v23,
              v22,
              !v23))
        {
          if (v15)
          {
            if (v14)
            {
LABEL_12:
              v24 = (void *)objc_msgSend(v20, "mutableCopy");
              objc_msgSend(v24, "setObject:forKey:", v15, CFSTR("batchDateCreated"));
              objc_msgSend(v24, "setObject:forKey:", v14, CFSTR("batchGUID"));
              objc_msgSend(v18, "setMetadata:", v24);

              goto LABEL_13;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              goto LABEL_12;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "MSMakeUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
LABEL_13:
        objc_msgSend(v18, "setAlbumGUID:", v31);

        objc_autoreleasePoolPop(v19);
        ++v17;
      }
      while (v13 != v17);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      v13 = v25;
      if (!v25)
      {
LABEL_20:

        -[MSASModelBase dbQueue](v27, "dbQueue");
        v26 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __64__MSASServerSideModel_addAssetCollections_toAlbumWithGUID_info___block_invoke;
        block[3] = &unk_1E95BCE58;
        v10 = v28;
        v33 = v28;
        v34 = v27;
        v35 = v31;
        v36 = obj;
        dispatch_async(v26, block);

        v8 = v29;
        break;
      }
    }
  }

}

- (void)deleteAssetCollectionWithGUID:(id)a3
{
  -[MSASServerSideModel deleteAssetCollectionWithGUID:info:](self, "deleteAssetCollectionWithGUID:info:", a3, 0);
}

- (void)deleteAssetCollectionWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  MSASServerSideModel *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__MSASServerSideModel_deleteAssetCollectionWithGUID_info___block_invoke;
    block[3] = &unk_1E95BCE30;
    v10 = v7;
    v11 = self;
    v12 = v6;
    dispatch_async(v8, block);

  }
}

- (void)deleteAssetCollectionsWithGUIDs:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  MSASServerSideModel *v8;

  v4 = a3;
  if (v4)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__MSASServerSideModel_deleteAssetCollectionsWithGUIDs___block_invoke;
    v6[3] = &unk_1E95BCFC0;
    v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);

  }
}

- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4
{
  -[MSASServerSideModel markCommentsForAssetCollectionWithGUID:asViewedWithLastViewedDate:info:](self, "markCommentsForAssetCollectionWithGUID:asViewedWithLastViewedDate:info:", a3, a4, 0);
}

- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  MSASServerSideModel *v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __94__MSASServerSideModel_markCommentsForAssetCollectionWithGUID_asViewedWithLastViewedDate_info___block_invoke;
    v12[3] = &unk_1E95BCE58;
    v13 = v10;
    v14 = self;
    v15 = v8;
    v16 = v9;
    dispatch_async(v11, v12);

  }
}

- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4
{
  -[MSASServerSideModel addComments:toAssetCollectionWithGUID:info:](self, "addComments:toAssetCollectionWithGUID:info:", a3, a4, 0);
}

- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  MSASServerSideModel *v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "count");
  if (v9 && v11)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__MSASServerSideModel_addComments_toAssetCollectionWithGUID_info___block_invoke;
    v13[3] = &unk_1E95BCE58;
    v14 = v10;
    v15 = self;
    v16 = v9;
    v17 = v8;
    dispatch_async(v12, v13);

  }
}

- (void)deleteCommentWithGUID:(id)a3
{
  -[MSASServerSideModel deleteCommentWithGUID:info:](self, "deleteCommentWithGUID:info:", a3, 0);
}

- (void)deleteCommentWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  MSASServerSideModel *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__MSASServerSideModel_deleteCommentWithGUID_info___block_invoke;
    block[3] = &unk_1E95BCE30;
    v10 = v7;
    v11 = self;
    v12 = v6;
    dispatch_async(v8, block);

  }
}

- (void)forgetEverything
{
  -[MSASServerSideModel forgetEverythingInfo:completionBlock:](self, "forgetEverythingInfo:completionBlock:", 0, 0);
}

- (void)forgetEverythingInfo:(id)a3
{
  -[MSASServerSideModel forgetEverythingInfo:completionBlock:](self, "forgetEverythingInfo:completionBlock:", a3, 0);
}

- (void)forgetEverythingInfo:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  MSASServerSideModel *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[MSASServerSideModel eventQueue](self, "eventQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MSASServerSideModel_forgetEverythingInfo_completionBlock___block_invoke;
  block[3] = &unk_1E95BC528;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)retrieveAssets:(id)a3 inAlbumWithGUID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  MSASServerSideModel *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v7 && v8)
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    v10 = (void *)objc_msgSend(v7, "copy");
    -[MSASModelBase dbQueue](self, "dbQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__MSASServerSideModel_retrieveAssets_inAlbumWithGUID___block_invoke;
    block[3] = &unk_1E95BCE30;
    v15 = v9;
    v16 = self;
    v17 = v10;
    v12 = v10;
    v13 = v9;
    dispatch_async(v11, block);

  }
}

- (void)retrieveAssetsFromAssetCollectionsWithGUIDs:(id)a3 assetTypeFlags:(int)a4
{
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  MSASServerSideModel *v10;
  int v11;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke;
    block[3] = &unk_1E95BC610;
    v9 = v6;
    v10 = self;
    v11 = a4;
    dispatch_async(v7, block);

  }
}

- (id)serverSideConfiguration
{
  void *v2;
  void *v3;

  -[MSASServerSideModel stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverSideConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setFocusAlbumGUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MSASServerSideModel stateMachine](self, "stateMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFocusAlbumGUID:", v4);

}

- (void)setFocusAssetCollectionGUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MSASServerSideModel stateMachine](self, "stateMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFocusAssetCollectionGUID:", v4);

}

- (id)focusAssetCollectionGUID
{
  void *v2;
  void *v3;

  -[MSASServerSideModel stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusAssetCollectionGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)dbQueueAlbumWithGUID:(id)a3 outObject:(id *)a4 outName:(id *)a5 outCtag:(id *)a6 outForeignCtag:(id *)a7 outURLString:(id *)a8 outUserInfoData:(id *)a9
{
  id v15;
  sqlite3_stmt *v16;
  uint64_t v17;
  BOOL v18;
  int v20;

  v15 = a3;
  v16 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select obj, name, ctag, foreignCtag, url, userInfo from Albums where GUID = ?;"));
  v17 = MSSqliteBindStringOrNull(v16, 1, v15);

  MSSqliteTrapForDBLockError(v17);
  if ((_DWORD)v17 || (v20 = sqlite3_step(v16), v20 == 101))
  {
LABEL_2:
    v18 = 0;
    if (!v16)
      return v18;
LABEL_3:
    sqlite3_reset(v16);
    return v18;
  }
  if (v20 != 100)
  {
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 2230);
    goto LABEL_2;
  }
  if (a4)
  {
    MSSqliteObjectFromStatementColumn(v16, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
  {
    MSSqliteStringFromStatementColumn(v16, 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
  {
    MSSqliteStringFromStatementColumn(v16, 2);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7)
  {
    MSSqliteStringFromStatementColumn(v16, 3);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a8)
  {
    MSSqliteStringFromStatementColumn(v16, 4);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a9)
  {
    MSSqliteDataFromStatementColumn(v16, 5);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = 1;
  if (v16)
    goto LABEL_3;
  return v18;
}

- (void)dbQueueSetAlbum:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  sqlite3_stmt *v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  uint64_t v24;
  int v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int v39;
  NSObject *v40;
  NSObject *v41;
  id *v42;
  id *v43;
  void *v44;
  _QWORD block[5];
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "GUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  v9 = -[MSASServerSideModel dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:](self, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v8, 0, 0, 0, 0, 0, &v52);
  v10 = v52;

  objc_msgSend(v6, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("name"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 && objc_msgSend(v6, "relationshipState") == 1)
  {
    -[MSASServerSideModel daemon](self, "daemon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateOwnerReputationScoreForAlbum:", v6);

  }
  v14 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("insert or replace into Albums (GUID, name, ctag, foreignCtag, obj, url, userInfo) values (?, ?, ?, ?, ?, ?, ?);"));
  objc_msgSend(v6, "GUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MSSqliteBindStringOrNull(v14, 1, v15);
  v17 = v16;
  MSSqliteTrapForDBLockError(v16);

  if (!v17)
  {
    v18 = MSSqliteBindStringOrNull(v14, 2, v12);
    v19 = v18;
    MSSqliteTrapForDBLockError(v18);
    if (!v19)
    {
      objc_msgSend(v6, "ctag");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = MSSqliteBindStringOrNull(v14, 3, v20);
      v22 = v21;
      MSSqliteTrapForDBLockError(v21);

      if (!v22)
      {
        objc_msgSend(v6, "foreignCtag");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = MSSqliteBindStringOrNull(v14, 4, v23);
        v25 = v24;
        MSSqliteTrapForDBLockError(v24);

        if (!v25)
        {
          v51 = 0;
          objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v51);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v51;
          v44 = v27;
          if (v26)
          {
            v28 = MSSqliteBindDataOrNull(v14, 5, v26);
          }
          else
          {
            v29 = (void *)MEMORY[0x1E0CB3940];
            v30 = v27;
            objc_msgSend(v27, "userInfo");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "stringWithFormat:", CFSTR("Failed to archive an album object. Error: %@ Info: %@"), v30, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v54 = v32;
              _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
            }

            v28 = MSSqliteBindDataOrNull(v14, 5, 0);
            v26 = 0;
          }
          MSSqliteTrapForDBLockError(v28);
          if (!(_DWORD)v28)
          {
            objc_msgSend(v6, "URLString");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = MSSqliteBindStringOrNull(v14, 6, v33);
            v35 = v34;
            MSSqliteTrapForDBLockError(v34);

            if (!v35)
            {
              v36 = MSSqliteBindDataOrNull(v14, 7, v10);
              v37 = v36;
              MSSqliteTrapForDBLockError(v36);
              if (!v37)
              {
                v38 = sqlite3_step(v14);
                v39 = v38;
                MSSqliteTrapForDBLockError(v38);
                if (v39 == 101)
                {
                  -[MSASServerSideModel commandQueue](self, "commandQueue");
                  v40 = objc_claimAutoreleasedReturnValue();
                  v41 = v40;
                  if (v9)
                  {
                    v48[0] = MEMORY[0x1E0C809B0];
                    v48[1] = 3221225472;
                    v48[2] = __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke;
                    v48[3] = &unk_1E95BCE30;
                    v48[4] = self;
                    v42 = &v49;
                    v49 = v6;
                    v43 = &v50;
                    v50 = v7;
                    -[NSObject flushQueueCompletionBlock:](v41, "flushQueueCompletionBlock:", v48);
                  }
                  else
                  {
                    -[NSObject MSASModel:didFindNewAlbum:info:](v40, "MSASModel:didFindNewAlbum:info:", self, v6, v7);

                    -[MSASServerSideModel eventQueue](self, "eventQueue");
                    v41 = objc_claimAutoreleasedReturnValue();
                    block[0] = MEMORY[0x1E0C809B0];
                    block[1] = 3221225472;
                    block[2] = __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke_4;
                    block[3] = &unk_1E95BCE30;
                    block[4] = self;
                    v42 = &v46;
                    v46 = v6;
                    v43 = &v47;
                    v47 = v7;
                    dispatch_async(v41, block);
                  }

                }
              }
            }
          }

        }
      }
    }
  }

  if (v14)
    sqlite3_reset(v14);

}

- (void)dbQueueUpdateAlbumCtag:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  sqlite3_stmt *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "GUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v6 = -[MSASServerSideModel dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:](self, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v5, 0, 0, 0, 0, 0, &v28);
  v7 = v28;

  if (v6)
  {
    v8 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("update or ignore Albums set obj = ?, ctag = ? , foreignCtag = ? where GUID = ?;"));
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v27;
    v11 = v10;
    if (v9)
    {
      v12 = MSSqliteBindDataOrNull(v8, 1, v9);
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Failed to archive an album object. Error: %@ Info: %@"), v11, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v30 = v15;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }

      v12 = sqlite3_bind_null(v8, 1);
    }
    v16 = v12;
    MSSqliteTrapForDBLockError(v12);
    if (!v16)
    {
      objc_msgSend(v4, "ctag");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MSSqliteBindStringOrNull(v8, 2, v17);
      v19 = v18;
      MSSqliteTrapForDBLockError(v18);

      if (!v19)
      {
        objc_msgSend(v4, "foreignCtag");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = MSSqliteBindStringOrNull(v8, 3, v20);
        v22 = v21;
        MSSqliteTrapForDBLockError(v21);

        if (!v22)
        {
          objc_msgSend(v4, "GUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = MSSqliteBindStringOrNull(v8, 4, v23);
          v25 = v24;
          MSSqliteTrapForDBLockError(v24);

          if (!v25)
          {
            v26 = sqlite3_step(v8);
            MSSqliteTrapForDBLockError(v26);
          }
        }
      }
    }

    if (v8)
      sqlite3_reset(v8);
  }

}

- (void)dbQueueDeleteAlbumWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  sqlite3_stmt *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD block[5];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v53 = 0;
  v8 = -[MSASServerSideModel dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:](self, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v6, &v53, 0, 0, 0, 0, 0);
  v9 = v53;
  v10 = v9;
  if (v8)
  {
    v40 = v9;
    v41 = v7;
    objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "MSASAddEventIsDueToAlbumDeletionAlbumGUID:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[MSASServerSideModel dbQueueAccessControlGUIDsForAlbumWithGUID:](self, "dbQueueAccessControlGUIDsForAlbumWithGUID:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASModelBase dbQueueBeginTransaction](self, "dbQueueBeginTransaction");
    v51 = 0u;
    v52 = 0u;
    v50 = 0u;
    v49 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v50 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x1D8255C20]();
          -[MSASServerSideModel dbQueueDeleteAccessControlWithGUID:info:](self, "dbQueueDeleteAccessControlWithGUID:info:", v19, v12);
          objc_autoreleasePoolPop(v20);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v16);
    }

    -[MSASModelBase dbQueueEndTransaction](self, "dbQueueEndTransaction");
    -[MSASServerSideModel dbQueueInvitationForAlbumWithGUID:](self, "dbQueueInvitationForAlbumWithGUID:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "GUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASServerSideModel dbQueueDeleteInvitationWithGUID:info:](self, "dbQueueDeleteInvitationWithGUID:info:", v23, v12);

    }
    v39 = v22;
    -[MSASServerSideModel dbQueueAssetCollectionGUIDsInAlbumWithGUID:](self, "dbQueueAssetCollectionGUIDsInAlbumWithGUID:", v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASModelBase dbQueueBeginTransaction](self, "dbQueueBeginTransaction");
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v46 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
          v31 = (void *)MEMORY[0x1D8255C20]();
          -[MSASServerSideModel dbQueueDeleteAssetCollectionWithGUID:info:](self, "dbQueueDeleteAssetCollectionWithGUID:info:", v30, v12);
          objc_autoreleasePoolPop(v31);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v27);
    }

    -[MSASModelBase dbQueueEndTransaction](self, "dbQueueEndTransaction");
    -[MSASServerSideModel dbQueueDeleteAllAlbumMetadataForAlbumWithGUID:info:](self, "dbQueueDeleteAllAlbumMetadataForAlbumWithGUID:info:", v6, v12);
    v32 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("delete from Albums where GUID = ?;"));
    v33 = MSSqliteBindStringOrNull(v32, 1, v6);
    v34 = v33;
    MSSqliteTrapForDBLockError(v33);
    v10 = v40;
    v7 = v41;
    if (!v34)
    {
      v35 = sqlite3_step(v32);
      v36 = v35;
      MSSqliteTrapForDBLockError(v35);
      if (v36 == 101)
      {
        -[MSASServerSideModel commandQueue](self, "commandQueue");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "MSASModel:didFindDeletedAlbum:info:", self, v40, v41);

        -[MSASServerSideModel eventQueue](self, "eventQueue");
        v38 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __55__MSASServerSideModel_dbQueueDeleteAlbumWithGUID_info___block_invoke;
        block[3] = &unk_1E95BCE30;
        block[4] = self;
        v43 = v40;
        v44 = v12;
        dispatch_async(v38, block);

      }
    }
    if (v32)
      sqlite3_reset(v32);

  }
}

- (BOOL)dbQueueAccessControlWithGUID:(id)a3 outObject:(id *)a4 outAlbumGUID:(id *)a5 outEmail:(id *)a6 outUserInfoData:(id *)a7
{
  id v12;
  sqlite3_stmt *v13;
  uint64_t v14;
  BOOL v15;
  int v17;

  v12 = a3;
  v13 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select obj, email, albumGUID, userInfo from AccessControls where GUID = ?;"));
  v14 = MSSqliteBindStringOrNull(v13, 1, v12);

  MSSqliteTrapForDBLockError(v14);
  if ((_DWORD)v14 || (v17 = sqlite3_step(v13), v17 == 101))
  {
LABEL_2:
    v15 = 0;
    if (!v13)
      return v15;
LABEL_3:
    sqlite3_reset(v13);
    return v15;
  }
  if (v17 != 100)
  {
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 2390);
    goto LABEL_2;
  }
  if (a4)
  {
    MSSqliteObjectFromStatementColumn(v13, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
  {
    MSSqliteStringFromStatementColumn(v13, 1);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
  {
    MSSqliteStringFromStatementColumn(v13, 2);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7)
  {
    MSSqliteDataFromStatementColumn(v13, 3);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = 1;
  if (v13)
    goto LABEL_3;
  return v15;
}

- (void)dbQueueSetAccessControl:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  id v14;
  sqlite3_stmt *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  id v26;
  sqlite3_stmt *v27;
  void *v28;
  id v29;
  void *v30;
  MSASServerSideModel *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id *v48;
  void *v49;
  id *v50;
  void *v51;
  void *v52;
  _QWORD block[5];
  id v54;
  id v55;
  void *v56;
  _QWORD v57[5];
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint8_t buf[4];
  MSASServerSideModel *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "albumGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  v9 = -[MSASServerSideModel dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:](self, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v8, &v64, 0, 0, 0, 0, 0);
  v10 = v64;

  if (v9)
  {
    objc_msgSend(v6, "GUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    v63 = 0;
    v12 = -[MSASServerSideModel dbQueueAccessControlWithGUID:outObject:outAlbumGUID:outEmail:outUserInfoData:](self, "dbQueueAccessControlWithGUID:outObject:outAlbumGUID:outEmail:outUserInfoData:", v11, &v63, 0, 0, &v62);
    v13 = v63;
    v14 = v62;

    if (v12 && objc_msgSend(v13, "isEqualToSharingRelationship:", v6))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v66 = self;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Not updating access control with an equivalent object.", buf, 0xCu);
      }
    }
    else
    {
      v15 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("insert or replace into AccessControls (GUID, email, albumGUID, obj, userInfo) values (?, ?, ?, ?, ?);"));
      objc_msgSend(v6, "GUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MSSqliteBindStringOrNull(v15, 1, v16);
      v18 = v17;
      MSSqliteTrapForDBLockError(v17);

      if (!v18)
      {
        objc_msgSend(v6, "email");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = MSSqliteBindStringOrNull(v15, 2, v19);
        v21 = v20;
        MSSqliteTrapForDBLockError(v20);

        if (!v21)
        {
          objc_msgSend(v6, "albumGUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = MSSqliteBindStringOrNull(v15, 3, v22);
          v24 = v23;
          MSSqliteTrapForDBLockError(v23);

          if (!v24)
          {
            v61 = 0;
            objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v61);
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = v61;
            v51 = v26;
            v52 = (void *)v25;
            if (v25)
            {
              v27 = v15;
              v28 = (void *)v25;
            }
            else
            {
              v49 = (void *)MEMORY[0x1E0CB3940];
              v29 = v26;
              objc_msgSend(v26, "userInfo");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "stringWithFormat:", CFSTR("Failed to archive an accessControl object. Error: %@ Info: %@"), v29, v30);
              v31 = (MSASServerSideModel *)objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v66 = v31;
                _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
              }

              v27 = v15;
              v28 = 0;
            }
            v32 = MSSqliteBindDataOrNull(v27, 4, v28);
            v33 = v32;
            MSSqliteTrapForDBLockError(v32);
            if (!v33)
            {
              v34 = MSSqliteBindDataOrNull(v15, 5, v14);
              v35 = v34;
              MSSqliteTrapForDBLockError(v34);
              if (!v35)
              {
                v36 = sqlite3_step(v15);
                v37 = v36;
                MSSqliteTrapForDBLockError(v36);
                if (v37 == 101)
                {
                  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", v7);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v12)
                  {
                    if (objc_msgSend(v13, "state") != 1 || objc_msgSend(v6, "state") != 2)
                    {
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "setObject:forKey:", v39, CFSTR("notInteresting"));

                    }
                    -[MSASServerSideModel commandQueue](self, "commandQueue");
                    v40 = objc_claimAutoreleasedReturnValue();
                    v57[0] = MEMORY[0x1E0C809B0];
                    v57[1] = 3221225472;
                    v57[2] = __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke;
                    v57[3] = &unk_1E95BCE58;
                    v57[4] = self;
                    v50 = &v58;
                    v58 = v6;
                    v48 = &v59;
                    v41 = &v60;
                    v59 = v10;
                    v60 = v38;
                    v42 = v38;
                    -[NSObject flushQueueCompletionBlock:](v40, "flushQueueCompletionBlock:", v57);
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "setObject:forKey:", v43, CFSTR("notInteresting"));

                    -[MSASServerSideModel commandQueue](self, "commandQueue");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "MSASModel:didFindNewAccessControl:inAlbum:info:", self, v6, v10, v38);

                    -[MSASServerSideModel eventQueue](self, "eventQueue");
                    v40 = objc_claimAutoreleasedReturnValue();
                    block[0] = MEMORY[0x1E0C809B0];
                    block[1] = 3221225472;
                    block[2] = __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke_4;
                    block[3] = &unk_1E95BCE58;
                    block[4] = self;
                    v50 = &v54;
                    v54 = v6;
                    v48 = &v55;
                    v41 = &v56;
                    v55 = v10;
                    v56 = v38;
                    v45 = v38;
                    dispatch_async(v40, block);
                  }

                }
              }
            }

          }
        }
      }
      if (v15)
        sqlite3_reset(v15);
      +[MSASPersonInfoManager sharedManager](MSASPersonInfoManager, "sharedManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v46;
      if (v46)
        objc_msgSend(v46, "updateWithSharingRelationship:", v6);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v66 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Rejecting access control destined for non-existent album.", buf, 0xCu);
  }

}

- (void)dbQueueDeleteAccessControlWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  id v10;
  sqlite3_stmt *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = 0;
  v8 = -[MSASServerSideModel dbQueueAccessControlWithGUID:outObject:outAlbumGUID:outEmail:outUserInfoData:](self, "dbQueueAccessControlWithGUID:outObject:outAlbumGUID:outEmail:outUserInfoData:", v6, &v25, &v24, 0, 0);
  v9 = v25;
  v10 = v24;
  if (v8)
  {
    v11 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("delete from AccessControls where GUID = ?;"));
    v12 = MSSqliteBindStringOrNull(v11, 1, v6);
    v13 = v12;
    MSSqliteTrapForDBLockError(v12);
    if (!v13)
    {
      v14 = sqlite3_step(v11);
      v15 = v14;
      MSSqliteTrapForDBLockError(v14);
      if (v15 == 101)
      {
        -[MSASServerSideModel dbQueueLookupOrCreateAlbumWithGUID:](self, "dbQueueLookupOrCreateAlbumWithGUID:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSASServerSideModel commandQueue](self, "commandQueue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "MSASModel:didFindDeletedAccessControl:inAlbum:info:", self, v9, v16, v7);

        -[MSASServerSideModel eventQueue](self, "eventQueue");
        v18 = objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __63__MSASServerSideModel_dbQueueDeleteAccessControlWithGUID_info___block_invoke;
        v20[3] = &unk_1E95BCE58;
        v20[4] = self;
        v21 = v9;
        v22 = v16;
        v23 = v7;
        v19 = v16;
        dispatch_async(v18, v20);

      }
    }
    if (v11)
      sqlite3_reset(v11);
  }

}

- (BOOL)dbQueueInvitationWithGUID:(id)a3 outObject:(id *)a4 outAlbumGUID:(id *)a5 outEmail:(id *)a6 outUserInfoData:(id *)a7
{
  id v12;
  sqlite3_stmt *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  BOOL v17;
  int v19;

  v12 = a3;
  v13 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select obj, albumGUID, email, userInfo from Invitations where GUID = ?;"));
  v14 = objc_retainAutorelease(v12);
  v15 = (const char *)objc_msgSend(v14, "UTF8String");

  v16 = sqlite3_bind_text(v13, 1, v15, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  LODWORD(v14) = v16;
  MSSqliteTrapForDBLockError(v16);
  if ((_DWORD)v14 || (v19 = sqlite3_step(v13), v19 == 101))
  {
LABEL_2:
    v17 = 0;
    if (!v13)
      return v17;
LABEL_3:
    sqlite3_reset(v13);
    return v17;
  }
  if (v19 != 100)
  {
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 2523);
    goto LABEL_2;
  }
  if (a4)
  {
    MSSqliteObjectFromStatementColumn(v13, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
  {
    MSSqliteStringFromStatementColumn(v13, 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
  {
    MSSqliteStringFromStatementColumn(v13, 2);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7)
  {
    MSSqliteDataFromStatementColumn(v13, 3);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = 1;
  if (v13)
    goto LABEL_3;
  return v17;
}

- (BOOL)dbQueueInvitationWithAlbumGUID:(id)a3 outObject:(id *)a4 outInvitationGUID:(id *)a5 outEmail:(id *)a6 outUserInfoData:(id *)a7
{
  id v12;
  sqlite3_stmt *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  BOOL v17;
  int v19;

  v12 = a3;
  v13 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select obj, GUID, email, userInfo from Invitations where albumGUID = ?;"));
  v14 = objc_retainAutorelease(v12);
  v15 = (const char *)objc_msgSend(v14, "UTF8String");

  v16 = sqlite3_bind_text(v13, 1, v15, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  LODWORD(v14) = v16;
  MSSqliteTrapForDBLockError(v16);
  if ((_DWORD)v14 || (v19 = sqlite3_step(v13), v19 == 101))
  {
LABEL_2:
    v17 = 0;
    if (!v13)
      return v17;
LABEL_3:
    sqlite3_reset(v13);
    return v17;
  }
  if (v19 != 100)
  {
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 2547);
    goto LABEL_2;
  }
  if (a4)
  {
    MSSqliteObjectFromStatementColumn(v13, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
  {
    MSSqliteStringFromStatementColumn(v13, 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
  {
    MSSqliteStringFromStatementColumn(v13, 2);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7)
  {
    MSSqliteDataFromStatementColumn(v13, 3);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = 1;
  if (v13)
    goto LABEL_3;
  return v17;
}

- (void)dbQueueSetInvitation:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  sqlite3_stmt *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  sqlite3_stmt *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  id *v37;
  id *v38;
  _QWORD block[5];
  id v40;
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "GUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v9 = -[MSASServerSideModel dbQueueInvitationWithGUID:outObject:outAlbumGUID:outEmail:outUserInfoData:](self, "dbQueueInvitationWithGUID:outObject:outAlbumGUID:outEmail:outUserInfoData:", v8, 0, 0, 0, &v46);
  v10 = v46;

  v11 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("insert or replace into Invitations (GUID, albumGUID, email, obj, userInfo) values (?, ?, ?, ?, ?);"));
  objc_msgSend(v6, "GUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MSSqliteBindStringOrNull(v11, 1, v12);
  v14 = v13;
  MSSqliteTrapForDBLockError(v13);

  if (!v14)
  {
    objc_msgSend(v6, "albumGUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MSSqliteBindStringOrNull(v11, 2, v15);
    v17 = v16;
    MSSqliteTrapForDBLockError(v16);

    if (!v17)
    {
      objc_msgSend(v6, "email");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = MSSqliteBindStringOrNull(v11, 3, v18);
      v20 = v19;
      MSSqliteTrapForDBLockError(v19);

      if (!v20)
      {
        v45 = 0;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v45);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v45;
        v23 = v22;
        if (v21)
        {
          v24 = v11;
          v25 = v21;
        }
        else
        {
          v26 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v22, "userInfo");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("Failed to archive an invitation object. Error: %@ Info: %@"), v23, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v48 = v28;
            _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }

          v24 = v11;
          v25 = 0;
        }
        v29 = MSSqliteBindDataOrNull(v24, 4, v25);
        v30 = v29;
        MSSqliteTrapForDBLockError(v29);
        if (!v30)
        {
          v31 = MSSqliteBindDataOrNull(v11, 5, v10);
          v32 = v31;
          MSSqliteTrapForDBLockError(v31);
          if (!v32)
          {
            v33 = sqlite3_step(v11);
            v34 = v33;
            MSSqliteTrapForDBLockError(v33);
            if (v34 == 101)
            {
              -[MSASServerSideModel commandQueue](self, "commandQueue");
              v35 = objc_claimAutoreleasedReturnValue();
              v36 = v35;
              if (v9)
              {
                v42[0] = MEMORY[0x1E0C809B0];
                v42[1] = 3221225472;
                v42[2] = __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke;
                v42[3] = &unk_1E95BCE30;
                v42[4] = self;
                v37 = &v43;
                v43 = v6;
                v38 = &v44;
                v44 = v7;
                -[NSObject flushQueueCompletionBlock:](v36, "flushQueueCompletionBlock:", v42);
              }
              else
              {
                -[NSObject MSASModel:didFindNewInvitation:info:](v35, "MSASModel:didFindNewInvitation:info:", self, v6, v7);

                -[MSASServerSideModel eventQueue](self, "eventQueue");
                v36 = objc_claimAutoreleasedReturnValue();
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke_4;
                block[3] = &unk_1E95BCE30;
                block[4] = self;
                v37 = &v40;
                v40 = v6;
                v38 = &v41;
                v41 = v7;
                dispatch_async(v36, block);
              }

            }
          }
        }

      }
    }
  }
  if (v11)
    sqlite3_reset(v11);

}

- (void)dbQueueDeleteInvitationWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  sqlite3_stmt *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v8 = -[MSASServerSideModel dbQueueInvitationWithGUID:outObject:outAlbumGUID:outEmail:outUserInfoData:](self, "dbQueueInvitationWithGUID:outObject:outAlbumGUID:outEmail:outUserInfoData:", v6, &v20, 0, 0, 0);
  v9 = v20;
  if (v8)
  {
    v10 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("delete from Invitations where GUID = ?;"));
    v11 = sqlite3_bind_text(v10, 1, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v12 = v11;
    MSSqliteTrapForDBLockError(v11);
    if (!v12)
    {
      v13 = sqlite3_step(v10);
      v14 = v13;
      MSSqliteTrapForDBLockError(v13);
      if (v14 == 101)
      {
        -[MSASServerSideModel commandQueue](self, "commandQueue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "MSASModel:didFindDeletedInvitation:info:", self, v9, v7);

        -[MSASServerSideModel eventQueue](self, "eventQueue");
        v16 = objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __60__MSASServerSideModel_dbQueueDeleteInvitationWithGUID_info___block_invoke;
        v17[3] = &unk_1E95BCE30;
        v17[4] = self;
        v18 = v9;
        v19 = v7;
        dispatch_async(v16, v17);

      }
    }
    if (v10)
      sqlite3_reset(v10);
  }

}

- (void)dbQueueDeleteInvitationForAlbumWithGUID:(id)a3 info:(id)a4
{
  id v6;
  _BOOL4 v7;
  id v8;
  id v9;

  v6 = a4;
  v9 = 0;
  v7 = -[MSASServerSideModel dbQueueInvitationWithAlbumGUID:outObject:outInvitationGUID:outEmail:outUserInfoData:](self, "dbQueueInvitationWithAlbumGUID:outObject:outInvitationGUID:outEmail:outUserInfoData:", a3, 0, &v9, 0, 0);
  v8 = v9;
  if (v7)
    -[MSASServerSideModel dbQueueDeleteInvitationWithGUID:info:](self, "dbQueueDeleteInvitationWithGUID:info:", v8, v6);

}

- (BOOL)dbQueueAssetCollectionWithGUID:(id)a3 outObject:(id *)a4 outCtag:(id *)a5 outAlbumGUID:(id *)a6 outBatchDate:(id *)a7 outPhotoDate:(id *)a8 outPhotoNumber:(int64_t *)a9 outUserInfoData:(id *)a10
{
  id v16;
  sqlite3_stmt *v17;
  uint64_t v18;
  BOOL v19;
  int v21;

  v16 = a3;
  v17 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select obj, ctag, albumGUID, batchDate, photoDate, photoNumber, userInfo from AssetCollections where GUID = ?;"));
  v18 = MSSqliteBindStringOrNull(v17, 1, v16);

  MSSqliteTrapForDBLockError(v18);
  if ((_DWORD)v18 || (v21 = sqlite3_step(v17), v21 == 101))
  {
LABEL_2:
    v19 = 0;
    if (!v17)
      return v19;
LABEL_3:
    sqlite3_reset(v17);
    return v19;
  }
  if (v21 != 100)
  {
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 2661);
    goto LABEL_2;
  }
  if (a4)
  {
    MSSqliteObjectFromStatementColumn(v17, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
  {
    MSSqliteStringFromStatementColumn(v17, 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
  {
    MSSqliteStringFromStatementColumn(v17, 2);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7)
  {
    MSSqliteDateFromTimeIntervalStatementColumn(v17, 3);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a8)
  {
    MSSqliteDateFromTimeIntervalStatementColumn(v17, 4);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a9)
    *a9 = sqlite3_column_int64(v17, 5);
  if (a10)
  {
    MSSqliteDataFromStatementColumn(v17, 6);
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = 1;
  if (v17)
    goto LABEL_3;
  return v19;
}

- (void)dbQueueSetAssetCollection:(id)a3 inAlbumWithGUID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  void *v13;
  id v14;
  sqlite3_stmt *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  MSASServerSideModel *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  int v41;
  NSObject *v42;
  NSObject *v43;
  id *v44;
  id *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  id *v53;
  _QWORD block[5];
  id v55;
  id v56;
  id v57;
  _QWORD v58[5];
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint8_t buf[4];
  MSASServerSideModel *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v64 = 0;
  v11 = -[MSASServerSideModel dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:](self, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v9, &v64, 0, 0, 0, 0, 0);
  v12 = v64;
  if (v11)
  {
    objc_msgSend(v8, "GUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    v52 = -[MSASServerSideModel dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:](self, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v13, 0, 0, 0, 0, 0, 0, &v63);
    v14 = v63;

    v15 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("insert or replace into AssetCollections (GUID, ctag, albumGUID, batchDate, photoDate, photoNumber, obj, userInfo) values (?, ?, ?, ?, ?, ?, ?, ?);"));
    objc_msgSend(v8, "GUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MSSqliteBindStringOrNull(v15, 1, v16);
    v18 = v17;
    MSSqliteTrapForDBLockError(v17);

    if (!v18)
    {
      objc_msgSend(v8, "ctag");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MSSqliteBindStringOrNull(v15, 2, v19);
      v21 = v20;
      MSSqliteTrapForDBLockError(v20);

      if (!v21)
      {
        v22 = MSSqliteBindStringOrNull(v15, 3, v9);
        v23 = v22;
        MSSqliteTrapForDBLockError(v22);
        if (!v23)
        {
          objc_msgSend(v8, "metadata");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKey:", CFSTR("batchDateCreated"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = MSSqliteBindTimeIntervalSinceReferenceDateOrNull(v15, 4, v25);
          LODWORD(v24) = v26;
          MSSqliteTrapForDBLockError(v26);
          if (!(_DWORD)v24)
          {
            v50 = v25;
            objc_msgSend(v8, "metadata");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKey:", CFSTR("dateCreated"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            v51 = v28;
            v29 = MSSqliteBindTimeIntervalSinceReferenceDateOrNull(v15, 5, v28);
            LODWORD(v27) = v29;
            MSSqliteTrapForDBLockError(v29);
            if (!(_DWORD)v27)
            {
              v30 = sqlite3_bind_int64(v15, 6, objc_msgSend(v8, "photoNumber"));
              v31 = v30;
              MSSqliteTrapForDBLockError(v30);
              if (!v31)
              {
                v62 = 0;
                objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v62);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = v62;
                v49 = v33;
                if (v32)
                {
                  v34 = MSSqliteBindDataOrNull(v15, 7, v32);
                }
                else
                {
                  v47 = (void *)MEMORY[0x1E0CB3940];
                  v35 = v33;
                  objc_msgSend(v33, "userInfo");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "stringWithFormat:", CFSTR("Failed to archive an assetCollection object. Error: %@ Info: %@"), v35, v36);
                  v37 = (MSASServerSideModel *)objc_claimAutoreleasedReturnValue();

                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v66 = v37;
                    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
                  }

                  v34 = MSSqliteBindDataOrNull(v15, 7, 0);
                  v32 = 0;
                }
                MSSqliteTrapForDBLockError(v34);
                if (!(_DWORD)v34)
                {
                  v38 = MSSqliteBindDataOrNull(v15, 8, v14);
                  v39 = v38;
                  MSSqliteTrapForDBLockError(v38);
                  if (!v39)
                  {
                    v40 = sqlite3_step(v15);
                    v41 = v40;
                    MSSqliteTrapForDBLockError(v40);
                    if (v41 == 101)
                    {
                      v48 = v32;
                      -[MSASServerSideModel commandQueue](self, "commandQueue");
                      v42 = objc_claimAutoreleasedReturnValue();
                      v43 = v42;
                      if (v52)
                      {
                        v58[0] = MEMORY[0x1E0C809B0];
                        v58[1] = 3221225472;
                        v58[2] = __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke;
                        v58[3] = &unk_1E95BCE58;
                        v58[4] = self;
                        v53 = &v59;
                        v59 = v8;
                        v44 = &v60;
                        v60 = v12;
                        v45 = &v61;
                        v61 = v10;
                        -[NSObject flushQueueCompletionBlock:](v43, "flushQueueCompletionBlock:", v58);
                      }
                      else
                      {
                        -[NSObject MSASModel:didFindNewAssetCollection:inAlbum:info:](v42, "MSASModel:didFindNewAssetCollection:inAlbum:info:", self, v8, v12, v10);

                        -[MSASServerSideModel eventQueue](self, "eventQueue");
                        v46 = objc_claimAutoreleasedReturnValue();
                        block[1] = 3221225472;
                        block[2] = __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke_4;
                        block[3] = &unk_1E95BCE58;
                        block[4] = self;
                        v53 = &v55;
                        block[0] = MEMORY[0x1E0C809B0];
                        v55 = v8;
                        v44 = &v56;
                        v56 = v12;
                        v45 = &v57;
                        v57 = v10;
                        v43 = v46;
                        dispatch_async(v46, block);
                      }

                      v32 = v48;
                    }
                  }
                }

              }
            }

            v25 = v50;
          }

        }
      }
    }
    if (v15)
      sqlite3_reset(v15);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v66 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Rejecting asset collection destined for non-existent album.", buf, 0xCu);
  }

}

- (void)dbQueueDeleteAssetCollectionWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  sqlite3_stmt *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  sqlite3_stmt *v30;
  uint64_t v31;
  int v32;
  int v33;
  void *v34;
  id v35;
  _QWORD block[5];
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v44 = 0;
  v45 = 0;
  v8 = -[MSASServerSideModel dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:](self, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v6, &v45, 0, &v44, 0, 0, 0, 0);
  v9 = v45;
  v10 = v44;
  if (v8)
  {
    v34 = v9;
    v35 = v7;
    objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "MSASAddEventIsDueToAssetCollectionDeletionAssetCollectionGUID:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[MSASModelBase dbQueueBeginTransaction](self, "dbQueueBeginTransaction");
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[MSASServerSideModel dbQueueCommentsForAssetCollectionWithGUID:](self, "dbQueueCommentsForAssetCollectionWithGUID:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v41 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1D8255C20]();
          objc_msgSend(v18, "GUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSASServerSideModel dbQueueDeleteCommentWithGUID:info:](self, "dbQueueDeleteCommentWithGUID:info:", v20, v12);

          objc_autoreleasePoolPop(v19);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v15);
    }

    -[MSASModelBase dbQueueEndTransaction](self, "dbQueueEndTransaction");
    -[MSASServerSideModel dbQueueDeleteAllAssetCollectionMetadataForAssetCollectionWithGUID:info:](self, "dbQueueDeleteAllAssetCollectionMetadataForAssetCollectionWithGUID:info:", v6, v12);
    v21 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("delete from AssetCollections where GUID = ?;"));
    v22 = MSSqliteBindStringOrNull(v21, 1, v6);
    v23 = v22;
    MSSqliteTrapForDBLockError(v22);
    if (!v23)
    {
      v24 = sqlite3_step(v21);
      MSSqliteTrapForDBLockError(v24);
    }
    v9 = v34;
    if (v21)
      sqlite3_reset(v21);
    -[MSASServerSideModel dbQueueLookupOrCreateAlbumWithGUID:](self, "dbQueueLookupOrCreateAlbumWithGUID:", v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASServerSideModel commandQueue](self, "commandQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "MSASModel:didFindDeletedAssetCollection:inAlbum:info:", self, v34, v25, v12);

    -[MSASServerSideModel eventQueue](self, "eventQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__MSASServerSideModel_dbQueueDeleteAssetCollectionWithGUID_info___block_invoke;
    block[3] = &unk_1E95BCE58;
    block[4] = self;
    v37 = v34;
    v28 = v25;
    v38 = v28;
    v29 = v12;
    v39 = v29;
    dispatch_async(v27, block);

    v30 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select count(GUID) from AssetCollections where albumGUID = ?"));
    v31 = MSSqliteBindStringOrNull(v30, 1, v10);
    v32 = v31;
    MSSqliteTrapForDBLockError(v31);
    v7 = v35;
    if (!v32)
    {
      v33 = sqlite3_step(v30);
      if (v33 != 101)
      {
        if (v33 == 100)
        {
          if (!sqlite3_column_int(v30, 0))
            -[MSASServerSideModel dbQueueSetUnviewedState:onAlbumWithGUID:info:](self, "dbQueueSetUnviewedState:onAlbumWithGUID:info:", 0, v10, v29);
        }
        else
        {
          MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 2781);
        }
      }
    }
    if (v30)
      sqlite3_reset(v30);

  }
}

- (BOOL)dbQueueCommentWithGUID:(id)a3 outObject:(id *)a4 outID:(unint64_t *)a5 outTimestamp:(id *)a6 outAssetCollectionGUID:(id *)a7 outIsCaption:(BOOL *)a8 outUserInfoData:(id *)a9
{
  id v15;
  sqlite3_stmt *v16;
  uint64_t v17;
  BOOL v18;
  int v20;

  v15 = a3;
  v16 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select obj, id, timestamp, assetCollectionGUID, isCaption, userInfo from Comments where GUID = ?;"));
  v17 = MSSqliteBindStringOrNull(v16, 1, v15);

  MSSqliteTrapForDBLockError(v17);
  if ((_DWORD)v17 || (v20 = sqlite3_step(v16), v20 == 101))
  {
LABEL_2:
    v18 = 0;
    if (!v16)
      return v18;
LABEL_3:
    sqlite3_reset(v16);
    return v18;
  }
  if (v20 != 100)
  {
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 2809);
    goto LABEL_2;
  }
  if (a4)
  {
    MSSqliteObjectFromStatementColumn(v16, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
    *a5 = sqlite3_column_int(v16, 1);
  if (a6)
  {
    MSSqliteDateFromTimeIntervalStatementColumn(v16, 2);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7)
  {
    MSSqliteStringFromStatementColumn(v16, 3);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a8)
    *a8 = sqlite3_column_int(v16, 4) != 0;
  if (a9)
  {
    MSSqliteDataFromStatementColumn(v16, 5);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = 1;
  if (v16)
    goto LABEL_3;
  return v18;
}

- (BOOL)dbQueueCommentWithID:(int)a3 assetCollectionGUID:(id)a4 outObject:(id *)a5 outGUID:(id *)a6 outTimestamp:(id *)a7 outIsCaption:(BOOL *)a8 outUserInfoData:(id *)a9
{
  id v15;
  sqlite3_stmt *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  int v23;

  v15 = a4;
  v16 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select obj, GUID, timestamp, isCaption, userInfo from Comments where id = ? and assetCollectionGUID = ?;"));
  v17 = sqlite3_bind_int(v16, 1, a3);
  v18 = v17;
  MSSqliteTrapForDBLockError(v17);
  if (v18
    || (v19 = MSSqliteBindStringOrNull(v16, 2, v15), v20 = v19, MSSqliteTrapForDBLockError(v19), v20)
    || (v23 = sqlite3_step(v16), v23 == 101))
  {
LABEL_3:
    v21 = 0;
    if (!v16)
      goto LABEL_5;
LABEL_4:
    sqlite3_reset(v16);
    goto LABEL_5;
  }
  if (v23 != 100)
  {
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 2834);
    goto LABEL_3;
  }
  if (a5)
  {
    MSSqliteObjectFromStatementColumn(v16, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
  {
    MSSqliteStringFromStatementColumn(v16, 1);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7)
  {
    MSSqliteDateFromTimeIntervalStatementColumn(v16, 2);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a8)
    *a8 = sqlite3_column_int(v16, 3) != 0;
  if (a9)
  {
    MSSqliteDataFromStatementColumn(v16, 4);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = 1;
  if (v16)
    goto LABEL_4;
LABEL_5:

  return v21;
}

- (void)dbQueueSetComment:(id)a3 forAssetCollectionWithGUID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  void *v16;
  sqlite3_stmt *v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  void *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  MSASServerSideModel *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int v39;
  NSObject *v40;
  NSObject *v41;
  id *v42;
  id *v43;
  void *v44;
  id *v45;
  void *v46;
  id v47;
  _BOOL4 v48;
  id *v49;
  id v50;
  _QWORD block[5];
  id v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint8_t buf[4];
  MSASServerSideModel *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v64 = 0;
  v65 = 0;
  v11 = -[MSASServerSideModel dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:](self, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v9, &v65, 0, &v64, 0, 0, 0, 0);
  v12 = v65;
  v13 = v64;
  if (v11)
  {
    v63 = 0;
    v14 = -[MSASServerSideModel dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:](self, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v13, &v63, 0, 0, 0, 0, 0);
    v15 = v63;
    if (v14)
    {
      objc_msgSend(v8, "GUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0;
      v48 = -[MSASServerSideModel dbQueueCommentWithGUID:outObject:outID:outTimestamp:outAssetCollectionGUID:outIsCaption:outUserInfoData:](self, "dbQueueCommentWithGUID:outObject:outID:outTimestamp:outAssetCollectionGUID:outIsCaption:outUserInfoData:", v16, 0, 0, 0, 0, 0, &v62);
      v50 = v62;

      v17 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("insert or replace into Comments (GUID, id, timestamp, assetCollectionGUID, isCaption, isMine, obj, userInfo) values (?, ?, ?, ?, ?, ?, ?, ?);"));
      objc_msgSend(v8, "GUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = MSSqliteBindStringOrNull(v17, 1, v18);
      v20 = v19;
      MSSqliteTrapForDBLockError(v19);

      if (!v20)
      {
        v21 = sqlite3_bind_int(v17, 2, objc_msgSend(v8, "ID"));
        v22 = v21;
        MSSqliteTrapForDBLockError(v21);
        if (!v22)
        {
          objc_msgSend(v8, "timestamp");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = MSSqliteBindTimeIntervalSinceReferenceDateOrNull(v17, 3, v23);
          v25 = v24;
          MSSqliteTrapForDBLockError(v24);

          if (!v25)
          {
            v26 = MSSqliteBindStringOrNull(v17, 4, v9);
            v27 = v26;
            MSSqliteTrapForDBLockError(v26);
            if (!v27)
            {
              v28 = sqlite3_bind_int(v17, 5, objc_msgSend(v8, "isCaption"));
              v29 = v28;
              MSSqliteTrapForDBLockError(v28);
              if (!v29)
              {
                v30 = sqlite3_bind_int(v17, 6, objc_msgSend(v8, "isMine"));
                v31 = v30;
                MSSqliteTrapForDBLockError(v30);
                if (!v31)
                {
                  v61 = 0;
                  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v61);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = v61;
                  if (v32)
                  {
                    v33 = MSSqliteBindDataOrNull(v17, 7, v32);
                  }
                  else
                  {
                    v44 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(v47, "userInfo");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "stringWithFormat:", CFSTR("Failed to archive a comment object. Error: %@ Info: %@"), v47, v34);
                    v35 = (MSASServerSideModel *)objc_claimAutoreleasedReturnValue();

                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      v67 = v35;
                      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
                    }

                    v33 = MSSqliteBindDataOrNull(v17, 7, 0);
                    v32 = 0;
                  }
                  MSSqliteTrapForDBLockError(v33);
                  if (!(_DWORD)v33)
                  {
                    v36 = MSSqliteBindDataOrNull(v17, 8, v50);
                    v37 = v36;
                    MSSqliteTrapForDBLockError(v36);
                    if (!v37)
                    {
                      v38 = sqlite3_step(v17);
                      v39 = v38;
                      MSSqliteTrapForDBLockError(v38);
                      if (v39 == 101)
                      {
                        v46 = v32;
                        -[MSASServerSideModel commandQueue](self, "commandQueue");
                        v40 = objc_claimAutoreleasedReturnValue();
                        v41 = v40;
                        if (v48)
                        {
                          v56[0] = MEMORY[0x1E0C809B0];
                          v56[1] = 3221225472;
                          v56[2] = __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke;
                          v56[3] = &unk_1E95BCE80;
                          v56[4] = self;
                          v49 = &v57;
                          v57 = v8;
                          v45 = &v58;
                          v58 = v12;
                          v43 = &v59;
                          v59 = v15;
                          v42 = &v60;
                          v60 = v10;
                          -[NSObject flushQueueCompletionBlock:](v41, "flushQueueCompletionBlock:", v56);
                        }
                        else
                        {
                          -[NSObject MSASModel:didFindNewComment:forAssetCollection:inAlbum:info:](v40, "MSASModel:didFindNewComment:forAssetCollection:inAlbum:info:", self, v8, v12, v15, v10);

                          -[MSASServerSideModel eventQueue](self, "eventQueue");
                          v41 = objc_claimAutoreleasedReturnValue();
                          block[0] = MEMORY[0x1E0C809B0];
                          block[1] = 3221225472;
                          block[2] = __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke_4;
                          block[3] = &unk_1E95BCE80;
                          block[4] = self;
                          v49 = &v52;
                          v52 = v8;
                          v45 = &v53;
                          v53 = v12;
                          v43 = &v54;
                          v54 = v15;
                          v42 = &v55;
                          v55 = v10;
                          dispatch_async(v41, block);
                        }

                        v32 = v46;
                      }
                    }
                  }

                }
              }
            }
          }
        }
      }
      if (v17)
        sqlite3_reset(v17);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v67 = self;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Rejecting comment destined for non-existent asset collection.", buf, 0xCu);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v67 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Rejecting comment destined for non-existent asset collection.", buf, 0xCu);
  }

}

- (void)dbQueueDeleteCommentWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  id v10;
  sqlite3_stmt *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  sqlite3_stmt *v22;
  uint64_t v23;
  int v24;
  int v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v6 = a3;
  v7 = a4;
  v33 = 0;
  v32 = 0;
  v8 = -[MSASServerSideModel dbQueueCommentWithGUID:outObject:outID:outTimestamp:outAssetCollectionGUID:outIsCaption:outUserInfoData:](self, "dbQueueCommentWithGUID:outObject:outID:outTimestamp:outAssetCollectionGUID:outIsCaption:outUserInfoData:", v6, &v33, 0, 0, &v32, 0, 0);
  v9 = v33;
  v10 = v32;
  if (v8)
  {
    v11 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("delete from Comments where GUID = ?;"));
    v12 = MSSqliteBindStringOrNull(v11, 1, v6);
    v13 = v12;
    MSSqliteTrapForDBLockError(v12);
    if (!v13)
    {
      v14 = sqlite3_step(v11);
      v15 = v14;
      MSSqliteTrapForDBLockError(v14);
      if (v15 == 101)
      {
        v31 = 0;
        -[MSASServerSideModel dbQueueLookupOrCreateAssetCollectionWithGUID:outAlbum:](self, "dbQueueLookupOrCreateAssetCollectionWithGUID:outAlbum:", v10, &v31);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v31;
        -[MSASServerSideModel commandQueue](self, "commandQueue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "MSASModel:didDeleteComment:forAssetCollection:inAlbum:info:", self, v9, v16, v17, v7);

        -[MSASServerSideModel eventQueue](self, "eventQueue");
        v19 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __57__MSASServerSideModel_dbQueueDeleteCommentWithGUID_info___block_invoke;
        block[3] = &unk_1E95BCE80;
        block[4] = self;
        v27 = v9;
        v28 = v16;
        v29 = v17;
        v30 = v7;
        v20 = v17;
        v21 = v16;
        dispatch_async(v19, block);

      }
    }
    if (v11)
      sqlite3_reset(v11);
    v22 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select count(GUID) from Comments where assetCollectionGUID = ?;"));
    v23 = MSSqliteBindStringOrNull(v22, 1, v10);
    v24 = v23;
    MSSqliteTrapForDBLockError(v23);
    if (!v24)
    {
      v25 = sqlite3_step(v22);
      if (v25 != 101)
      {
        if (v25 == 100)
        {
          if (!sqlite3_column_int(v22, 0))
            -[MSASServerSideModel dbQueueSetUnviewedState:onAssetCollectionWithGUID:info:](self, "dbQueueSetUnviewedState:onAssetCollectionWithGUID:info:", 0, v10, v7);
        }
        else
        {
          MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 2948);
        }
      }
    }
    if (v22)
      sqlite3_reset(v22);
  }

}

- (id)dbQueueMaximumCommentIDForAssetCollectionWithGUID:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  sqlite3_stmt *v9;
  uint64_t v10;
  int v11;
  int v13;
  id v14;

  v4 = a3;
  v14 = 0;
  v5 = -[MSASServerSideModel dbQueueAssetCollectionMetadataWithAssetCollectionGUID:key:outValue:](self, "dbQueueAssetCollectionMetadataWithAssetCollectionGUID:key:outValue:", v4, CFSTR("largestCommentID"), &v14);
  v6 = v14;
  v7 = v6;
  if (!v5)
  {
    v9 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select max(id) from Comments where assetCollectionGUID = ?;"));
    v10 = MSSqliteBindStringOrNull(v9, 1, v4);
    v11 = v10;
    MSSqliteTrapForDBLockError(v10);
    if (!v11)
    {
      v13 = sqlite3_step(v9);
      if (v13 != 101)
      {
        if (v13 == 100)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_column_int(v9, 0));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9)
            goto LABEL_6;
          goto LABEL_5;
        }
        MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 2972);
      }
    }
    v8 = 0;
    if (!v9)
      goto LABEL_6;
LABEL_5:
    sqlite3_reset(v9);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "intValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v8;
}

- (BOOL)dbQueueAssetCollectionContainsCommentsFromMeAssetCollectionGUID:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  uint64_t v6;
  sqlite3 *v7;
  MSASServerSideModel *v8;
  int v9;
  BOOL v10;
  int v12;

  v4 = a3;
  v5 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select assetCollectionGUID from Comments where assetCollectionGUID = ? and isMine > 0;"));
  v6 = MSSqliteBindStringOrNull(v5, 1, v4);

  MSSqliteTrapForDBLockError(v6);
  if ((_DWORD)v6)
  {
    v7 = -[MSASModelBase dbQueueDB](self, "dbQueueDB");
    v8 = self;
    v9 = 2985;
LABEL_3:
    MSLogSqliteError(v7, (uint64_t)v8, v9);
    goto LABEL_4;
  }
  v12 = sqlite3_step(v5);
  if (v12 == 100)
  {
    v10 = 1;
    if (!v5)
      return v10;
    goto LABEL_5;
  }
  if (v12 != 101)
  {
    v7 = -[MSASModelBase dbQueueDB](self, "dbQueueDB");
    v8 = self;
    v9 = 2990;
    goto LABEL_3;
  }
LABEL_4:
  v10 = 0;
  if (v5)
LABEL_5:
    sqlite3_reset(v5);
  return v10;
}

- (BOOL)dbQueueAlbumMetadataWithAlbumGUID:(id)a3 key:(id)a4 outValue:(id *)a5
{
  id v8;
  id v9;
  sqlite3_stmt *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  int v16;

  v8 = a4;
  v9 = a3;
  v10 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select value from AlbumMetadata where albumGUID = ? and key = ?;"));
  v11 = MSSqliteBindStringOrNull(v10, 1, v9);

  MSSqliteTrapForDBLockError(v11);
  if ((_DWORD)v11
    || (v12 = MSSqliteBindStringOrNull(v10, 2, v8), v13 = v12, MSSqliteTrapForDBLockError(v12), v13)
    || (v16 = sqlite3_step(v10), v16 == 101))
  {
LABEL_3:
    v14 = 0;
    if (!v10)
      goto LABEL_5;
LABEL_4:
    sqlite3_reset(v10);
    goto LABEL_5;
  }
  if (v16 != 100)
  {
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 3010);
    goto LABEL_3;
  }
  if (a5)
  {
    MSSqliteStringFromStatementColumn(v10, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = 1;
  if (v10)
    goto LABEL_4;
LABEL_5:

  return v14;
}

- (void)dbQueueSetAlbumMetadataAlbumGUID:(id)a3 key:(id)a4 value:(id)a5 info:(id)a6
{
  id v9;
  id v10;
  sqlite3_stmt *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  id v18;

  v18 = a4;
  v9 = a5;
  v10 = a3;
  v11 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("insert or replace into AlbumMetadata (albumGUID, key, value) values (?, ?, ?);"));
  v12 = MSSqliteBindStringOrNull(v11, 1, v10);

  MSSqliteTrapForDBLockError(v12);
  if (!(_DWORD)v12)
  {
    v13 = MSSqliteBindStringOrNull(v11, 2, v18);
    v14 = v13;
    MSSqliteTrapForDBLockError(v13);
    if (!v14)
    {
      v15 = MSSqliteBindStringOrNull(v11, 3, v9);
      v16 = v15;
      MSSqliteTrapForDBLockError(v15);
      if (!v16)
      {
        v17 = sqlite3_step(v11);
        MSSqliteTrapForDBLockError(v17);
      }
    }
  }
  if (v11)
    sqlite3_reset(v11);

}

- (void)dbQueueDeleteAlbumMetadataAlbumGUID:(id)a3 key:(id)a4 info:(id)a5
{
  id v7;
  sqlite3_stmt *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  id v13;

  v13 = a4;
  v7 = a3;
  v8 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("delete from AlbumMetadata where albumGUID = ? and key = ?;"));
  v9 = MSSqliteBindStringOrNull(v8, 1, v7);

  MSSqliteTrapForDBLockError(v9);
  if (!(_DWORD)v9)
  {
    v10 = MSSqliteBindStringOrNull(v8, 2, v13);
    v11 = v10;
    MSSqliteTrapForDBLockError(v10);
    if (!v11)
    {
      v12 = sqlite3_step(v8);
      MSSqliteTrapForDBLockError(v12);
    }
  }
  if (v8)
    sqlite3_reset(v8);

}

- (void)dbQueueDeleteAllAlbumMetadataForAlbumWithGUID:(id)a3 info:(id)a4
{
  id v5;
  sqlite3_stmt *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a3;
  v6 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("delete from AlbumMetadata where albumGUID = ?;"));
  v7 = MSSqliteBindStringOrNull(v6, 1, v5);

  MSSqliteTrapForDBLockError(v7);
  if ((_DWORD)v7)
  {
    if (!v6)
      return;
    goto LABEL_3;
  }
  v8 = sqlite3_step(v6);
  MSSqliteTrapForDBLockError(v8);
  if (v6)
LABEL_3:
    sqlite3_reset(v6);
}

- (BOOL)dbQueueAssetCollectionMetadataWithAssetCollectionGUID:(id)a3 key:(id)a4 outValue:(id *)a5
{
  id v8;
  id v9;
  sqlite3_stmt *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  int v16;

  v8 = a4;
  v9 = a3;
  v10 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select value from AssetCollectionMetadata where assetCollectionGUID = ? and key = ?;"));
  v11 = MSSqliteBindStringOrNull(v10, 1, v9);

  MSSqliteTrapForDBLockError(v11);
  if ((_DWORD)v11
    || (v12 = MSSqliteBindStringOrNull(v10, 2, v8), v13 = v12, MSSqliteTrapForDBLockError(v12), v13)
    || (v16 = sqlite3_step(v10), v16 == 101))
  {
LABEL_3:
    v14 = 0;
    if (!v10)
      goto LABEL_5;
LABEL_4:
    sqlite3_reset(v10);
    goto LABEL_5;
  }
  if (v16 != 100)
  {
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 3070);
    goto LABEL_3;
  }
  if (a5)
  {
    MSSqliteStringFromStatementColumn(v10, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = 1;
  if (v10)
    goto LABEL_4;
LABEL_5:

  return v14;
}

- (void)dbQueueSetAssetCollectionMetadataAssetCollectionGUID:(id)a3 key:(id)a4 value:(id)a5 info:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  sqlite3_stmt *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  _BOOL4 v25;
  id v26;
  id v27;
  _BOOL4 v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  _QWORD block[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v43 = 0;
  -[MSASServerSideModel dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:](self, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v10, 0, 0, &v43, 0, 0, 0, 0);
  v14 = v43;
  v15 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("insert or replace into AssetCollectionMetadata (assetCollectionGUID, albumGUID, key, value) values (?, ?, ?, ?);"));
  v16 = MSSqliteBindStringOrNull(v15, 1, v10);
  v17 = v16;
  MSSqliteTrapForDBLockError(v16);
  if (!v17)
  {
    v18 = MSSqliteBindStringOrNull(v15, 2, v14);
    v19 = v18;
    MSSqliteTrapForDBLockError(v18);
    if (!v19)
    {
      v20 = MSSqliteBindStringOrNull(v15, 3, v11);
      v21 = v20;
      MSSqliteTrapForDBLockError(v20);
      if (!v21)
      {
        v22 = MSSqliteBindStringOrNull(v15, 4, v12);
        v23 = v22;
        MSSqliteTrapForDBLockError(v22);
        if (!v23)
        {
          v24 = sqlite3_step(v15);
          MSSqliteTrapForDBLockError(v24);
        }
      }
    }
  }
  if (v15)
    sqlite3_reset(v15);
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("lastcommenttimestamp")))
  {
    v42 = 0;
    v41 = 0;
    v25 = -[MSASServerSideModel dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:](self, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v10, &v42, 0, &v41, 0, 0, 0, 0);
    v26 = v42;
    v27 = v41;
    if (v25)
    {
      v40 = 0;
      v28 = -[MSASServerSideModel dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:](self, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v27, &v40, 0, 0, 0, 0, 0);
      v29 = v40;
      if (v28)
      {
        v30 = (void *)MEMORY[0x1E0C99D68];
        v34 = v29;
        objc_msgSend(v12, "doubleValue");
        objc_msgSend(v30, "dateWithTimeIntervalSinceReferenceDate:");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSASServerSideModel eventQueue](self, "eventQueue");
        v32 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __91__MSASServerSideModel_dbQueueSetAssetCollectionMetadataAssetCollectionGUID_key_value_info___block_invoke;
        block[3] = &unk_1E95BCE80;
        block[4] = self;
        v36 = v31;
        v37 = v26;
        v38 = v34;
        v39 = v13;
        v33 = v31;
        dispatch_async(v32, block);

        v29 = v34;
      }

    }
  }

}

- (void)dbQueueDeleteAssetCollectionMetadataAssetCollectionGUID:(id)a3 key:(id)a4 info:(id)a5
{
  id v7;
  sqlite3_stmt *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  id v13;

  v13 = a4;
  v7 = a3;
  v8 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("delete from AssetCollectionMetadata where assetCollectionGUID = ? and key = ?;"));
  v9 = MSSqliteBindStringOrNull(v8, 1, v7);

  MSSqliteTrapForDBLockError(v9);
  if (!(_DWORD)v9)
  {
    v10 = MSSqliteBindStringOrNull(v8, 2, v13);
    v11 = v10;
    MSSqliteTrapForDBLockError(v10);
    if (!v11)
    {
      v12 = sqlite3_step(v8);
      MSSqliteTrapForDBLockError(v12);
    }
  }
  if (v8)
    sqlite3_reset(v8);

}

- (void)dbQueueDeleteAllAssetCollectionMetadataForAssetCollectionWithGUID:(id)a3 info:(id)a4
{
  id v5;
  sqlite3_stmt *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a3;
  v6 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("delete from AssetCollectionMetadata where assetCollectionGUID = ?;"));
  v7 = MSSqliteBindStringOrNull(v6, 1, v5);

  MSSqliteTrapForDBLockError(v7);
  if ((_DWORD)v7)
  {
    if (!v6)
      return;
    goto LABEL_3;
  }
  v8 = sqlite3_step(v6);
  MSSqliteTrapForDBLockError(v8);
  if (v6)
LABEL_3:
    sqlite3_reset(v6);
}

- (id)dbQueueMaximumPhotoNumberForAlbumWithGUID:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  uint64_t v6;
  void *v7;
  int v9;
  sqlite3_int64 v10;

  v4 = a3;
  v5 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select max(photoNumber) from AssetCollections where AlbumGUID = ?"));
  v6 = MSSqliteBindStringOrNull(v5, 1, v4);

  MSSqliteTrapForDBLockError(v6);
  if (!(_DWORD)v6)
  {
    v9 = sqlite3_step(v5);
    if (v9 != 101)
    {
      if (v9 == 100)
      {
        v10 = sqlite3_column_int64(v5, 0);
        if ((v10 & 0x8000000000000000) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v5)
            return v7;
          goto LABEL_3;
        }
      }
      else
      {
        MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 3155);
      }
    }
  }
  v7 = 0;
  if (v5)
LABEL_3:
    sqlite3_reset(v5);
  return v7;
}

- (int)dbQueueCountOfUnviewedAssetCollectionsInAlbumWithGUID:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  uint64_t v6;
  sqlite3 *v7;
  MSASServerSideModel *v8;
  int v9;
  int v10;
  int v12;

  v4 = a3;
  v5 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select count(*) from AssetCollectionMetadata where albumGUID = ? and key = 'unviewedFlag' and value = '1';"));
  v6 = MSSqliteBindStringOrNull(v5, 1, v4);

  MSSqliteTrapForDBLockError(v6);
  if ((_DWORD)v6)
  {
    v7 = -[MSASModelBase dbQueueDB](self, "dbQueueDB");
    v8 = self;
    v9 = 3170;
LABEL_3:
    MSLogSqliteError(v7, (uint64_t)v8, v9);
    goto LABEL_4;
  }
  v12 = sqlite3_step(v5);
  if (v12 != 101)
  {
    if (v12 == 100)
    {
      v10 = sqlite3_column_int(v5, 0);
      if (!v5)
        return v10;
      goto LABEL_5;
    }
    v7 = -[MSASModelBase dbQueueDB](self, "dbQueueDB");
    v8 = self;
    v9 = 3175;
    goto LABEL_3;
  }
LABEL_4:
  v10 = 0;
  if (v5)
LABEL_5:
    sqlite3_reset(v5);
  return v10;
}

- (void)dbQueueSetUnviewedState:(BOOL)a3 onAssetCollectionWithGUID:(id)a4 info:(id)a5
{
  int v6;
  id v8;
  id v9;
  int v10;
  id v11;
  void *v12;
  const __CFString *v13;
  _BOOL4 v14;
  id v15;
  id v16;
  _BOOL4 v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  char v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  MSASServerSideModel *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v6 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v32 = 0;
  v10 = -[MSASServerSideModel dbQueueAssetCollectionMetadataWithAssetCollectionGUID:key:outValue:](self, "dbQueueAssetCollectionMetadataWithAssetCollectionGUID:key:outValue:", v8, CFSTR("unviewedFlag"), &v32);
  v11 = v32;
  v12 = v11;
  if (v10)
    v10 = objc_msgSend(v11, "isEqualToString:", CFSTR("1"));
  if (v10 == v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543874;
      v34 = self;
      v35 = 2114;
      v36 = v8;
      v37 = 1024;
      v38 = v10;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Not setting unviewed state on asset collection GUID %{public}@ because it is the same as the previous state: %d", buf, 0x1Cu);
    }
  }
  else
  {
    if (v6)
      v13 = CFSTR("1");
    else
      v13 = 0;
    -[MSASServerSideModel dbQueueSetAssetCollectionMetadataAssetCollectionGUID:key:value:info:](self, "dbQueueSetAssetCollectionMetadataAssetCollectionGUID:key:value:info:", v8, CFSTR("unviewedFlag"), v13, v9);
    v30 = 0;
    v31 = 0;
    v14 = -[MSASServerSideModel dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:](self, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v8, &v31, 0, &v30, 0, 0, 0, 0);
    v15 = v31;
    v16 = v30;
    if (v14)
    {
      v29 = 0;
      v17 = -[MSASServerSideModel dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:](self, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v16, &v29, 0, 0, 0, 0, 0);
      v18 = v29;
      if (v17)
      {
        -[MSASServerSideModel eventQueue](self, "eventQueue");
        v19 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __78__MSASServerSideModel_dbQueueSetUnviewedState_onAssetCollectionWithGUID_info___block_invoke;
        block[3] = &unk_1E95BC698;
        block[4] = self;
        v25 = v15;
        v28 = v6;
        v26 = v18;
        v27 = v9;
        dispatch_async(v19, block);

      }
      if ((v6 & 1) == 0)
      {
        v23 = 0;
        v20 = -[MSASServerSideModel dbQueueAlbumMetadataWithAlbumGUID:key:outValue:](self, "dbQueueAlbumMetadataWithAlbumGUID:key:outValue:", v16, CFSTR("unviewedFlag"), &v23);
        v21 = v23;
        v22 = v21;
        if (v20
          && objc_msgSend(v21, "isEqualToString:", CFSTR("1"))
          && !-[MSASServerSideModel dbQueueCountOfUnviewedAssetCollectionsInAlbumWithGUID:](self, "dbQueueCountOfUnviewedAssetCollectionsInAlbumWithGUID:", v16))
        {
          -[MSASServerSideModel dbQueueSetUnviewedState:onAlbumWithGUID:info:](self, "dbQueueSetUnviewedState:onAlbumWithGUID:info:", 0, v16, v9);
        }

      }
    }

  }
}

- (void)dbQueueSetUnviewedState:(BOOL)a3 onAlbumWithGUID:(id)a4 info:(id)a5
{
  int v6;
  id v8;
  id v9;
  int v10;
  id v11;
  void *v12;
  const __CFString *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _QWORD block[5];
  id v21;
  id v22;
  int v23;
  char v24;
  id v25;
  id v26;
  uint8_t buf[4];
  MSASServerSideModel *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v6 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v26 = 0;
  v10 = -[MSASServerSideModel dbQueueAlbumMetadataWithAlbumGUID:key:outValue:](self, "dbQueueAlbumMetadataWithAlbumGUID:key:outValue:", v8, CFSTR("unviewedFlag"), &v26);
  v11 = v26;
  v12 = v11;
  if (v10)
    v10 = objc_msgSend(v11, "isEqualToString:", CFSTR("1"));
  if (v10 == v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543874;
      v28 = self;
      v29 = 2114;
      v30 = v8;
      v31 = 1024;
      v32 = v10;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Not setting unviewed state on album GUID %{public}@ because it is the same as the previous state: %d", buf, 0x1Cu);
    }
  }
  else
  {
    if (v6)
      v13 = CFSTR("1");
    else
      v13 = 0;
    -[MSASServerSideModel dbQueueSetAlbumMetadataAlbumGUID:key:value:info:](self, "dbQueueSetAlbumMetadataAlbumGUID:key:value:info:", v8, CFSTR("unviewedFlag"), v13, v9);
    v25 = 0;
    v14 = -[MSASServerSideModel dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:](self, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v8, &v25, 0, 0, 0, 0, 0);
    v15 = v25;
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v15, "GUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[MSASServerSideModel dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:](self, "dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:", v17);

      -[MSASServerSideModel eventQueue](self, "eventQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__MSASServerSideModel_dbQueueSetUnviewedState_onAlbumWithGUID_info___block_invoke;
      block[3] = &unk_1E95BC6E8;
      block[4] = self;
      v21 = v16;
      v24 = v6;
      v22 = v9;
      v23 = v18;
      dispatch_async(v19, block);

    }
  }

}

- (BOOL)dbQueueCheckToClearUnviewedStateOnAssetCollectionWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  BOOL v14;
  id v16;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v8 = -[MSASServerSideModel dbQueueAssetCollectionMetadataWithAssetCollectionGUID:key:outValue:](self, "dbQueueAssetCollectionMetadataWithAssetCollectionGUID:key:outValue:", v6, CFSTR("lastcommentposition"), &v16);
  v9 = v16;
  if (v8
    && ((-[MSASServerSideModel dbQueueMaximumCommentIDForAssetCollectionWithGUID:](self, "dbQueueMaximumCommentIDForAssetCollectionWithGUID:", v6), (v10 = objc_claimAutoreleasedReturnValue()) == 0)|| (v11 = (void *)v10, v12 = objc_msgSend(v9, "intValue"), v13 = objc_msgSend(v11, "intValue"), v11, v13 <= v12)))
  {
    -[MSASServerSideModel dbQueueSetUnviewedState:onAssetCollectionWithGUID:info:](self, "dbQueueSetUnviewedState:onAssetCollectionWithGUID:info:", 0, v6, v7);
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)dbQueueCheckToClearUnviewedStateOnAlbumWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  _BOOL4 v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  BOOL v16;
  int v17;
  NSObject *v18;
  id v19;
  _QWORD block[5];
  id v22;
  id v23;
  int v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v6 = a3;
  v7 = a4;
  v28 = 0;
  v8 = -[MSASServerSideModel dbQueueAlbumMetadataWithAlbumGUID:key:outValue:](self, "dbQueueAlbumMetadataWithAlbumGUID:key:outValue:", v6, CFSTR("lastviewedctag"), &v28);
  v9 = v28;
  if (v8)
  {
    v26 = 0;
    v27 = 0;
    v25 = 0;
    v10 = -[MSASServerSideModel dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:](self, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v6, &v27, 0, &v26, &v25, 0, 0);
    v11 = v27;
    v12 = v26;
    v13 = v25;
    v14 = v13;
    if (!v10)
      goto LABEL_10;
    v15 = (objc_msgSend(v13, "isEqualToString:", v9) & 1) != 0
       || objc_msgSend(v12, "isEqualToString:", v9);
    v17 = -[MSASServerSideModel dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:](self, "dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:", v6);
    -[MSASServerSideModel eventQueue](self, "eventQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__MSASServerSideModel_dbQueueCheckToClearUnviewedStateOnAlbumWithGUID_info___block_invoke;
    block[3] = &unk_1E95BC488;
    block[4] = self;
    v11 = v11;
    v22 = v11;
    v24 = v17;
    v19 = v7;
    v23 = v19;
    dispatch_async(v18, block);

    if (v15)
    {
      -[MSASServerSideModel dbQueueSetUnviewedState:onAlbumWithGUID:info:](self, "dbQueueSetUnviewedState:onAlbumWithGUID:info:", 0, v6, v19);
      v16 = 1;
    }
    else
    {
LABEL_10:
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
    v11 = 0;
    v14 = 0;
    v12 = 0;
  }

  return v16;
}

- (void)eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum:(id)a3 unviewedCount:(int)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int v15;
  uint8_t buf[4];
  MSASServerSideModel *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v17 = self;
    v18 = 2114;
    v19 = v8;
    v20 = 1024;
    v21 = a4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Setting unviewed count for album %{public}@ to %d.", buf, 0x1Cu);
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __97__MSASServerSideModel_eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum_unviewedCount_info___block_invoke;
  v12[3] = &unk_1E95BC710;
  v15 = a4;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[MSASServerSideModel eventQueuePerformBlockOnObservers:](self, "eventQueuePerformBlockOnObservers:", v12);

}

- (BOOL)isAlbumWithGUIDMarkedAsUnviewed:(id)a3
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
  block[2] = __55__MSASServerSideModel_isAlbumWithGUIDMarkedAsUnviewed___block_invoke;
  block[3] = &unk_1E95BC2F0;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (int)unviewedAlbumCount
{
  MSASServerSideModel *v2;
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
  v5[2] = __41__MSASServerSideModel_unviewedAlbumCount__block_invoke;
  v5[3] = &unk_1E95BCEF8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

- (int)dbQueueUnviewedAlbumCount
{
  sqlite3_stmt *v3;
  int v4;
  int v5;

  v3 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select count(albumGUID) from AlbumMetadata where key = 'unviewedFlag' and value = '1';"));
  v4 = sqlite3_step(v3);
  if (v4 != 101)
  {
    if (v4 == 100)
    {
      v5 = sqlite3_column_int(v3, 0);
      if (!v3)
        return v5;
      goto LABEL_7;
    }
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 3344);
  }
  v5 = 0;
  if (v3)
LABEL_7:
    sqlite3_reset(v3);
  return v5;
}

- (BOOL)isAssetCollectionWithGUIDMarkedAsUnviewed:(id)a3
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
  block[2] = __65__MSASServerSideModel_isAssetCollectionWithGUIDMarkedAsUnviewed___block_invoke;
  block[3] = &unk_1E95BC2F0;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (int)unviewedAssetCollectionCountForAlbumWithGUID:(id)a3
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
  block[2] = __68__MSASServerSideModel_unviewedAssetCollectionCountForAlbumWithGUID___block_invoke;
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

- (int)dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  sqlite3_int64 v10;
  int v11;
  sqlite3_stmt *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  int v18;
  id v19;
  id v20;

  v4 = a3;
  v20 = 0;
  v5 = -[MSASServerSideModel dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:](self, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v4, &v20, 0, 0, 0, 0, 0);
  v6 = v20;
  if (!v5)
  {
    v11 = 0;
    goto LABEL_11;
  }
  v19 = 0;
  v7 = -[MSASServerSideModel dbQueueAlbumMetadataWithAlbumGUID:key:outValue:](self, "dbQueueAlbumMetadataWithAlbumGUID:key:outValue:", v4, CFSTR("lastassetposition"), &v19);
  v8 = v19;
  v9 = v8;
  if (v7)
    v10 = objc_msgSend(v8, "longLongValue");
  else
    v10 = -1;
  v12 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("select count(GUID) from AssetCollections where albumGUID = ? and photoNumber > ?;"));
  v13 = MSSqliteBindStringOrNull(v12, 1, v4);
  v14 = v13;
  MSSqliteTrapForDBLockError(v13);
  if (v14)
    goto LABEL_8;
  v15 = sqlite3_bind_int64(v12, 2, v10);
  v16 = v15;
  MSSqliteTrapForDBLockError(v15);
  if (v16)
    goto LABEL_8;
  v18 = sqlite3_step(v12);
  if (v18 == 101)
    goto LABEL_8;
  if (v18 != 100)
  {
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 3391);
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v11 = sqlite3_column_int(v12, 0);
LABEL_9:

  if (v12)
    sqlite3_reset(v12);
LABEL_11:

  return v11;
}

- (void)dbQueueDeleteAllPendingCommentCheckOperations
{
  sqlite3_stmt *v3;
  uint64_t v4;
  int v5;
  int v6;
  MSASServerSideModel *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Deleting all comment check operations.", (uint8_t *)&v6, 0xCu);
  }
  v3 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("delete from CommentCheckQueue;"));
  v4 = sqlite3_step(v3);
  v5 = v4;
  MSSqliteTrapForDBLockError(v4);
  if (v5 != 101)
    MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, 3403);
  if (v3)
    sqlite3_reset(v3);
}

- (id)dbQueuePendingCommentCheckOperations
{
  return +[MSASModelEnumerator enumeratorWithDatabase:query:stepBlock:](MSASModelEnumerator, "enumeratorWithDatabase:query:stepBlock:", -[MSASModelBase dbQueueDB](self, "dbQueueDB"), CFSTR("select assetCollectionGUID, albumGUID from CommentCheckQueue order by albumGUID;"),
           &__block_literal_global_428);
}

- (void)dbQueueAddCommentCheckOperation:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  MSASServerSideModel *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "assetCollectionGUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "albumGUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = self;
    v19 = 2114;
    v20 = v15;
    v21 = 2114;
    v22 = v16;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Enqueuing comment check operation for asset collection GUID %{public}@ in album GUID %{public}@", (uint8_t *)&v17, 0x20u);

  }
  v5 = -[MSASModelBase statementForString:](self, "statementForString:", CFSTR("insert or replace into CommentCheckQueue (assetCollectionGUID, albumGUID) values (?, ?);"));
  objc_msgSend(v4, "assetCollectionGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MSSqliteBindStringOrNull(v5, 1, v6);
  v8 = v7;
  MSSqliteTrapForDBLockError(v7);

  if (v8)
  {
    v9 = 3423;
  }
  else
  {
    objc_msgSend(v4, "albumGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MSSqliteBindStringOrNull(v5, 2, v10);
    v12 = v11;
    MSSqliteTrapForDBLockError(v11);

    if (v12)
    {
      v9 = 3424;
    }
    else
    {
      v13 = sqlite3_step(v5);
      v14 = v13;
      MSSqliteTrapForDBLockError(v13);
      if (v14 == 101)
        goto LABEL_10;
      v9 = 3425;
    }
  }
  MSLogSqliteError(-[MSASModelBase dbQueueDB](self, "dbQueueDB"), (uint64_t)self, v9);
LABEL_10:
  if (v5)
    sqlite3_reset(v5);

}

- (void)flushAllPendingCommentCheckOperations
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASModelBase dbQueue](self, "dbQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MSASServerSideModel_flushAllPendingCommentCheckOperations__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)dbQueueFlushAllPendingCommentCheckOperations
{
  void *v3;
  __int128 v4;
  int v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  MSASServerSideModel *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v29 = self;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Flushing pending comment check queue.", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 50);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[MSASServerSideModel dbQueuePendingCommentCheckOperations](self, "dbQueuePendingCommentCheckOperations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v23)
  {
    v5 = 0;
    v6 = 0;
    v22 = *(_QWORD *)v25;
    *(_QWORD *)&v4 = 138543874;
    v20 = v4;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        v8 = v6;
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1D8255C20]();
        objc_msgSend(v9, "albumGUID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v9, "assetCollectionGUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v20;
          v29 = self;
          v30 = 2114;
          v31 = v17;
          v32 = 2114;
          v33 = v6;
          _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Flushing pending comment check operation for asset collection GUID %{public}@ in album GUID %{public}@", buf, 0x20u);

        }
        if (v5 > 50 || v8 && (objc_msgSend(v6, "isEqualToString:", v8) & 1) == 0)
        {
          -[MSASServerSideModel stateMachine](self, "stateMachine", v20);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v3, "copy");
          objc_msgSend(v11, "checkForCommentChanges:inAlbumWithGUID:", v12, v8);

          objc_msgSend(v3, "removeAllObjects");
          v5 = 0;
          v8 = 0;
        }
        ++v5;
        objc_msgSend(v9, "assetCollectionGUID", v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSASServerSideModel dbQueueMaximumCommentIDForAssetCollectionWithGUID:](self, "dbQueueMaximumCommentIDForAssetCollectionWithGUID:", v13);
        v14 = objc_claimAutoreleasedReturnValue();

        if (v14)
          v15 = (void *)v14;
        else
          v15 = &unk_1E95D3370;
        objc_msgSend(v9, "assetCollectionGUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v15, v16);

        objc_autoreleasePoolPop(v10);
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v23);
  }
  else
  {
    v6 = 0;
  }

  if (objc_msgSend(v3, "count"))
  {
    -[MSASServerSideModel stateMachine](self, "stateMachine");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "checkForCommentChanges:inAlbumWithGUID:", v3, v6);

  }
  -[MSASServerSideModel dbQueueDeleteAllPendingCommentCheckOperations](self, "dbQueueDeleteAllPendingCommentCheckOperations");
  -[MSASServerSideModel stateMachine](self, "stateMachine");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "retryOutstandingActivities");

}

- (id)lastViewedCommentDateForAssetCollectionWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[MSASModelBase dbQueue](self, "dbQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MSASServerSideModel_lastViewedCommentDateForAssetCollectionWithGUID___block_invoke;
  block[3] = &unk_1E95BC2F0;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)earliestUnviewedAssetCollectionGUIDInAlbumWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__MSASServerSideModel_earliestUnviewedAssetCollectionGUIDInAlbumWithGUID___block_invoke;
  block[3] = &unk_1E95BC2F0;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)eventQueuePerformBlockOnObservers:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MSASServerSideModel observers](self, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D8255C20]();
        v4[2](v4, v10);
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (id)dbQueueLookupOrCreateAlbumWithGUID:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  id v9;

  v4 = a3;
  v9 = 0;
  v5 = -[MSASServerSideModel dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:](self, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v4, &v9, 0, 0, 0, 0, 0);
  v6 = v9;
  if (!v5)
  {
    +[MSASAlbum album](MSASAlbum, "album");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setGUID:", v4);
    v6 = v7;
  }

  return v6;
}

- (id)dbQueueLookupOrCreateAssetCollectionWithGUID:(id)a3 outAlbum:(id *)a4
{
  id v6;
  BOOL v7;
  MSASAssetCollection *v8;
  id v9;
  MSASAssetCollection *v10;
  id v12;
  id v13;

  v6 = a3;
  v12 = 0;
  v13 = 0;
  v7 = -[MSASServerSideModel dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:](self, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v6, &v13, 0, &v12, 0, 0, 0, 0);
  v8 = (MSASAssetCollection *)v13;
  v9 = v12;
  if (!v7)
  {
    v10 = objc_alloc_init(MSASAssetCollection);

    -[MSASAssetCollection setGUID:](v10, "setGUID:", v6);
    v8 = v10;
  }
  if (a4)
  {
    -[MSASServerSideModel dbQueueLookupOrCreateAlbumWithGUID:](self, "dbQueueLookupOrCreateAlbumWithGUID:", v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)dbQueueLookupOrCreateCommentWithGUID:(id)a3 outAssetCollection:(id *)a4 outAlbum:(id *)a5
{
  id v8;
  BOOL v9;
  MSASComment *v10;
  id v11;
  MSASComment *v12;
  id v13;
  id v14;
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v18 = 0;
  v19 = 0;
  v9 = -[MSASServerSideModel dbQueueCommentWithGUID:outObject:outID:outTimestamp:outAssetCollectionGUID:outIsCaption:outUserInfoData:](self, "dbQueueCommentWithGUID:outObject:outID:outTimestamp:outAssetCollectionGUID:outIsCaption:outUserInfoData:", v8, &v19, 0, 0, &v18, 0, 0);
  v10 = (MSASComment *)v19;
  v11 = v18;
  if (!v9)
  {
    v12 = objc_alloc_init(MSASComment);

    -[MSASComment setGUID:](v12, "setGUID:", v8);
    v10 = v12;
  }
  if ((unint64_t)a4 | (unint64_t)a5)
  {
    v16 = 0;
    v17 = 0;
    -[MSASServerSideModel dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:](self, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v11, &v17, 0, &v16, 0, 0, 0, 0);
    v13 = v17;
    v14 = v16;
    if (a4)
      *a4 = objc_retainAutorelease(v13);
    if (a5 && v14)
    {
      -[MSASServerSideModel dbQueueLookupOrCreateAlbumWithGUID:](self, "dbQueueLookupOrCreateAlbumWithGUID:", v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v10;
}

- (id)_invalidInvitationGUIDErrorWithGUID:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MSASServerSideModel__invalidInvitationGUIDErrorWithGUID___block_invoke;
  block[3] = &unk_1E95BCED0;
  v11 = v3;
  v4 = _invalidInvitationGUIDErrorWithGUID__onceToken;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&_invalidInvitationGUIDErrorWithGUID__onceToken, block);
    v7 = v11;
  }
  v8 = (id)_invalidInvitationGUIDErrorWithGUID__error;

  return v8;
}

- (id)_invalidAccessControlGUIDErrorwithGUID:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MSASServerSideModel__invalidAccessControlGUIDErrorwithGUID___block_invoke;
  block[3] = &unk_1E95BCED0;
  v11 = v3;
  v4 = _invalidAccessControlGUIDErrorwithGUID__onceToken;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&_invalidAccessControlGUIDErrorwithGUID__onceToken, block);
    v7 = v11;
  }
  v8 = (id)_invalidAccessControlGUIDErrorwithGUID__error;

  return v8;
}

- (id)_invalidAssetCollectionGUIDErrorwithGUID:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MSASServerSideModel__invalidAssetCollectionGUIDErrorwithGUID___block_invoke;
  block[3] = &unk_1E95BCED0;
  v11 = v3;
  v4 = _invalidAssetCollectionGUIDErrorwithGUID__onceToken;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&_invalidAssetCollectionGUIDErrorwithGUID__onceToken, block);
    v7 = v11;
  }
  v8 = (id)_invalidAssetCollectionGUIDErrorwithGUID__error;

  return v8;
}

- (id)_protocolErrorForUnderlyingError:(id)a3
{
  void *v3;
  id v4;
  __CFString *v5;
  void *v6;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = a3;
    v5 = (__CFString *)MSCFCopyLocalizedString(CFSTR("Model.error.protocol"));
    objc_msgSend(v3, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASModelErrorDomain"), 8, v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)MSASStateMachineDidStart:(id)a3
{
  NSObject *v4;
  void *v5;
  _QWORD block[5];

  -[MSASModelBase dbQueue](self, "dbQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MSASServerSideModel_MSASStateMachineDidStart___block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_sync(v4, block);

  -[MSASServerSideModel commandQueue](self, "commandQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flushQueueCompletionBlock:", 0);

}

- (void)MSASStateMachineDidFindGlobalResetSync:(id)a3 info:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[MSASServerSideModel eventQueue](self, "eventQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__MSASServerSideModel_MSASStateMachineDidFindGlobalResetSync_info___block_invoke;
  v8[3] = &unk_1E95BCFC0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)MSASStateMachine:(id)a3 didFindAlbumChanges:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  MSASServerSideModel *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__MSASServerSideModel_MSASStateMachine_didFindAlbumChanges_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v16 = v10;
  v17 = self;
  v18 = v9;
  v19 = v8;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(v11, v15);

}

- (void)MSASStateMachine:(id)a3 didFindNewURLString:(id)a4 forAlbumWithGUID:(id)a5 info:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__MSASServerSideModel_MSASStateMachine_didFindNewURLString_forAlbumWithGUID_info___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v16[4] = self;
  v17 = v10;
  v18 = v9;
  v19 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  dispatch_async(v12, v16);

}

- (void)MSASStateMachine:(id)a3 didFindSyncedKeyValueChangesForAlbumGUIDS:(id)a4 albumChanges:(id)a5 accessControlChangesForAlbumGUIDS:(id)a6 info:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MSASPendingChanges *v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v17 = a3;
  v16 = -[MSASPendingChanges initWithSyncedKeyValueChangesForAlbumGUIDS:albumChanges:accessControlChangesForAlbumGUIDS:]([MSASPendingChanges alloc], "initWithSyncedKeyValueChangesForAlbumGUIDS:albumChanges:accessControlChangesForAlbumGUIDS:", v15, v14, v13);
  -[MSASServerSideModel setPendingChanges:](self, "setPendingChanges:", v16);

  -[MSASServerSideModel MSASStateMachine:didFindSyncedKeyValueChangesForAlbumGUIDS:info:](self, "MSASStateMachine:didFindSyncedKeyValueChangesForAlbumGUIDS:info:", v17, v15, v12);
  -[MSASServerSideModel MSASStateMachine:didFindAlbumChanges:info:](self, "MSASStateMachine:didFindAlbumChanges:info:", v17, v14, v12);

  -[MSASServerSideModel MSASStateMachine:didFindAccessControlChangesForAlbumGUIDS:info:](self, "MSASStateMachine:didFindAccessControlChangesForAlbumGUIDS:info:", v17, v13, v12);
}

- (void)MSASStateMachine:(id)a3 didFindAccessControlChangesForAlbumGUIDS:(id)a4 info:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD block[4];
  id v15;
  MSASServerSideModel *v16;
  id v17;

  v7 = a4;
  v13 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASModelBase dbQueue](self, "dbQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__MSASServerSideModel_MSASStateMachine_didFindAccessControlChangesForAlbumGUIDS_info___block_invoke;
  block[3] = &unk_1E95BCE30;
  v15 = v7;
  v16 = self;
  v10 = v8;
  v17 = v10;
  v11 = v7;
  dispatch_sync(v9, block);

  if (objc_msgSend(v10, "count"))
  {
    -[MSASServerSideModel stateMachine](self, "stateMachine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getAccessControlsForAlbums:info:", v10, v13);

  }
}

- (void)MSASStateMachine:(id)a3 didFindSyncedKeyValueChangesForAlbumGUIDS:(id)a4 info:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD block[4];
  id v15;
  MSASServerSideModel *v16;
  id v17;

  v7 = a4;
  v13 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASModelBase dbQueue](self, "dbQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__MSASServerSideModel_MSASStateMachine_didFindSyncedKeyValueChangesForAlbumGUIDS_info___block_invoke;
  block[3] = &unk_1E95BCE30;
  v15 = v7;
  v16 = self;
  v10 = v8;
  v17 = v10;
  v11 = v7;
  dispatch_sync(v9, block);

  if (objc_msgSend(v10, "count"))
  {
    -[MSASServerSideModel stateMachine](self, "stateMachine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "checkForAlbumSyncedStateChangesInAlbums:info:", v10, v13);

  }
}

- (void)MSASStateMachine:(id)a3 didFinishCheckingForChangesInfo:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  MSASServerSideModel *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  MSASServerSideModel *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSASServerSideModel pendingChanges](self, "pendingChanges");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasPendingChanges");

  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[MSASServerSideModel pendingChanges](self, "pendingChanges");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v13;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Still has pending changes %{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v21 = self;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Finished checking for changes", buf, 0xCu);
    }
    -[MSASServerSideModel flushAllPendingCommentCheckOperations](self, "flushAllPendingCommentCheckOperations");
    -[MSASServerSideModel commandQueue](self, "commandQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __78__MSASServerSideModel_MSASStateMachine_didFinishCheckingForChangesInfo_error___block_invoke;
    v15[3] = &unk_1E95BCE58;
    v16 = v8;
    v17 = self;
    v18 = v9;
    v19 = v10;
    objc_msgSend(v14, "flushQueueCompletionBlock:", v15);

  }
}

- (void)MSASStateMachine:(id)a3 didFinishGettingAccessControls:(id)a4 forAlbum:(id)a5 info:(id)a6 error:(id)a7
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
  _QWORD v23[4];
  id v24;
  id v25;
  MSASServerSideModel *v26;
  id v27;
  id v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __91__MSASServerSideModel_MSASStateMachine_didFinishGettingAccessControls_forAlbum_info_error___block_invoke;
  v23[3] = &unk_1E95BC758;
  v24 = v16;
  v25 = v13;
  v26 = self;
  v27 = v15;
  v28 = v14;
  v29 = v12;
  v18 = v12;
  v19 = v14;
  v20 = v15;
  v21 = v13;
  v22 = v16;
  dispatch_async(v17, v23);

}

- (void)MSASStateMachine:(id)a3 didFindAssetCollectionChanges:(id)a4 forAlbum:(id)a5 info:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  MSASServerSideModel *v19;
  id v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__MSASServerSideModel_MSASStateMachine_didFindAssetCollectionChanges_forAlbum_info___block_invoke;
  block[3] = &unk_1E95BCE58;
  v17 = v11;
  v18 = v10;
  v19 = self;
  v20 = v9;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  dispatch_sync(v12, block);

}

- (void)MSASStateMachine:(id)a3 didFindChangesInAlbum:(id)a4 info:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  MSASServerSideModel *v18;
  id v19;
  id v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__MSASServerSideModel_MSASStateMachine_didFindChangesInAlbum_info_error___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v17 = v11;
  v18 = self;
  v19 = v9;
  v20 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, v16);

}

- (void)MSASStateMachine:(id)a3 didFinishCheckingForUpdatesInAlbum:(id)a4 info:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  MSASServerSideModel *v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__MSASServerSideModel_MSASStateMachine_didFinishCheckingForUpdatesInAlbum_info_error___block_invoke;
  block[3] = &unk_1E95BCE80;
  v20 = v13;
  v21 = self;
  v22 = v11;
  v23 = v12;
  v24 = v10;
  v15 = v10;
  v16 = v12;
  v17 = v11;
  v18 = v13;
  dispatch_async(v14, block);

}

- (void)MSASStateMachine:(id)a3 didFinishCheckingForUpdatesInAlbums:(id)a4 info:(id)a5
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a5;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__MSASServerSideModel_MSASStateMachine_didFinishCheckingForUpdatesInAlbums_info___block_invoke;
  v9[3] = &unk_1E95BCFC0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

- (void)MSASStateMachine:(id)a3 didFireScheduledEvent:(id)a4 forAssetCollectionGUID:(id)a5 albumGUID:(id)a6 info:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v11, "isEqualToString:", CFSTR("preFlushPendingCommentQueue")))
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __100__MSASServerSideModel_MSASStateMachine_didFireScheduledEvent_forAssetCollectionGUID_albumGUID_info___block_invoke;
    v16[3] = &unk_1E95BCE58;
    v16[4] = self;
    v17 = v12;
    v18 = v13;
    v19 = v14;
    dispatch_async(v15, v16);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v11, "isEqualToString:", CFSTR("flushPendingCommentQueue")))
    {
      -[MSASServerSideModel flushAllPendingCommentCheckOperations](self, "flushAllPendingCommentCheckOperations");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend(v11, "isEqualToString:", CFSTR("reconstruct")))
      {
        -[MSASServerSideModel _reconstruct](self, "_reconstruct");
      }
    }
  }

}

- (void)MSASStateMachine:(id)a3 didFinishUpdatingAssetCollections:(id)a4 inAlbum:(id)a5 info:(id)a6 error:(id)a7
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
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  MSASServerSideModel *v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__MSASServerSideModel_MSASStateMachine_didFinishUpdatingAssetCollections_inAlbum_info_error___block_invoke;
  block[3] = &unk_1E95BC758;
  v24 = v16;
  v25 = v13;
  v26 = v15;
  v27 = v14;
  v28 = self;
  v29 = v12;
  v18 = v12;
  v19 = v14;
  v20 = v15;
  v21 = v13;
  v22 = v16;
  dispatch_sync(v17, block);

}

- (void)MSASStateMachine:(id)a3 didFinishSubscribingToAlbum:(id)a4 info:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  MSASServerSideModel *v19;
  id v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v17 = v11;
  v18 = v9;
  v19 = self;
  v20 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, v16);

}

- (void)MSASStateMachine:(id)a3 didFinishUnsubscribingFromAlbum:(id)a4 info:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  MSASServerSideModel *v19;
  id v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v17 = v11;
  v18 = v9;
  v19 = self;
  v20 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, v16);

}

- (void)MSASStateMachine:(id)a3 didFinishEnqueueingAssetsForDownload:(id)a4 inAlbumWithGUID:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__MSASServerSideModel_MSASStateMachine_didFinishEnqueueingAssetsForDownload_inAlbumWithGUID___block_invoke;
  v11[3] = &unk_1E95BCD00;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[MSASServerSideModel eventQueuePerformBlockOnObservers:](self, "eventQueuePerformBlockOnObservers:", v11);

}

- (void)MSASStateMachine:(id)a3 didFinishRetrievingAsset:(id)a4 inAlbum:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v16[4] = self;
  v17 = v10;
  v18 = v9;
  v19 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  dispatch_async(v12, v16);

}

- (void)MSASStateMachine:(id)a3 didFindCommentChanges:(id)a4 inAssetCollectionWithGUID:(id)a5 inAlbumWithGUID:(id)a6 info:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__MSASServerSideModel_MSASStateMachine_didFindCommentChanges_inAssetCollectionWithGUID_inAlbumWithGUID_info___block_invoke;
  block[3] = &unk_1E95BCE80;
  block[4] = self;
  v21 = v12;
  v22 = v13;
  v23 = v11;
  v24 = v14;
  v16 = v14;
  v17 = v11;
  v18 = v13;
  v19 = v12;
  dispatch_async(v15, block);

}

- (void)MSASStateMachine:(id)a3 didFinishCheckingForCommentChangesInAssetCollectionWithGUID:(id)a4 largestCommentID:(int)a5 info:(id)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  MSASServerSideModel *v20;
  id v21;
  id v22;
  int v23;

  v11 = a4;
  v12 = a6;
  v13 = a7;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__MSASServerSideModel_MSASStateMachine_didFinishCheckingForCommentChangesInAssetCollectionWithGUID_largestCommentID_info_error___block_invoke;
  block[3] = &unk_1E95BC7C0;
  v23 = a5;
  v19 = v13;
  v20 = self;
  v21 = v11;
  v22 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  dispatch_async(v14, block);

}

- (void)MSASStateMachine:(id)a3 didFindAssetCollectionSyncedState:(id)a4 forAssetCollectionGUID:(id)a5 inAlbum:(id)a6 assetCollectionStateCtag:(id)a7 info:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = a8;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __135__MSASServerSideModel_MSASStateMachine_didFindAssetCollectionSyncedState_forAssetCollectionGUID_inAlbum_assetCollectionStateCtag_info___block_invoke;
  block[3] = &unk_1E95BCE80;
  block[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = v15;
  v25 = v14;
  v17 = v14;
  v18 = v15;
  v19 = v13;
  v20 = v12;
  dispatch_async(v16, block);

}

- (void)MSASStateMachine:(id)a3 didFindAlbumSyncedState:(id)a4 forAlbum:(id)a5 info:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__MSASServerSideModel_MSASStateMachine_didFindAlbumSyncedState_forAlbum_info___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)MSASStateMachine:(id)a3 didFinishCheckingForAlbumSyncedStateChangesInAlbum:(id)a4 info:(id)a5 error:(id)a6 newAlbumStateCtag:(id)a7
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
  _QWORD v23[4];
  id v24;
  MSASServerSideModel *v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __120__MSASServerSideModel_MSASStateMachine_didFinishCheckingForAlbumSyncedStateChangesInAlbum_info_error_newAlbumStateCtag___block_invoke;
  v23[3] = &unk_1E95BC758;
  v24 = v15;
  v25 = self;
  v26 = v13;
  v27 = v16;
  v28 = v14;
  v29 = v12;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  v21 = v13;
  v22 = v15;
  dispatch_async(v17, v23);

}

- (void)MSASStateMachine:(id)a3 didFinishSettingSyncedStateForAlbum:(id)a4 info:(id)a5 error:(id)a6 newAlbumStateCtag:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD block[4];
  id v26;
  MSASServerSideModel *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  MSASServerSideModel *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__MSASServerSideModel_MSASStateMachine_didFinishSettingSyncedStateForAlbum_info_error_newAlbumStateCtag___block_invoke;
  block[3] = &unk_1E95BCE80;
  v16 = v13;
  v26 = v16;
  v27 = self;
  v17 = v11;
  v28 = v17;
  v18 = v14;
  v29 = v18;
  v19 = v12;
  v30 = v19;
  dispatch_async(v15, block);

  if (v16 && (objc_msgSend(v16, "MSASStateMachineIsCanceledError") & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "MSVerboseDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = self;
      v33 = 2114;
      v34 = v17;
      v35 = 2114;
      v36 = v24;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to set synced state for album %{public}@. Error: %{public}@. Requesting latest state.", buf, 0x20u);

    }
    -[MSASServerSideModel stateMachine](self, "stateMachine");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "MSASAddIsErrorRecovery");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "checkForAlbumSyncedStateChangesInAlbums:info:", v21, v23);

  }
}

- (void)MSASStateMachine:(id)a3 didFinishSettingSyncedStateForAssetCollection:(id)a4 inAlbum:(id)a5 assetStateCtag:(id)a6 info:(id)a7 error:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD block[4];
  id v29;
  MSASServerSideModel *v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  MSASServerSideModel *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __120__MSASServerSideModel_MSASStateMachine_didFinishSettingSyncedStateForAssetCollection_inAlbum_assetStateCtag_info_error___block_invoke;
  block[3] = &unk_1E95BCE80;
  v19 = v17;
  v29 = v19;
  v30 = self;
  v20 = v13;
  v31 = v20;
  v21 = v15;
  v32 = v21;
  v22 = v16;
  v33 = v22;
  dispatch_async(v18, block);

  if (v19 && (objc_msgSend(v19, "MSASStateMachineIsCanceledError") & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v19, "MSVerboseDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = self;
      v36 = 2114;
      v37 = v20;
      v38 = 2114;
      v39 = v14;
      v40 = 2114;
      v41 = v27;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to set synced state for asset collection %{public}@ in album %{public}@. Error: %{public}@. Requesting latest state.", buf, 0x2Au);

    }
    -[MSASServerSideModel stateMachine](self, "stateMachine");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "MSASAddIsErrorRecovery");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "checkForAlbumSyncedStateChangesInAlbums:info:", v24, v26);

  }
}

- (id)MSASStateMachineDidRequestAlbumStateCtagForAlbumWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6323;
  v19 = __Block_byref_object_dispose__6324;
  v20 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__MSASServerSideModel_MSASStateMachineDidRequestAlbumStateCtagForAlbumWithGUID_info___block_invoke;
  block[3] = &unk_1E95BC2F0;
  block[4] = self;
  v13 = v6;
  v14 = &v15;
  v9 = v6;
  dispatch_sync(v8, block);

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (id)MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6323;
  v19 = __Block_byref_object_dispose__6324;
  v20 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__MSASServerSideModel_MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID_info___block_invoke;
  block[3] = &unk_1E95BC2F0;
  block[4] = self;
  v13 = v6;
  v14 = &v15;
  v9 = v6;
  dispatch_sync(v8, block);

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (id)MSASStateMachineDidRequestAlbumWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6323;
  v16 = __Block_byref_object_dispose__6324;
  v17 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MSASServerSideModel_MSASStateMachineDidRequestAlbumWithGUID___block_invoke;
  block[3] = &unk_1E95BC2F0;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)MSASStateMachineDidRequestAssetCollectionStateCtagForAssetCollectionWithGUID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6323;
  v19 = __Block_byref_object_dispose__6324;
  v20 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__MSASServerSideModel_MSASStateMachineDidRequestAssetCollectionStateCtagForAssetCollectionWithGUID_info___block_invoke;
  block[3] = &unk_1E95BC2F0;
  block[4] = self;
  v13 = v6;
  v14 = &v15;
  v9 = v6;
  dispatch_sync(v8, block);

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (BOOL)MSASStateMachine:(id)a3 didQueryIsAssetCollectionWithGUIDInModel:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__MSASServerSideModel_MSASStateMachine_didQueryIsAssetCollectionWithGUIDInModel___block_invoke;
  block[3] = &unk_1E95BC2F0;
  v12 = v7;
  v13 = &v14;
  block[4] = self;
  v9 = v7;
  dispatch_sync(v8, block);

  LOBYTE(v7) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)v7;
}

- (void)MSASStateMachine:(id)a3 didFinishDeletingAlbum:(id)a4 info:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__MSASServerSideModel_MSASStateMachine_didFinishDeletingAlbum_info_error___block_invoke;
  block[3] = &unk_1E95BCE58;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_sync(v12, block);

}

- (void)MSASStateMachine:(id)a3 didFinishDeletingAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__MSASServerSideModel_MSASStateMachine_didFinishDeletingAssetCollection_inAlbum_info_error___block_invoke;
  block[3] = &unk_1E95BCE80;
  block[4] = self;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  dispatch_async(v15, block);

}

- (void)MSASStateMachine:(id)a3 didFinishDeletingComment:(id)a4 inAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7 error:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  MSASServerSideModel *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  MSASServerSideModel *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  -[MSASServerSideModel eventQueue](self, "eventQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __102__MSASServerSideModel_MSASStateMachine_didFinishDeletingComment_inAssetCollection_inAlbum_info_error___block_invoke;
  v33 = &unk_1E95BC758;
  v34 = self;
  v19 = v13;
  v35 = v19;
  v20 = v14;
  v36 = v20;
  v21 = v15;
  v37 = v21;
  v22 = v16;
  v38 = v22;
  v23 = v17;
  v39 = v23;
  dispatch_async(v18, &v30);

  if (v23
    && (objc_msgSend(v23, "MSASStateMachineIsCanceledError", v30, v31, v32, v33, v34, v35, v36, v37, v38) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend(v19, "ID");
      objc_msgSend(v20, "GUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "MSVerboseDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v41 = self;
      v42 = 1024;
      v43 = v27;
      v44 = 2114;
      v45 = v28;
      v46 = 2114;
      v47 = v29;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete comment ID %d in asset collection GUID %{public}@. Error: %{public}@. Reset-syncing comments.", buf, 0x26u);

    }
    objc_msgSend(v20, "GUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "MSASAddIsErrorRecovery");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASServerSideModel refreshCommentsForAssetCollectionWithGUID:resetSync:info:](self, "refreshCommentsForAssetCollectionWithGUID:resetSync:info:", v24, 1, v26);

  }
}

- (void)MSASStateMachine:(id)a3 didFinishCreatingAlbum:(id)a4 info:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  MSASServerSideModel *v19;
  id v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__MSASServerSideModel_MSASStateMachine_didFinishCreatingAlbum_info_error___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v17 = v9;
  v18 = v11;
  v19 = self;
  v20 = v10;
  v13 = v10;
  v14 = v11;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)MSASStateMachine:(id)a3 didFinishUpdatingAlbum:(id)a4 info:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASServerSideModel eventQueue](self, "eventQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__MSASServerSideModel_MSASStateMachine_didFinishUpdatingAlbum_info_error___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)MSASStateMachine:(id)a3 didRequestAssetsForAddingAssetCollections:(id)a4 inAlbum:(id)a5 specifications:(id)a6 info:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[MSASServerSideModel eventQueue](self, "eventQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__MSASServerSideModel_MSASStateMachine_didRequestAssetsForAddingAssetCollections_inAlbum_specifications_info___block_invoke;
  block[3] = &unk_1E95BCE80;
  block[4] = self;
  v21 = v11;
  v22 = v13;
  v23 = v14;
  v24 = v12;
  v16 = v12;
  v17 = v14;
  v18 = v13;
  v19 = v11;
  dispatch_async(v15, block);

}

- (void)MSASStateMachine:(id)a3 didFinishAddingAssetCollection:(id)a4 toAlbum:(id)a5 info:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  MSASServerSideModel *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    v17 = (void *)objc_msgSend(v13, "copy");
    -[MSASModelBase dbQueue](self, "dbQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__MSASServerSideModel_MSASStateMachine_didFinishAddingAssetCollection_toAlbum_info_error___block_invoke;
    block[3] = &unk_1E95BCE80;
    block[4] = self;
    v22 = v14;
    v23 = v16;
    v24 = v17;
    v25 = v15;
    v19 = v17;
    dispatch_async(v18, block);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v16, "MSVerboseDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = self;
    v28 = 2114;
    v29 = v20;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to add empty asset collection. Error: %{public}@.", buf, 0x16u);

  }
}

- (void)MSASStateMachine:(id)a3 didFinishAddingSharingRelationships:(id)a4 toOwnedAlbum:(id)a5 info:(id)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  MSASServerSideModel *v34;
  id v35;
  _QWORD block[4];
  id v37;
  MSASServerSideModel *v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  MSASServerSideModel *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[MSASServerSideModel eventQueue](self, "eventQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__MSASServerSideModel_MSASStateMachine_didFinishAddingSharingRelationships_toOwnedAlbum_info_error___block_invoke;
  block[3] = &unk_1E95BCE80;
  v17 = v11;
  v37 = v17;
  v38 = self;
  v18 = v12;
  v39 = v18;
  v19 = v13;
  v40 = v19;
  v20 = v14;
  v41 = v20;
  dispatch_async(v15, block);

  if (v20 && (objc_msgSend(v20, "MSASStateMachineIsCanceledError") & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend(v17, "count");
      objc_msgSend(v20, "MSVerboseDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = self;
      v44 = 2048;
      v45 = v27;
      v46 = 2114;
      v47 = v28;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to add sharing %ld relationships. Error: %{public}@. Deleting and refreshing list.", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "MSASAddIsErrorRecovery");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[MSASModelBase dbQueue](self, "dbQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    v29 = v16;
    v30 = 3221225472;
    v31 = __100__MSASServerSideModel_MSASStateMachine_didFinishAddingSharingRelationships_toOwnedAlbum_info_error___block_invoke_495;
    v32 = &unk_1E95BCE30;
    v33 = v17;
    v34 = self;
    v35 = v22;
    v24 = v22;
    dispatch_async(v23, &v29);

    -[MSASServerSideModel stateMachine](self, "stateMachine", v29, v30, v31, v32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "getAccessControlsForAlbums:info:", v26, v24);

  }
}

- (void)MSASStateMachine:(id)a3 didFinishSendingInvitationByPhone:(id)a4 toOwnedAlbum:(id)a5 info:(id)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[MSASServerSideModel eventQueue](self, "eventQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__MSASServerSideModel_MSASStateMachine_didFinishSendingInvitationByPhone_toOwnedAlbum_info_error___block_invoke;
  block[3] = &unk_1E95BCE80;
  block[4] = self;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  dispatch_async(v15, block);

}

- (void)MSASStateMachine:(id)a3 didFinishRemovingSharingRelationship:(id)a4 fromOwnedAlbum:(id)a5 info:(id)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  MSASServerSideModel *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[MSASServerSideModel eventQueue](self, "eventQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__MSASServerSideModel_MSASStateMachine_didFinishRemovingSharingRelationship_fromOwnedAlbum_info_error___block_invoke;
  block[3] = &unk_1E95BCE80;
  block[4] = self;
  v16 = v11;
  v26 = v16;
  v17 = v12;
  v27 = v17;
  v18 = v13;
  v28 = v18;
  v19 = v14;
  v29 = v19;
  dispatch_async(v15, block);

  if (v19 && (objc_msgSend(v19, "MSASStateMachineIsCanceledError") & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v19, "MSVerboseDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = self;
      v32 = 2112;
      v33 = v16;
      v34 = 2114;
      v35 = v24;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete sharing relationship %@. Error: %{public}@. Reset-syncing ACLs.", buf, 0x20u);

    }
    -[MSASServerSideModel stateMachine](self, "stateMachine");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "MSASAddIsErrorRecovery");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "getAccessControlsForAlbums:info:", v21, v23);

  }
}

- (void)MSASStateMachine:(id)a3 didFinishAddingComment:(id)a4 toAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7 error:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  MSASServerSideModel *v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __100__MSASServerSideModel_MSASStateMachine_didFinishAddingComment_toAssetCollection_inAlbum_info_error___block_invoke;
  v24[3] = &unk_1E95BC758;
  v25 = v17;
  v26 = self;
  v27 = v13;
  v28 = v14;
  v29 = v16;
  v30 = v15;
  v19 = v15;
  v20 = v16;
  v21 = v14;
  v22 = v13;
  v23 = v17;
  dispatch_async(v18, v24);

}

- (BOOL)errorIsCancellation:(id)a3
{
  return objc_msgSend(a3, "MSASStateMachineIsCanceledError");
}

- (MSASStateMachine)MSASCounterpartInstance
{
  return self->_counterpartInstance;
}

- (void)setMSASCounterpartInstance:(id)a3
{
  self->_counterpartInstance = (MSASStateMachine *)a3;
}

- (MSAlbumSharingDaemon)daemon
{
  return (MSAlbumSharingDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (void)setDaemon:(id)a3
{
  objc_storeWeak((id *)&self->_daemon, a3);
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventQueue, a3);
}

- (MSASServerSideModelGroupedCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (void)setCommandQueue:(id)a3
{
  objc_storeStrong((id *)&self->_commandQueue, a3);
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

- (MSASPendingChanges)pendingChanges
{
  return self->_pendingChanges;
}

- (void)setPendingChanges:(id)a3
{
  objc_storeStrong((id *)&self->_pendingChanges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingChanges, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_daemon);
}

void __100__MSASServerSideModel_MSASStateMachine_didFinishAddingComment_toAssetCollection_inAlbum_info_error___block_invoke(id *a1)
{
  id v2;
  int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (!v2)
  {
    v12 = a1[5];
    v13 = a1[6];
    objc_msgSend(a1[7], "GUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dbQueueSetComment:forAssetCollectionWithGUID:info:", v13, v6, a1[8]);
LABEL_8:

    goto LABEL_9;
  }
  v3 = objc_msgSend(v2, "MSContainsErrorWithDomain:code:", CFSTR("MSASProtocolErrorDomain"), 16);
  v4 = a1[4];
  if (v3)
  {
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("album"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("assetCollection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[5], "daemon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1[4];
    objc_msgSend(a1[5], "personID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didReceiveTooManyCommentsError:forAssetCollection:inAlbum:personID:", v10, v8, v6, v11);
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v4, "MSContainsErrorWithDomain:code:", CFSTR("MSASProtocolErrorDomain"), 17))
  {
    objc_msgSend(a1[4], "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("album"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("assetCollection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[5], "daemon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = a1[4];
    objc_msgSend(a1[5], "personID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didReceiveCommentTooLongError:forAssetCollection:inAlbum:personID:", v16, v8, v6, v11);
    goto LABEL_7;
  }
LABEL_9:
  objc_msgSend(a1[5], "eventQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__MSASServerSideModel_MSASStateMachine_didFinishAddingComment_toAssetCollection_inAlbum_info_error___block_invoke_2;
  block[3] = &unk_1E95BC758;
  v19 = a1[6];
  block[4] = a1[5];
  v29 = v19;
  v30 = a1[7];
  v31 = a1[9];
  v32 = a1[8];
  v33 = a1[4];
  dispatch_async(v17, block);

  v20 = a1[4];
  if (v20 && (objc_msgSend(v20, "MSASStateMachineIsCanceledError") & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v23 = a1[5];
      objc_msgSend(a1[6], "GUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "MSVerboseDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v23;
      v36 = 2114;
      v37 = v24;
      v38 = 2114;
      v39 = v25;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to add comment GUID %{public}@. Error: %{public}@. Deleting comment.", buf, 0x20u);

    }
    objc_msgSend(a1[5], "dbQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = __100__MSASServerSideModel_MSASStateMachine_didFinishAddingComment_toAssetCollection_inAlbum_info_error___block_invoke_498;
    v26[3] = &unk_1E95BCFC0;
    v22 = a1[6];
    v26[4] = a1[5];
    v27 = v22;
    dispatch_async(v21, v26);

  }
}

void __100__MSASServerSideModel_MSASStateMachine_didFinishAddingComment_toAssetCollection_inAlbum_info_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __100__MSASServerSideModel_MSASStateMachine_didFinishAddingComment_toAssetCollection_inAlbum_info_error___block_invoke_3;
  v3[3] = &unk_1E95BC7E8;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __100__MSASServerSideModel_MSASStateMachine_didFinishAddingComment_toAssetCollection_inAlbum_info_error___block_invoke_498(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "GUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsErrorRecovery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dbQueueDeleteCommentWithGUID:info:", v4, v3);

}

void __100__MSASServerSideModel_MSASStateMachine_didFinishAddingComment_toAssetCollection_inAlbum_info_error___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFinishAddingComment:toAssetCollection:inAlbum:info:error:", a1[4], a1[5], a1[6], a1[7], a1[8], a1[9]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFinishAddingComment:toAssetCollection:inAlbum:error:", a1[4], a1[5], a1[6], a1[7], a1[9]);

}

void __103__MSASServerSideModel_MSASStateMachine_didFinishRemovingSharingRelationship_fromOwnedAlbum_info_error___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __103__MSASServerSideModel_MSASStateMachine_didFinishRemovingSharingRelationship_fromOwnedAlbum_info_error___block_invoke_2;
  v3[3] = &unk_1E95BCDE8;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __103__MSASServerSideModel_MSASStateMachine_didFinishRemovingSharingRelationship_fromOwnedAlbum_info_error___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFinishRemovingAccessControlEntry:fromAlbum:info:error:", a1[4], a1[5], a1[6], a1[7], a1[8]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFinishRemovingAccessControlEntry:fromAlbum:error:", a1[4], a1[5], a1[6], a1[8]);

}

void __98__MSASServerSideModel_MSASStateMachine_didFinishSendingInvitationByPhone_toOwnedAlbum_info_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v2 = (void *)MEMORY[0x1D8255C20]();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __98__MSASServerSideModel_MSASStateMachine_didFinishSendingInvitationByPhone_toOwnedAlbum_info_error___block_invoke_2;
  v4[3] = &unk_1E95BCDE8;
  v3 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  objc_msgSend(v5, "eventQueuePerformBlockOnObservers:", v4);

  objc_autoreleasePoolPop(v2);
}

void __98__MSASServerSideModel_MSASStateMachine_didFinishSendingInvitationByPhone_toOwnedAlbum_info_error___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFinishSendingInvitationByPhone:toAlbum:info:error:", a1[4], a1[5], a1[6], a1[7], a1[8]);

}

void __100__MSASServerSideModel_MSASStateMachine_didFinishAddingSharingRelationships_toOwnedAlbum_info_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;
  _QWORD v12[4];
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v19;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1D8255C20]();
        v12[0] = v5;
        v12[1] = 3221225472;
        v12[2] = __100__MSASServerSideModel_MSASStateMachine_didFinishAddingSharingRelationships_toOwnedAlbum_info_error___block_invoke_2;
        v12[3] = &unk_1E95BCDE8;
        v9 = *(void **)(a1 + 48);
        v13 = *(void **)(a1 + 40);
        v10 = v13;
        v14 = v7;
        v15 = v9;
        v16 = *(id *)(a1 + 56);
        v17 = *(id *)(a1 + 64);
        objc_msgSend(v10, "eventQueuePerformBlockOnObservers:", v12);

        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v3);
  }

}

void __100__MSASServerSideModel_MSASStateMachine_didFinishAddingSharingRelationships_toOwnedAlbum_info_error___block_invoke_495(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1D8255C20](v3);
        v9 = *(void **)(a1 + 40);
        objc_msgSend(v7, "GUID", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dbQueueDeleteAccessControlWithGUID:info:", v10, *(_QWORD *)(a1 + 48));

        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v4 = v3;
    }
    while (v3);
  }

}

void __100__MSASServerSideModel_MSASStateMachine_didFinishAddingSharingRelationships_toOwnedAlbum_info_error___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFinishAddingAccessControlEntry:toAlbum:info:error:", a1[4], a1[5], a1[6], a1[7], a1[8]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFinishAddingAccessControlEntry:toAlbum:error:", a1[4], a1[5], a1[6], a1[8]);

}

void __90__MSASServerSideModel_MSASStateMachine_didFinishAddingAssetCollection_toAlbum_info_error___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  _QWORD block[5];
  id v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  objc_msgSend(a1[5], "GUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dbQueueLookupOrCreateAlbumWithGUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = a1[6];
  if (v5)
  {
    if (objc_msgSend(v5, "MSContainsErrorWithDomain:code:", CFSTR("MSASProtocolErrorDomain"), 14))
    {
      objc_msgSend(a1[4], "daemon");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = a1[6];
      objc_msgSend(a1[4], "personID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "didReceiveTooManyPhotosError:forAlbum:personID:", v7, v4, v8);

    }
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
    v36 = 0u;
    v35 = 0u;
    objc_msgSend(a1[7], "assets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v36;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v13++), "setPath:", 0);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v11);
    }

    objc_msgSend(a1[5], "GUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "setAlbumGUID:", v14);

    v15 = a1[7];
    v16 = a1[4];
    objc_msgSend(a1[5], "GUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dbQueueSetAssetCollection:inAlbumWithGUID:info:", v15, v17, a1[8]);

  }
  objc_msgSend(a1[4], "eventQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__MSASServerSideModel_MSASStateMachine_didFinishAddingAssetCollection_toAlbum_info_error___block_invoke_2;
  block[3] = &unk_1E95BCE80;
  block[4] = a1[4];
  v31 = a1[7];
  v20 = v4;
  v32 = v20;
  v33 = a1[8];
  v34 = a1[6];
  dispatch_async(v18, block);

  v21 = a1[6];
  if (v21 && (objc_msgSend(v21, "MSASStateMachineIsCanceledError") & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v25 = a1[4];
      v26 = a1[7];
      objc_msgSend(a1[6], "MSVerboseDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v25;
      v41 = 2114;
      v42 = v26;
      v43 = 2114;
      v44 = v27;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to add asset collection %{public}@. Error: %{public}@. Deleting asset collection and cancelling pending commands.", buf, 0x20u);

    }
    objc_msgSend(a1[4], "dbQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    v28[0] = v19;
    v28[1] = 3221225472;
    v28[2] = __90__MSASServerSideModel_MSASStateMachine_didFinishAddingAssetCollection_toAlbum_info_error___block_invoke_490;
    v28[3] = &unk_1E95BCFC0;
    v28[4] = a1[4];
    v29 = a1[7];
    dispatch_async(v22, v28);

    objc_msgSend(a1[4], "stateMachine");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "GUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "cancelOutstandingCommandsForAssetCollectionWithGUID:", v24);

  }
}

void __90__MSASServerSideModel_MSASStateMachine_didFinishAddingAssetCollection_toAlbum_info_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __90__MSASServerSideModel_MSASStateMachine_didFinishAddingAssetCollection_toAlbum_info_error___block_invoke_3;
  v3[3] = &unk_1E95BCDE8;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __90__MSASServerSideModel_MSASStateMachine_didFinishAddingAssetCollection_toAlbum_info_error___block_invoke_490(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "GUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsErrorRecovery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteAssetCollectionWithGUID:info:", v4, v3);

}

void __90__MSASServerSideModel_MSASStateMachine_didFinishAddingAssetCollection_toAlbum_info_error___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)a1[4];
    v4 = a1[5];
    v5 = a1[6];
    v6 = a1[7];
    objc_msgSend(v3, "_protocolErrorForUnderlyingError:", a1[8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "MSASModel:didFinishAddingAssetCollection:toAlbum:info:error:", v3, v4, v5, v6, v7);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)a1[4];
    v9 = a1[5];
    v10 = a1[6];
    objc_msgSend(v8, "_protocolErrorForUnderlyingError:", a1[8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "MSASModel:didFinishAddingAssetCollection:toAlbum:error:", v8, v9, v10, v11);

  }
}

void __110__MSASServerSideModel_MSASStateMachine_didRequestAssetsForAddingAssetCollections_inAlbum_specifications_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __110__MSASServerSideModel_MSASStateMachine_didRequestAssetsForAddingAssetCollections_inAlbum_specifications_info___block_invoke_2;
  v8 = &unk_1E95BC860;
  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v14 = &v15;
  v9 = v3;
  v10 = v2;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  objc_msgSend(v3, "eventQueuePerformBlockOnObservers:", &v5);
  if (!*((_BYTE *)v16 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "stateMachine", v5, v6, v7, v8, v9, v10, v11, v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "continueAddingAssetCollections:skipAssetCollections:toAlbum:info:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));

  }
  _Block_object_dispose(&v15, 8);
}

void __110__MSASServerSideModel_MSASStateMachine_didRequestAssetsForAddingAssetCollections_inAlbum_specifications_info___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_opt_respondsToSelector();
  v5 = MEMORY[0x1E0C809B0];
  if ((v4 & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = objc_msgSend(*(id *)(a1 + 40), "count");
      *(_DWORD *)buf = 138543618;
      v34 = v7;
      v35 = 2048;
      v36 = v8;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Requesting derivatives for %ld photos.", buf, 0x16u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v34 = v22;
      v35 = 2114;
      v36 = v23;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Specs: %{public}@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "daemon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "retainBusy");

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    v30[0] = v5;
    v30[1] = 3221225472;
    v30[2] = __110__MSASServerSideModel_MSASStateMachine_didRequestAssetsForAddingAssetCollections_inAlbum_specifications_info___block_invoke_480;
    v30[3] = &unk_1E95BC810;
    v30[4] = v10;
    v31 = v6;
    v32 = *(id *)(a1 + 64);
    v14 = v6;
    objc_msgSend(v3, "MSASModel:didRequestDerivativesForAssetCollections:specifications:info:completionBlock:", v10, v11, v12, v13, v30);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = objc_msgSend(*(id *)(a1 + 40), "count");
      *(_DWORD *)buf = 138543618;
      v34 = v16;
      v35 = 2048;
      v36 = v17;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Requesting derivatives for %ld photos.", buf, 0x16u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v34 = v24;
      v35 = 2114;
      v36 = v25;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Specs: %{public}@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "daemon");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "retainBusy");

    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(_QWORD *)(a1 + 40);
    v26[0] = v5;
    v26[1] = 3221225472;
    v26[2] = __110__MSASServerSideModel_MSASStateMachine_didRequestAssetsForAddingAssetCollections_inAlbum_specifications_info___block_invoke_484;
    v26[3] = &unk_1E95BC838;
    v26[4] = v19;
    v27 = v15;
    v28 = *(id *)(a1 + 64);
    v29 = *(id *)(a1 + 56);
    v21 = v15;
    objc_msgSend(v3, "MSASModel:didRequestDerivativesForAssetCollections:specifications:completionBlock:", v19, v20, 0, v26);

  }
}

void __110__MSASServerSideModel_MSASStateMachine_didRequestAssetsForAddingAssetCollections_inAlbum_specifications_info___block_invoke_480(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v19 = 138543874;
    v20 = v10;
    v21 = 2048;
    v22 = objc_msgSend(v7, "count");
    v23 = 2048;
    v24 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Received derivatives for %ld photos, and received rejections for %ld photos.", (uint8_t *)&v19, 0x20u);
  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v13 = v12;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = objc_msgSend(v7, "count");
      v18 = objc_msgSend(v7, "count");
      v19 = 138544130;
      v20 = v16;
      v21 = 2048;
      v22 = v17;
      v23 = 2048;
      v24 = *(_QWORD *)&v13;
      v25 = 2048;
      v26 = v13 / (double)v18;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Computing derivatives for %ld photos took %.2f seconds, or %.2f per photo.", (uint8_t *)&v19, 0x2Au);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "continueAddingAssetCollections:skipAssetCollections:toAlbum:info:", v7, v8, *(_QWORD *)(a1 + 48), v9);

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "releaseBusy");

}

void __110__MSASServerSideModel_MSASStateMachine_didRequestAssetsForAddingAssetCollections_inAlbum_specifications_info___block_invoke_484(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v16 = 138543874;
    v17 = v7;
    v18 = 2048;
    v19 = objc_msgSend(v5, "count");
    v20 = 2048;
    v21 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Received derivatives for %ld photos, and received rejections for %ld photos.", (uint8_t *)&v16, 0x20u);
  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v10 = v9;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = objc_msgSend(v5, "count");
      v15 = objc_msgSend(v5, "count");
      v16 = 138544130;
      v17 = v13;
      v18 = 2048;
      v19 = v14;
      v20 = 2048;
      v21 = *(_QWORD *)&v10;
      v22 = 2048;
      v23 = v10 / (double)v15;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Computing derivatives for %ld photos took %.2f seconds, or %.2f per photo.", (uint8_t *)&v16, 0x2Au);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "continueAddingAssetCollections:skipAssetCollections:toAlbum:info:", v5, v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "releaseBusy");

}

void __74__MSASServerSideModel_MSASStateMachine_didFinishUpdatingAlbum_info_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD *, void *);
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __74__MSASServerSideModel_MSASStateMachine_didFinishUpdatingAlbum_info_error___block_invoke_2;
  v14 = &unk_1E95BCD70;
  v2 = *(void **)(a1 + 40);
  v15 = *(id *)(a1 + 32);
  v16 = v2;
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  objc_msgSend(v15, "eventQueuePerformBlockOnObservers:", &v11);
  v3 = *(void **)(a1 + 56);
  if (v3 && (objc_msgSend(v3, "MSASStateMachineIsCanceledError", v11, v12, v13, v14, v15, v16, v17) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 56), "MSVerboseDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v8;
      v21 = 2114;
      v22 = v9;
      v23 = 2114;
      v24 = v10;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to update album %{public}@. Error: %{public}@. Re-reading album metadata.", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "stateMachine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "MSASAddIsErrorRecovery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "checkForUpdatesInAlbums:resetSync:info:", v5, 0, v7);

  }
}

void __74__MSASServerSideModel_MSASStateMachine_didFinishUpdatingAlbum_info_error___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)a1[4];
    v4 = a1[5];
    v5 = a1[6];
    objc_msgSend(v3, "_protocolErrorForUnderlyingError:", a1[7]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishModifyingAlbumMetadata:info:error:", v3, v4, v5, v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)a1[4];
    v8 = a1[5];
    objc_msgSend(v7, "_protocolErrorForUnderlyingError:", a1[7]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishModifyingAlbumMetadata:error:", v7, v8, v9);

  }
}

void __74__MSASServerSideModel_MSASStateMachine_didFinishCreatingAlbum_info_error___block_invoke(id *a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = a1[5];
  if (v3)
  {
    if (objc_msgSend(v3, "MSContainsErrorWithDomain:code:", CFSTR("MSASProtocolErrorDomain"), 13))
    {
      objc_msgSend(a1[6], "daemon");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = a1[5];
      objc_msgSend(a1[6], "personID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "didReceiveTooManyAlbumsError:personID:", v5, v6);

    }
  }
  else
  {
    v7 = a1[6];
    objc_msgSend(a1[4], "GUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dbQueueLookupOrCreateAlbumWithGUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "ctag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCtag:", v10);

    objc_msgSend(a1[6], "dbQueueSetAlbum:info:", v9, a1[7]);
    v2 = v9;
  }
  objc_msgSend(a1[6], "eventQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__MSASServerSideModel_MSASStateMachine_didFinishCreatingAlbum_info_error___block_invoke_2;
  block[3] = &unk_1E95BCE58;
  block[4] = a1[6];
  v13 = v2;
  v28 = v13;
  v29 = a1[7];
  v30 = a1[5];
  dispatch_async(v11, block);

  v14 = a1[5];
  if (v14 && (objc_msgSend(v14, "MSASStateMachineIsCanceledError") & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = a1[6];
      v19 = a1[4];
      objc_msgSend(a1[5], "MSVerboseDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v18;
      v33 = 2114;
      v34 = v19;
      v35 = 2114;
      v36 = v20;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to create album %{public}@. Error: %{public}@.", buf, 0x20u);

    }
    objc_msgSend(a1[6], "dbQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v21 = v12;
    v22 = 3221225472;
    v23 = __74__MSASServerSideModel_MSASStateMachine_didFinishCreatingAlbum_info_error___block_invoke_473;
    v24 = &unk_1E95BCFC0;
    v25 = a1[6];
    v26 = a1[4];
    dispatch_async(v15, &v21);

    objc_msgSend(a1[6], "stateMachine", v21, v22, v23, v24, v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "GUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cancelOutstandingCommandsForAlbumWithGUID:", v17);

  }
}

void __74__MSASServerSideModel_MSASStateMachine_didFinishCreatingAlbum_info_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__MSASServerSideModel_MSASStateMachine_didFinishCreatingAlbum_info_error___block_invoke_3;
  v3[3] = &unk_1E95BCD70;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __74__MSASServerSideModel_MSASStateMachine_didFinishCreatingAlbum_info_error___block_invoke_473(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "GUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsErrorRecovery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dbQueueDeleteAlbumWithGUID:info:", v4, v3);

}

void __74__MSASServerSideModel_MSASStateMachine_didFinishCreatingAlbum_info_error___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)a1[4];
    v4 = a1[5];
    v5 = a1[6];
    objc_msgSend(v3, "_protocolErrorForUnderlyingError:", a1[7]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishAddingAlbum:info:error:", v3, v4, v5, v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)a1[4];
    v8 = a1[5];
    objc_msgSend(v7, "_protocolErrorForUnderlyingError:", a1[7]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishAddingAlbum:error:", v7, v8, v9);

  }
}

void __102__MSASServerSideModel_MSASStateMachine_didFinishDeletingComment_inAssetCollection_inAlbum_info_error___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __102__MSASServerSideModel_MSASStateMachine_didFinishDeletingComment_inAssetCollection_inAlbum_info_error___block_invoke_2;
  v3[3] = &unk_1E95BC7E8;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __102__MSASServerSideModel_MSASStateMachine_didFinishDeletingComment_inAssetCollection_inAlbum_info_error___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFinishDeletingComment:fromAssetCollection:inAlbum:info:error:", a1[4], a1[5], a1[6], a1[7], a1[8], a1[9]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFinishDeletingComment:fromAssetCollection:inAlbum:error:", a1[4], a1[5], a1[6], a1[7], a1[9]);

}

void __92__MSASServerSideModel_MSASStateMachine_didFinishDeletingAssetCollection_inAlbum_info_error___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  objc_msgSend(a1[5], "GUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dbQueueLookupOrCreateAssetCollectionWithGUID:outAlbum:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "eventQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__MSASServerSideModel_MSASStateMachine_didFinishDeletingAssetCollection_inAlbum_info_error___block_invoke_2;
  block[3] = &unk_1E95BCE80;
  block[4] = a1[4];
  v6 = v4;
  v16 = v6;
  v17 = a1[6];
  v18 = a1[7];
  v19 = a1[8];
  dispatch_async(v5, block);

  v7 = a1[8];
  if (v7 && (objc_msgSend(v7, "MSASStateMachineIsCanceledError") & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v12 = a1[4];
      v13 = a1[5];
      objc_msgSend(a1[8], "MSVerboseDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v12;
      v22 = 2114;
      v23 = v13;
      v24 = 2114;
      v25 = v14;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete asset collection %{public}@. Error: %{public}@. Reset-syncing album.", buf, 0x20u);

    }
    v8 = a1[4];
    objc_msgSend(a1[6], "GUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASAddIsErrorRecovery");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "refreshContentOfAlbumWithGUID:resetSync:info:", v9, 1, v11);

  }
}

void __92__MSASServerSideModel_MSASStateMachine_didFinishDeletingAssetCollection_inAlbum_info_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __92__MSASServerSideModel_MSASStateMachine_didFinishDeletingAssetCollection_inAlbum_info_error___block_invoke_3;
  v3[3] = &unk_1E95BCDE8;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __92__MSASServerSideModel_MSASStateMachine_didFinishDeletingAssetCollection_inAlbum_info_error___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)a1[4];
    v4 = a1[5];
    v5 = a1[6];
    v6 = a1[7];
    objc_msgSend(v3, "_protocolErrorForUnderlyingError:", a1[8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "MSASModel:didFinishDeletingAssetCollection:fromAlbum:info:error:", v3, v4, v5, v6, v7);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)a1[4];
    v9 = a1[5];
    v10 = a1[6];
    objc_msgSend(v8, "_protocolErrorForUnderlyingError:", a1[8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "MSASModel:didFinishDeletingAssetCollection:fromAlbum:error:", v8, v9, v10, v11);

  }
}

void __74__MSASServerSideModel_MSASStateMachine_didFinishDeletingAlbum_info_error___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  objc_msgSend(a1[5], "GUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dbQueueLookupOrCreateAlbumWithGUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "eventQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __74__MSASServerSideModel_MSASStateMachine_didFinishDeletingAlbum_info_error___block_invoke_2;
  v17 = &unk_1E95BCE58;
  v18 = a1[4];
  v6 = v4;
  v19 = v6;
  v20 = a1[6];
  v21 = a1[7];
  dispatch_async(v5, &v14);

  v7 = a1[7];
  if (v7 && (objc_msgSend(v7, "MSASStateMachineIsCanceledError", v14, v15, v16, v17, v18, v19, v20) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = a1[4];
      v12 = a1[5];
      objc_msgSend(a1[7], "MSVerboseDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v11;
      v24 = 2114;
      v25 = v12;
      v26 = 2114;
      v27 = v13;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete album %{public}@. Error: %{public}@. Reset-syncing album list.", buf, 0x20u);

    }
    v8 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "MSASAddIsErrorRecovery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "refreshResetSync:info:", 1, v10);

  }
}

void __74__MSASServerSideModel_MSASStateMachine_didFinishDeletingAlbum_info_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__MSASServerSideModel_MSASStateMachine_didFinishDeletingAlbum_info_error___block_invoke_3;
  v3[3] = &unk_1E95BCD70;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __74__MSASServerSideModel_MSASStateMachine_didFinishDeletingAlbum_info_error___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)a1[4];
    v4 = a1[5];
    v5 = a1[6];
    objc_msgSend(v3, "_protocolErrorForUnderlyingError:", a1[7]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishDeletingAlbum:info:error:", v3, v4, v5, v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)a1[4];
    v8 = a1[5];
    objc_msgSend(v7, "_protocolErrorForUnderlyingError:", a1[7]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishDeletingAlbum:error:", v7, v8, v9);

  }
}

uint64_t __81__MSASServerSideModel_MSASStateMachine_didQueryIsAssetCollectionWithGUIDInModel___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", *(_QWORD *)(a1 + 40), 0, 0, 0, 0, 0, 0, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __105__MSASServerSideModel_MSASStateMachineDidRequestAssetCollectionStateCtagForAssetCollectionWithGUID_info___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "dbQueueAssetCollectionMetadataWithAssetCollectionGUID:key:outValue:", v1, CFSTR("stateCtag"), &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

void __63__MSASServerSideModel_MSASStateMachineDidRequestAlbumWithGUID___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v1, &obj, 0, 0, 0, 0, 0);
  objc_storeStrong((id *)(v3 + 40), obj);
}

void __85__MSASServerSideModel_MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID_info___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v1, 0, 0, 0, 0, &obj, 0);
  objc_storeStrong((id *)(v3 + 40), obj);
}

void __85__MSASServerSideModel_MSASStateMachineDidRequestAlbumStateCtagForAlbumWithGUID_info___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "dbQueueAlbumMetadataWithAlbumGUID:key:outValue:", v1, CFSTR("stateCtag"), &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

void __120__MSASServerSideModel_MSASStateMachine_didFinishSettingSyncedStateForAssetCollection_inAlbum_assetStateCtag_info_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (!*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "GUID");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dbQueueSetAssetCollectionMetadataAssetCollectionGUID:key:value:info:", v3, CFSTR("stateCtag"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
}

void __105__MSASServerSideModel_MSASStateMachine_didFinishSettingSyncedStateForAlbum_info_error_newAlbumStateCtag___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (!*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "GUID");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dbQueueSetAlbumMetadataAlbumGUID:key:value:info:", v3, CFSTR("stateCtag"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
}

void __120__MSASServerSideModel_MSASStateMachine_didFinishCheckingForAlbumSyncedStateChangesInAlbum_info_error_newAlbumStateCtag___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "GUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dbQueueSetAlbumMetadataAlbumGUID:key:value:info:", v3, CFSTR("stateCtag"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
  objc_msgSend(*(id *)(a1 + 40), "pendingChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "GUID");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removePendingKeyValueChangesForAlbumGUID:", v5);

  objc_msgSend(*(id *)(a1 + 40), "pendingChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "hasPendingChanges");

  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543362;
      v9 = v7;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Finished checking album synced state", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "MSASStateMachine:didFinishCheckingForChangesInfo:error:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
  }
}

void __78__MSASServerSideModel_MSASStateMachine_didFindAlbumSyncedState_forAlbum_info___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dbQueueBeginTransaction");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1D8255C20](v3);
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v7, (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 48), "GUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dbQueueSetAlbumMetadataAlbumGUID:key:value:info:", v11, v7, v9, *(_QWORD *)(a1 + 56));

        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v4 = v3;
    }
    while (v3);
  }

  objc_msgSend(*(id *)(a1 + 32), "dbQueueEndTransaction");
  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "GUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dbQueueCheckToClearUnviewedStateOnAlbumWithGUID:info:", v13, *(_QWORD *)(a1 + 56));

}

uint64_t __135__MSASServerSideModel_MSASStateMachine_didFindAssetCollectionSyncedState_forAssetCollectionGUID_inAlbum_assetCollectionStateCtag_info___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dbQueueBeginTransaction");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1D8255C20](v3);
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v7, (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "dbQueueSetAssetCollectionMetadataAssetCollectionGUID:key:value:info:", *(_QWORD *)(a1 + 48), v7, v9, *(_QWORD *)(a1 + 56));

        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v4 = v3;
    }
    while (v3);
  }

  objc_msgSend(*(id *)(a1 + 32), "dbQueueEndTransaction");
  objc_msgSend(*(id *)(a1 + 32), "dbQueueSetAssetCollectionMetadataAssetCollectionGUID:key:value:info:", *(_QWORD *)(a1 + 48), CFSTR("stateCtag"), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueCheckToClearUnviewedStateOnAssetCollectionWithGUID:info:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __128__MSASServerSideModel_MSASStateMachine_didFinishCheckingForCommentChangesInAssetCollectionWithGUID_largestCommentID_info_error___block_invoke(uint64_t a1)
{
  id v2;

  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), *(unsigned int *)(a1 + 64));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "dbQueueSetAssetCollectionMetadataAssetCollectionGUID:key:value:info:", *(_QWORD *)(a1 + 48), CFSTR("largestCommentID"), v2, *(_QWORD *)(a1 + 56));

  }
}

void __109__MSASServerSideModel_MSASStateMachine_didFindCommentChanges_inAssetCollectionWithGUID_inAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  int v15;
  id v16;
  id v17;
  int v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  int v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  int v47;
  char v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  void *v53;
  void *v54;
  int v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  int v61;
  char v62;
  id v63;
  int v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v79 = 0;
  v4 = objc_msgSend(v2, "dbQueueAssetCollectionMetadataWithAssetCollectionGUID:key:outValue:", v3, CFSTR("lastcommentposition"), &v79);
  v5 = v79;
  v6 = v5;
  if (v4)
    v61 = objc_msgSend(v5, "intValue");
  else
    v61 = -1;
  v64 = objc_msgSend(*(id *)(a1 + 32), "dbQueueAssetCollectionContainsCommentsFromMeAssetCollectionGUID:", *(_QWORD *)(a1 + 40));
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v77 = 0;
  v78 = 0;
  v76 = 0;
  v9 = objc_msgSend(v7, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v8, &v78, 0, &v77, &v76, 0, 0);
  v10 = v78;
  v11 = v77;
  v12 = v76;
  if (v9)
  {
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 48);
    v75 = 0;
    v15 = objc_msgSend(v13, "dbQueueAlbumMetadataWithAlbumGUID:key:outValue:", v14, CFSTR("lastviewedctag"), &v75);
    v16 = v75;
    if (v15)
    {
      if (objc_msgSend(v10, "useForeignCtag"))
        v17 = v12;
      else
        v17 = v11;
      v18 = 1;
      if (v16 && v17)
        v18 = objc_msgSend(v16, "isEqualToString:") ^ 1;
    }
    else
    {
      v18 = 1;
    }

  }
  else
  {
    v18 = 1;
  }
  v19 = (void *)objc_msgSend(*(id *)(a1 + 56), "mutableCopy");
  objc_msgSend(v19, "sortUsingComparator:", &__block_literal_global_464);
  objc_msgSend(*(id *)(a1 + 32), "beginTransaction");
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
  if (!v21)
  {

    goto LABEL_49;
  }
  v22 = v21;
  v55 = v18;
  v56 = v12;
  v57 = v10;
  v58 = v11;
  v59 = v6;
  v62 = 0;
  v23 = *(_QWORD *)v72;
  v63 = v20;
  do
  {
    for (i = 0; i != v22; ++i)
    {
      if (*(_QWORD *)v72 != v23)
        objc_enumerationMutation(v20);
      v25 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
      v26 = (void *)MEMORY[0x1D8255C20]();
      if (!objc_msgSend(v25, "type"))
      {
        objc_msgSend(v25, "comment");
        v32 = (id)objc_claimAutoreleasedReturnValue();
        v33 = *(void **)(a1 + 32);
        v34 = objc_msgSend(v32, "ID");
        v35 = *(_QWORD *)(a1 + 40);
        v70 = 0;
        LODWORD(v33) = objc_msgSend(v33, "dbQueueCommentWithID:assetCollectionGUID:outObject:outGUID:outTimestamp:outIsCaption:outUserInfoData:", v34, v35, &v70, 0, 0, 0, 0);
        v36 = v70;
        v37 = v36;
        if ((_DWORD)v33)
        {
          objc_msgSend(v36, "GUID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setGUID:", v38);

        }
        if ((objc_msgSend(v32, "isMine") & 1) != 0 || (int)objc_msgSend(v32, "ID") <= v61)
        {
          v48 = 0;
        }
        else
        {
          v39 = *(void **)(a1 + 32);
          v40 = *(_QWORD *)(a1 + 40);
          v68 = 0;
          v69 = 0;
          v41 = objc_msgSend(v39, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v40, &v69, 0, &v68, 0, 0, 0, 0);
          v42 = v69;
          v43 = v68;
          v44 = v43;
          if (v41)
          {
            v45 = *(void **)(a1 + 32);
            v67 = 0;
            v46 = v44;
            v47 = objc_msgSend(v45, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v44, &v67, 0, 0, 0, 0, 0);
            v60 = v67;
            if (v47)
              v47 = (objc_msgSend(v32, "isLike") ^ 1) & v64;
            v48 = objc_msgSend(v42, "isMine") | v47;

          }
          else
          {
            v46 = v43;
            v48 = 0;
          }

        }
        objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 64));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v48 & 1) != 0)
        {
          v62 = 1;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setObject:forKey:", v54, CFSTR("notInteresting"));

        }
        objc_msgSend(*(id *)(a1 + 32), "dbQueueSetComment:forAssetCollectionWithGUID:info:", v32, *(_QWORD *)(a1 + 40), v53);
        v64 |= objc_msgSend(v32, "isMine");

        v20 = v63;
        goto LABEL_42;
      }
      if (objc_msgSend(v25, "type") == 1)
      {
        v27 = *(void **)(a1 + 32);
        objc_msgSend(v25, "comment");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "ID");
        v30 = *(_QWORD *)(a1 + 40);
        v66 = 0;
        v31 = objc_msgSend(v27, "dbQueueCommentWithID:assetCollectionGUID:outObject:outGUID:outTimestamp:outIsCaption:outUserInfoData:", v29, v30, 0, &v66, 0, 0, 0);
        v32 = v66;

        if (!v31)
          goto LABEL_42;
LABEL_34:
        objc_msgSend(*(id *)(a1 + 32), "dbQueueDeleteCommentWithGUID:info:", v32, *(_QWORD *)(a1 + 64));
        goto LABEL_42;
      }
      if (objc_msgSend(v25, "type") != 2)
        goto LABEL_43;
      v49 = *(void **)(a1 + 32);
      v50 = objc_msgSend(v25, "deletionIndex");
      v51 = *(_QWORD *)(a1 + 40);
      v65 = 0;
      v52 = objc_msgSend(v49, "dbQueueCommentWithID:assetCollectionGUID:outObject:outGUID:outTimestamp:outIsCaption:outUserInfoData:", v50, v51, 0, &v65, 0, 0, 0);
      v32 = v65;
      if (v52)
        goto LABEL_34;
LABEL_42:

LABEL_43:
      objc_autoreleasePoolPop(v26);
    }
    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
  }
  while (v22);

  v11 = v58;
  v6 = v59;
  v12 = v56;
  v10 = v57;
  if ((v62 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "dbQueueSetUnviewedState:onAssetCollectionWithGUID:info:", 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
    if (v55)
      objc_msgSend(*(id *)(a1 + 32), "dbQueueSetUnviewedState:onAlbumWithGUID:info:", 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
LABEL_49:
  objc_msgSend(*(id *)(a1 + 32), "endTransaction");

}

uint64_t __109__MSASServerSideModel_MSASStateMachine_didFindCommentChanges_inAssetCollectionWithGUID_inAlbumWithGUID_info___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "comment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "ID");
  objc_msgSend(v5, "comment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ID");

  if (v7 >= v9)
  {
    objc_msgSend(v4, "comment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "ID");
    objc_msgSend(v5, "comment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12 > (int)objc_msgSend(v13, "ID");

  }
  else
  {
    v10 = -1;
  }

  return v10;
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke(id *a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  id *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[4];
  _QWORD v17[2];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  objc_msgSend(a1[5], "GUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v3, 0, 0, 0, 0, 0, 0);

  if ((_DWORD)v2)
  {
    objc_msgSend(a1[4], "eventQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke_2;
    block[3] = &unk_1E95BCE58;
    v5 = (id *)v17;
    v6 = a1[6];
    v7 = a1[4];
    v8 = a1[5];
    v17[0] = v6;
    v17[1] = v7;
    v18 = v8;
    v19 = a1[7];
    dispatch_async(v4, block);

LABEL_3:
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = a1[4];
    objc_msgSend(a1[6], "GUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "GUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v11;
    v22 = 2114;
    v23 = v12;
    v24 = 2114;
    v25 = v13;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Downloaded asset GUID %{public}@ for an album GUID %{public}@ that no lenger exists. Ignoring.", buf, 0x20u);

  }
  if (!a1[7])
  {
    objc_msgSend(a1[6], "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(a1[4], "eventQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke_462;
      v14[3] = &unk_1E95BCED0;
      v5 = &v15;
      v15 = a1[6];
      dispatch_async(v10, v14);

      goto LABEL_3;
    }
  }
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  objc_msgSend(a1[4], "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke_3;
  v9[3] = &unk_1E95BCD70;
  v5 = a1[4];
  v10 = a1[5];
  v11 = v5;
  v12 = a1[6];
  v13 = a1[7];
  objc_msgSend(v10, "eventQueuePerformBlockOnObservers:", v9);
  if (!a1[7] && v3)
  {
    objc_msgSend(a1[5], "eventQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke_4;
    block[3] = &unk_1E95BCED0;
    v8 = v3;
    dispatch_async(v6, block);

  }
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke_462(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v2, 0);

}

void __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke_3(uint64_t *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = a1[6];
    if (a1[7])
    {
      objc_msgSend((id)a1[4], "_protocolErrorForUnderlyingError:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "MSASModel:didFinishRetrievingAsset:inAlbum:error:", v3, v4, v5, v6);

    }
    else
    {
      objc_msgSend(v7, "MSASModel:didFinishRetrievingAsset:inAlbum:error:", a1[4], a1[5], a1[6], 0);
    }
  }

}

void __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtPath:error:", *(_QWORD *)(a1 + 32), 0);

}

void __93__MSASServerSideModel_MSASStateMachine_didFinishEnqueueingAssetsForDownload_inAlbumWithGUID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFinishEnqueueingAssetsForDownload:inAlbumWithGUID:", a1[4], a1[5], a1[6]);

}

void __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int8x16_t v18;
  int8x16_t v19;
  _QWORD block[4];
  int8x16_t v21;
  id v22;
  id v23;
  _QWORD v24[4];
  int8x16_t v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    objc_msgSend(a1[6], "eventQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_6;
    block[3] = &unk_1E95BCE58;
    v18 = *(int8x16_t *)(a1 + 5);
    v3 = (id)v18.i64[0];
    v21 = vextq_s8(v18, v18, 8uLL);
    v22 = a1[7];
    v23 = a1[4];
    dispatch_async(v2, block);

    if ((objc_msgSend(a1[4], "MSASStateMachineIsCanceledError") & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v15 = a1[6];
        objc_msgSend(a1[5], "GUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "MSVerboseDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v15;
        v35 = 2114;
        v36 = v16;
        v37 = 2114;
        v38 = v17;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to unsubscribe from album GUID %{public}@. Error: %{public}@. Reset-syncing albums.", buf, 0x20u);

      }
      objc_msgSend(a1[6], "refreshResetSync:info:", 1, a1[7], *(_OWORD *)&v18);
    }

    v4 = (void *)v21.i64[1];
    goto LABEL_12;
  }
  objc_msgSend(a1[5], "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("subscriptionMethod"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  v8 = a1[6];
  if (v7 != 1)
  {
    objc_msgSend(a1[6], "eventQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_4;
    v24[3] = &unk_1E95BCE58;
    v19 = *(int8x16_t *)(a1 + 5);
    v14 = (id)v19.i64[0];
    v25 = vextq_s8(v19, v19, 8uLL);
    v26 = a1[7];
    v27 = a1[4];
    dispatch_async(v13, v24);

    v4 = (void *)v25.i64[1];
LABEL_12:

    return;
  }
  objc_msgSend(a1[5], "GUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v10 = objc_msgSend(v8, "dbQueueInvitationWithAlbumGUID:outObject:outInvitationGUID:outEmail:outUserInfoData:", v9, &v32, 0, 0, 0);
  v11 = v32;

  if (v10)
  {
    objc_msgSend(a1[6], "eventQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_2;
    v28[3] = &unk_1E95BCE58;
    v28[4] = a1[6];
    v29 = v11;
    v30 = a1[7];
    v31 = a1[4];
    dispatch_async(v12, v28);

  }
}

void __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_3;
  v3[3] = &unk_1E95BCD70;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_5;
  v3[3] = &unk_1E95BCD70;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_6(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_7;
  v3[3] = &unk_1E95BCD70;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_7(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)a1[4];
    v4 = a1[5];
    v5 = a1[6];
    objc_msgSend(v3, "_protocolErrorForUnderlyingError:", a1[7]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishUnsubscribingFromAlbum:info:error:", v3, v4, v5, v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)a1[4];
    v8 = a1[5];
    objc_msgSend(v7, "_protocolErrorForUnderlyingError:", a1[7]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishUnsubscribingFromAlbum:error:", v7, v8, v9);

  }
}

void __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_5(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)a1[4];
    v4 = a1[5];
    v5 = a1[6];
    objc_msgSend(v3, "_protocolErrorForUnderlyingError:", a1[7]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishUnsubscribingFromAlbum:info:error:", v3, v4, v5, v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)a1[4];
    v8 = a1[5];
    objc_msgSend(v7, "_protocolErrorForUnderlyingError:", a1[7]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishUnsubscribingFromAlbum:error:", v7, v8, v9);

  }
}

void __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)a1[4];
    v4 = a1[5];
    v5 = a1[6];
    objc_msgSend(v3, "_protocolErrorForUnderlyingError:", a1[7]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishRejectingInvitation:info:error:", v3, v4, v5, v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)a1[4];
    v8 = a1[5];
    objc_msgSend(v7, "_protocolErrorForUnderlyingError:", a1[7]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishRejectingInvitation:error:", v7, v8, v9);

  }
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke(id *a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  int8x16_t v22;
  int8x16_t v23;
  uint64_t block;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  int8x16_t v28;
  id v29;
  id v30;
  _QWORD v31[4];
  int8x16_t v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (v2)
  {
    if (objc_msgSend(v2, "MSContainsErrorWithDomain:code:", CFSTR("MSASProtocolErrorDomain"), 15))
    {
      objc_msgSend(a1[6], "daemon");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = a1[4];
      objc_msgSend(a1[6], "personID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "didReceiveTooManySubscriptionsError:personID:", v4, v5);

    }
    objc_msgSend(a1[6], "eventQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_6;
    v27 = &unk_1E95BCE58;
    v22 = *(int8x16_t *)(a1 + 5);
    v7 = (id)v22.i64[0];
    v28 = vextq_s8(v22, v22, 8uLL);
    v29 = a1[7];
    v30 = a1[4];
    dispatch_async(v6, &block);

    if ((objc_msgSend(a1[4], "MSASStateMachineIsCanceledError") & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v19 = a1[6];
        objc_msgSend(a1[5], "GUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "MSVerboseDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v19;
        v43 = 2114;
        v44 = v20;
        v45 = 2114;
        v46 = v21;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to subscribe from album GUID %{public}@. Error: %{public}@. Reset-syncing albums.", buf, 0x20u);

      }
      objc_msgSend(a1[6], "refreshResetSync:info:", 1, a1[7], *(_OWORD *)&v22, block, v25, v26, v27, v28.i64[0]);
    }

    v8 = (void *)v28.i64[1];
    goto LABEL_14;
  }
  objc_msgSend(a1[5], "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("subscriptionMethod"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  v12 = a1[6];
  if (v11 != 1)
  {
    objc_msgSend(a1[6], "eventQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_4;
    v31[3] = &unk_1E95BCE58;
    v23 = *(int8x16_t *)(a1 + 5);
    v18 = (id)v23.i64[0];
    v32 = vextq_s8(v23, v23, 8uLL);
    v33 = a1[7];
    v34 = a1[4];
    dispatch_async(v17, v31);

    v8 = (void *)v32.i64[1];
LABEL_14:

    return;
  }
  objc_msgSend(a1[5], "GUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v14 = objc_msgSend(v12, "dbQueueInvitationWithAlbumGUID:outObject:outInvitationGUID:outEmail:outUserInfoData:", v13, &v40, 0, 0, 0);
  v15 = v40;

  if (v14)
  {
    objc_msgSend(a1[6], "eventQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_2;
    v35[3] = &unk_1E95BCE80;
    v35[4] = a1[6];
    v36 = v15;
    v37 = a1[5];
    v38 = a1[7];
    v39 = a1[4];
    dispatch_async(v16, v35);

  }
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_3;
  v3[3] = &unk_1E95BCDE8;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_5;
  v3[3] = &unk_1E95BCD70;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_6(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_7;
  v3[3] = &unk_1E95BCD70;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_7(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)a1[4];
    v4 = a1[5];
    v5 = a1[6];
    objc_msgSend(v3, "_protocolErrorForUnderlyingError:", a1[7]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishSubscribingToAlbum:info:error:", v3, v4, v5, v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)a1[4];
    v8 = a1[5];
    objc_msgSend(v7, "_protocolErrorForUnderlyingError:", a1[7]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishSubscribingToAlbum:error:", v7, v8, v9);

  }
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_5(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)a1[4];
    v4 = a1[5];
    v5 = a1[6];
    objc_msgSend(v3, "_protocolErrorForUnderlyingError:", a1[7]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishSubscribingToAlbum:info:error:", v3, v4, v5, v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)a1[4];
    v8 = a1[5];
    objc_msgSend(v7, "_protocolErrorForUnderlyingError:", a1[7]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishSubscribingToAlbum:error:", v7, v8, v9);

  }
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)a1[4];
    v4 = a1[5];
    v5 = a1[6];
    v6 = a1[7];
    objc_msgSend(v3, "_protocolErrorForUnderlyingError:", a1[8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "MSASModel:didFinishAcceptingInvitation:forAlbum:info:error:", v3, v4, v5, v6, v7);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)a1[4];
    v9 = a1[5];
    v10 = a1[6];
    objc_msgSend(v8, "_protocolErrorForUnderlyingError:", a1[8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "MSASModel:didFinishAcceptingInvitation:forAlbum:error:", v8, v9, v10, v11);

  }
}

void __93__MSASServerSideModel_MSASStateMachine_didFinishUpdatingAssetCollections_inAlbum_info_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  MSASCommentCheckOperation *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  void *v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  id obja[2];
  _QWORD block[4];
  int8x16_t v46;
  id v47;
  int v48;
  id v49;
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  uint64_t v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = *(id *)(a1 + 40);
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (!v2)
      goto LABEL_28;
    v3 = v2;
    v4 = *(_QWORD *)v54;
    v41 = *(_QWORD *)v54;
    while (1)
    {
      v5 = 0;
      v42 = v3;
      do
      {
        if (*(_QWORD *)v54 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x1D8255C20]();
        v8 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
        objc_msgSend(*(id *)(a1 + 56), "GUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setAlbumGUID:", v9);

        if ((objc_msgSend(v6, "isMine") & 1) == 0)
        {
          v10 = *(void **)(a1 + 64);
          objc_msgSend(*(id *)(a1 + 56), "GUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = 0;
          v52 = 0;
          v12 = objc_msgSend(v10, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v11, 0, 0, &v52, &v51, 0, 0);
          v13 = v52;
          v14 = v51;

          if (v12)
          {
            v15 = *(void **)(a1 + 64);
            objc_msgSend(*(id *)(a1 + 56), "GUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = 0;
            v17 = objc_msgSend(v15, "dbQueueAlbumMetadataWithAlbumGUID:key:outValue:", v16, CFSTR("lastviewedctag"), &v50);
            v18 = v50;

            if (v17
              && (!objc_msgSend(*(id *)(a1 + 56), "useForeignCtag") ? (v19 = v13) : (v19 = v14), v18 && v19))
            {
              v20 = objc_msgSend(v18, "isEqualToString:");

              if ((v20 & 1) != 0)
              {
LABEL_22:
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
                v23 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKey:", v23, CFSTR("notInteresting"));
                goto LABEL_23;
              }
            }
            else
            {

            }
          }
          v21 = *(void **)(a1 + 64);
          objc_msgSend(*(id *)(a1 + 56), "GUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 0;
          LODWORD(v21) = objc_msgSend(v21, "dbQueueAlbumMetadataWithAlbumGUID:key:outValue:", v22, CFSTR("lastassetposition"), &v49);
          v23 = v49;

          if (!(_DWORD)v21 || (v24 = objc_msgSend(v23, "longLongValue"), v24 >= objc_msgSend(v6, "photoNumber")))
          {

            goto LABEL_22;
          }
          v25 = *(void **)(a1 + 64);
          objc_msgSend(*(id *)(a1 + 56), "GUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "dbQueueSetUnviewedState:onAlbumWithGUID:info:", 1, v26, *(_QWORD *)(a1 + 48));

LABEL_23:
          v4 = v41;
          v3 = v42;
        }
        v27 = *(void **)(a1 + 64);
        objc_msgSend(*(id *)(a1 + 56), "GUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "dbQueueSetAssetCollection:inAlbumWithGUID:info:", v6, v28, v8);

        objc_msgSend(*(id *)(a1 + 64), "pendingChanges");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "GUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "removePendingAssetCollection:forAlbumGUID:", v6, v30);

        if (objc_msgSend(v6, "hasComments"))
        {
          v31 = objc_alloc_init(MSASCommentCheckOperation);
          objc_msgSend(v6, "GUID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSASCommentCheckOperation setAssetCollectionGUID:](v31, "setAssetCollectionGUID:", v32);

          objc_msgSend(*(id *)(a1 + 56), "GUID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSASCommentCheckOperation setAlbumGUID:](v31, "setAlbumGUID:", v33);

          objc_msgSend(*(id *)(a1 + 64), "dbQueueAddCommentCheckOperation:", v31);
        }

        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      if (!v3)
      {
LABEL_28:

        v34 = *(void **)(a1 + 64);
        objc_msgSend(*(id *)(a1 + 56), "GUID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v34) = objc_msgSend(v34, "dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:", v35);

        objc_msgSend(*(id *)(a1 + 64), "eventQueue");
        v36 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __93__MSASServerSideModel_MSASStateMachine_didFinishUpdatingAssetCollections_inAlbum_info_error___block_invoke_2;
        block[3] = &unk_1E95BC488;
        *(_OWORD *)obja = *(_OWORD *)(a1 + 56);
        v37 = obja[0];
        v46 = vextq_s8(*(int8x16_t *)obja, *(int8x16_t *)obja, 8uLL);
        v48 = (int)v34;
        v47 = *(id *)(a1 + 48);
        dispatch_async(v36, block);

        break;
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 64), "pendingChanges");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "hasPendingChanges");

  if ((v39 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v40 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138543362;
      v58 = v40;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Finished checking asset collections", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 64), "MSASStateMachine:didFinishCheckingForChangesInfo:error:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  }
}

uint64_t __93__MSASServerSideModel_MSASStateMachine_didFinishUpdatingAssetCollections_inAlbum_info_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum:unviewedCount:info:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __100__MSASServerSideModel_MSASStateMachine_didFireScheduledEvent_forAssetCollectionGUID_albumGUID_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleEvent:assetCollectionGUID:albumGUID:info:", CFSTR("flushPendingCommentQueue"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __81__MSASServerSideModel_MSASStateMachine_didFinishCheckingForUpdatesInAlbums_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleEvent:assetCollectionGUID:albumGUID:info:", CFSTR("preFlushPendingCommentQueue"), 0, 0, *(_QWORD *)(a1 + 40));

}

void __86__MSASServerSideModel_MSASStateMachine_didFinishCheckingForUpdatesInAlbum_info_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "dbQueueUpdateAlbumCtag:", *(_QWORD *)(a1 + 48));
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "GUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dbQueueCheckToClearUnviewedStateOnAlbumWithGUID:info:", v3, *(_QWORD *)(a1 + 56));

  }
  objc_msgSend(*(id *)(a1 + 40), "pendingChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "GUID");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removePendingChangesForAlbumGUID:", v5);

  objc_msgSend(*(id *)(a1 + 40), "pendingChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "hasPendingChanges");

  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543362;
      v9 = v7;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Finished checking album updates", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "MSASStateMachine:didFinishCheckingForChangesInfo:error:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  }
}

uint64_t __73__MSASServerSideModel_MSASStateMachine_didFindChangesInAlbum_info_error___block_invoke(uint64_t result)
{
  if (!*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "dbQueueSetAlbum:info:", *(_QWORD *)(result + 48), *(_QWORD *)(result + 56));
  return result;
}

void __84__MSASServerSideModel_MSASStateMachine_didFindAssetCollectionChanges_forAlbum_info___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  NSObject *v52;
  id v53;
  uint64_t v54;
  int v55;
  int8x16_t v56;
  void *v57;
  _QWORD block[4];
  int8x16_t v59;
  id v60;
  int v61;
  __int128 v62;
  __int128 v63;
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
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint8_t v81[128];
  uint8_t buf[4];
  id v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "MSASAlbumResetSyncAlbumGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "GUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  LODWORD(v54) = v4;
  if (v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[6];
    objc_msgSend(a1[5], "GUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v83 = v5;
    v84 = 2114;
    v85 = v6;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Reconciling contents of album GUID %{public}@ due to a reset sync.", buf, 0x16u);

  }
  objc_msgSend(a1[6], "beginTransaction", v54);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1[7], "count"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v7 = a1[7];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v75 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1D8255C20]();
        v14 = objc_msgSend(v12, "wasDeleted");
        v15 = a1[6];
        objc_msgSend(v12, "GUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v15, "dbQueueDeleteAssetCollectionWithGUID:info:", v16, a1[4]);
        }
        else
        {
          objc_msgSend(v15, "dbQueueLookupOrCreateAssetCollectionWithGUID:outAlbum:", v16, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "ctag");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "ctag");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToString:", v19);

          if ((v20 & 1) == 0)
            objc_msgSend(v57, "addObject:", v17);
          v16 = v17;
        }

        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
    }
    while (v9);
  }

  if (v55)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(a1[7], "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v22 = a1[7];
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v71;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v71 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * j), "GUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
      }
      while (v24);
    }

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v28 = a1[6];
    objc_msgSend(a1[5], "GUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dbQueueAssetCollectionGUIDsInAlbumWithGUID:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v67;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v67 != v33)
            objc_enumerationMutation(v30);
          v35 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k);
          v36 = (void *)MEMORY[0x1D8255C20]();
          if ((objc_msgSend(v21, "containsObject:", v35) & 1) == 0)
            objc_msgSend(a1[6], "dbQueueDeleteAssetCollectionWithGUID:info:", v35, a1[4]);
          objc_autoreleasePoolPop(v36);
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
      }
      while (v32);
    }

  }
  if (objc_msgSend(v57, "count"))
  {
    objc_msgSend(a1[6], "pendingChanges");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "GUID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addPendingAssetCollectionChanges:forAlbumGUID:", v57, v38);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 50);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v40 = v57;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v63;
      do
      {
        for (m = 0; m != v42; ++m)
        {
          if (*(_QWORD *)v63 != v43)
            objc_enumerationMutation(v40);
          v45 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * m);
          v46 = (void *)MEMORY[0x1D8255C20]();
          objc_msgSend(v39, "addObject:", v45);
          if ((unint64_t)objc_msgSend(v39, "count") >= 0x32)
          {
            objc_msgSend(a1[6], "stateMachine");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "checkForAssetCollectionUpdates:inAlbum:info:", v39, a1[5], a1[4]);

            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 50);
            v48 = objc_claimAutoreleasedReturnValue();

            v39 = (void *)v48;
          }
          objc_autoreleasePoolPop(v46);
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
      }
      while (v42);
    }

    if (objc_msgSend(v39, "count"))
    {
      objc_msgSend(a1[6], "stateMachine");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "checkForAssetCollectionUpdates:inAlbum:info:", v39, a1[5], a1[4]);

    }
  }
  objc_msgSend(a1[6], "endTransaction");
  v50 = a1[6];
  objc_msgSend(a1[5], "GUID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v50) = objc_msgSend(v50, "dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:", v51);

  objc_msgSend(a1[6], "eventQueue");
  v52 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__MSASServerSideModel_MSASStateMachine_didFindAssetCollectionChanges_forAlbum_info___block_invoke_448;
  block[3] = &unk_1E95BC488;
  v56 = *(int8x16_t *)(a1 + 5);
  v53 = (id)v56.i64[0];
  v59 = vextq_s8(v56, v56, 8uLL);
  v61 = (int)v50;
  v60 = a1[4];
  dispatch_async(v52, block);

}

uint64_t __84__MSASServerSideModel_MSASStateMachine_didFindAssetCollectionChanges_forAlbum_info___block_invoke_448(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum:unviewedCount:info:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __91__MSASServerSideModel_MSASStateMachine_didFinishGettingAccessControls_forAlbum_info_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  uint64_t v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "dbQueueBeginTransaction");
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v3 = *(id *)(a1 + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v46 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          v9 = (void *)MEMORY[0x1D8255C20]();
          objc_msgSend(v8, "GUID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(*(id *)(a1 + 48), "dbQueueSetAccessControl:info:", v8, *(_QWORD *)(a1 + 56));
            objc_msgSend(v8, "GUID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addObject:", v11);

          }
          objc_autoreleasePoolPop(v9);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v5);
    }

    objc_msgSend(*(id *)(a1 + 48), "dbQueueEndTransaction");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v12 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 64), "GUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dbQueueAccessControlsForAlbumWithGUID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v42 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v19, "GUID");
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = (void *)v20;
            objc_msgSend(v19, "GUID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v2, "containsObject:", v22);

            if ((v23 & 1) == 0)
            {
              objc_msgSend(v19, "GUID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "addObject:", v24);

            }
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
      }
      while (v16);
    }

    objc_msgSend(*(id *)(a1 + 48), "dbQueueBeginTransaction");
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v25 = v36;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v38;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v38 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k);
          v31 = (void *)MEMORY[0x1D8255C20]();
          objc_msgSend(*(id *)(a1 + 48), "dbQueueDeleteAccessControlWithGUID:info:", v30, *(_QWORD *)(a1 + 56));
          objc_autoreleasePoolPop(v31);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
      }
      while (v27);
    }

    objc_msgSend(*(id *)(a1 + 48), "dbQueueEndTransaction");
  }
  objc_msgSend(*(id *)(a1 + 48), "pendingChanges");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "GUID");
  v33 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "removePendingSharingInfoChangesForAlbumGUID:", v33);

  objc_msgSend(*(id *)(a1 + 48), "pendingChanges");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v33) = objc_msgSend(v34, "hasPendingChanges");

  if ((v33 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v35 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      v50 = v35;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Finished checking album access controls", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 48), "MSASStateMachine:didFinishCheckingForChangesInfo:error:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  }
}

void __78__MSASServerSideModel_MSASStateMachine_didFinishCheckingForChangesInfo_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setRootCtagFromPendingRootCtag");
  objc_msgSend(*(id *)(a1 + 40), "eventQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__MSASServerSideModel_MSASStateMachine_didFinishCheckingForChangesInfo_error___block_invoke_2;
  block[3] = &unk_1E95BCE30;
  v3 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v5 = v3;
  v6 = *(id *)(a1 + 56);
  dispatch_async(v2, block);

}

void __78__MSASServerSideModel_MSASStateMachine_didFinishCheckingForChangesInfo_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__MSASServerSideModel_MSASStateMachine_didFinishCheckingForChangesInfo_error___block_invoke_3;
  v3[3] = &unk_1E95BCD00;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __78__MSASServerSideModel_MSASStateMachine_didFinishCheckingForChangesInfo_error___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)a1[4];
    v4 = a1[5];
    objc_msgSend(v3, "_protocolErrorForUnderlyingError:", a1[6]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "MSASModel:didFinishCheckingForChangesInfo:error:", v3, v4, v5);

  }
}

void __87__MSASServerSideModel_MSASStateMachine_didFindSyncedKeyValueChangesForAlbumGUIDS_info___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = a1[4];
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
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1D8255C20](v3);
        objc_msgSend(a1[5], "dbQueueLookupOrCreateAlbumWithGUID:", v7, (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(a1[6], "addObject:", v9);

        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v4 = v3;
    }
    while (v3);
  }

}

void __86__MSASServerSideModel_MSASStateMachine_didFindAccessControlChangesForAlbumGUIDS_info___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = a1[4];
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
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1D8255C20](v3);
        objc_msgSend(a1[5], "dbQueueLookupOrCreateAlbumWithGUID:", v7, (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(a1[6], "addObject:", v9);

        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v4 = v3;
    }
    while (v3);
  }

}

void __82__MSASServerSideModel_MSASStateMachine_didFindNewURLString_forAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = 0;
  v4 = objc_msgSend(v2, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v3, &v7, 0, 0, 0, 0, 0);
  v5 = v7;
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setURLString:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "dbQueueSetAlbum:info:", v6, *(_QWORD *)(a1 + 56));
  }

}

void __65__MSASServerSideModel_MSASStateMachine_didFindAlbumChanges_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  int v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  int v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  BOOL v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t i;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  uint64_t j;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t k;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  char v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  id v123;
  int v124;
  void *v125;
  uint64_t v126;
  void *v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  id v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  uint8_t v145[128];
  uint8_t buf[4];
  uint64_t v147;
  __int16 v148;
  uint64_t v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  v124 = objc_msgSend(*(id *)(a1 + 32), "MSASIsGlobalResetSync");
  if (v124 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v147 = v2;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Reconciling current album list due to a reset sync.", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dbQueueBeginTransaction");
  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  v3 = *(id *)(a1 + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v141, v152, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v142;
    v122 = *(_QWORD *)v142;
    v123 = v3;
    do
    {
      v7 = 0;
      v126 = v5;
      do
      {
        if (*(_QWORD *)v142 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1D8255C20]();
        v10 = objc_msgSend(v8, "wasDeleted");
        v11 = *(void **)(a1 + 40);
        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 40), "stateMachine");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "GUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "cancelOutstandingCommandsForAlbumWithGUID:", v13);

          v14 = *(void **)(a1 + 40);
          objc_msgSend(v8, "GUID");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "dbQueueDeleteAlbumWithGUID:info:", v15, *(_QWORD *)(a1 + 32));
          goto LABEL_56;
        }
        v127 = v9;
        objc_msgSend(v8, "GUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v140 = 0;
        v17 = objc_msgSend(v11, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v16, &v140, 0, 0, 0, 0, 0);
        v15 = v140;

        if (!v17)
        {
          +[MSASAlbum album](MSASAlbum, "album");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "GUID");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setGUID:", v62);

          objc_msgSend(v8, "ownerEmail");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setOwnerEmail:", v63);

          objc_msgSend(v8, "ownerPersonID");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setOwnerPersonID:", v64);

          objc_msgSend(v8, "ownerFirstName");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setOwnerFirstName:", v65);

          objc_msgSend(v8, "ownerLastName");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setOwnerLastName:", v66);

          objc_msgSend(v8, "ownerFullName");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setOwnerFullName:", v67);

          objc_msgSend(v8, "invitation");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "subscriptionDate");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setSubscriptionDate:", v69);

          objc_msgSend(v8, "URLString");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setURLString:", v70);

          objc_msgSend(v8, "invitation");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setRelationshipState:", objc_msgSend(v71, "state"));

          objc_msgSend(v8, "name");
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          if (v72)
          {
            objc_msgSend(v8, "name");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "setMetadataValue:forKey:", v73, CFSTR("name"));

          }
          objc_msgSend(*(id *)(a1 + 40), "dbQueueSetAlbum:info:", v61, *(_QWORD *)(a1 + 32));
          objc_msgSend(v8, "invitation");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v74, "state"))
          {
            objc_msgSend(v8, "invitation");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = objc_msgSend(v75, "state");

            if (v76 != 2)
              goto LABEL_41;
          }
          else
          {

          }
          objc_msgSend(v125, "addObject:", v61);
LABEL_41:
          objc_msgSend(v8, "invitation");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend(v77, "state");

          if (v78 == 2)
            objc_msgSend(v121, "addObject:", v61);

          v9 = v127;
          goto LABEL_51;
        }
        objc_msgSend(v15, "ownerEmail");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ownerEmail");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        v21 = v124;
        if ((v20 & 1) == 0)
        {
          objc_msgSend(v8, "ownerEmail");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setOwnerEmail:", v22);

          v21 = 1;
        }
        objc_msgSend(v15, "ownerPersonID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ownerPersonID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqualToString:", v24);

        if ((v25 & 1) == 0)
        {
          objc_msgSend(v8, "ownerPersonID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setOwnerPersonID:", v26);

          v21 = 1;
        }
        objc_msgSend(v15, "ownerFullName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ownerFullName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v27, "isEqualToString:", v28);

        if ((v29 & 1) == 0)
        {
          objc_msgSend(v8, "ownerFullName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setOwnerFullName:", v30);

          v21 = 1;
        }
        objc_msgSend(v15, "ownerFirstName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ownerFirstName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v31, "isEqualToString:", v32);

        if ((v33 & 1) == 0)
        {
          objc_msgSend(v8, "ownerFirstName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setOwnerFirstName:", v34);

          v21 = 1;
        }
        objc_msgSend(v15, "ownerLastName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ownerLastName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqualToString:", v36);

        if ((v37 & 1) == 0)
        {
          objc_msgSend(v8, "ownerLastName");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setOwnerLastName:", v38);

          v21 = 1;
        }
        objc_msgSend(v15, "subscriptionDate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "invitation");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "subscriptionDate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v39, "isEqualToDate:", v41);

        if ((v42 & 1) == 0)
        {
          objc_msgSend(v8, "invitation");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "subscriptionDate");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setSubscriptionDate:", v44);

          v21 = 1;
        }
        objc_msgSend(v15, "URLString");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "URLString");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v45, "isEqualToString:", v46);

        if ((v47 & 1) == 0)
        {
          objc_msgSend(v8, "URLString");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setURLString:", v48);

          v21 = 1;
        }
        v49 = objc_msgSend(v15, "relationshipState");
        objc_msgSend(v8, "invitation");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "state");

        if (v49 != v51)
        {
          objc_msgSend(v8, "invitation");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setRelationshipState:", objc_msgSend(v52, "state"));

          objc_msgSend(v8, "invitation");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "state");

          if (v54 == 2)
            objc_msgSend(v121, "addObject:", v15);
          v21 = 1;
        }
        objc_msgSend(v8, "name");
        v55 = objc_claimAutoreleasedReturnValue();
        if (v55)
        {
          v56 = (void *)v55;
          objc_msgSend(v15, "metadata");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "objectForKey:", CFSTR("name"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "name");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v58, "isEqualToString:", v59);

          if ((v60 & 1) == 0)
          {
            objc_msgSend(v8, "name");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setMetadataValue:forKey:", v79, CFSTR("name"));

LABEL_45:
            objc_msgSend(*(id *)(a1 + 40), "dbQueueSetAlbum:info:", v15, *(_QWORD *)(a1 + 32));
            goto LABEL_46;
          }
        }
        if (v21)
          goto LABEL_45;
LABEL_46:
        objc_msgSend(v8, "invitation");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v80, "state"))
        {
          objc_msgSend(v8, "invitation");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = objc_msgSend(v81, "state");

          v83 = v82 == 2;
          v6 = v122;
          v3 = v123;
          v9 = v127;
          if (!v83)
            goto LABEL_51;
        }
        else
        {

          v6 = v122;
          v3 = v123;
          v9 = v127;
        }
        objc_msgSend(v125, "addObject:", v15);
LABEL_51:
        objc_msgSend(v8, "invitation");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "state");

        if (v85)
        {
          v86 = *(void **)(a1 + 40);
          objc_msgSend(v8, "invitation");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "dbQueueSetInvitation:info:", v87, *(_QWORD *)(a1 + 32));

        }
        objc_msgSend(v8, "invitation");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend(v88, "state");

        if (v89 == 1)
        {
          v90 = *(void **)(a1 + 40);
          objc_msgSend(v8, "GUID");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "dbQueueSetUnviewedState:onAlbumWithGUID:info:", 1, v91, *(_QWORD *)(a1 + 32));

        }
        v5 = v126;
LABEL_56:

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v141, v152, 16);
    }
    while (v5);
  }

  if (v124)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = 0u;
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v93 = *(id *)(a1 + 48);
    v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v136, v151, 16);
    if (v94)
    {
      v95 = v94;
      v96 = *(_QWORD *)v137;
      do
      {
        for (i = 0; i != v95; ++i)
        {
          if (*(_QWORD *)v137 != v96)
            objc_enumerationMutation(v93);
          objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * i), "GUID");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "addObject:", v98);

        }
        v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v136, v151, 16);
      }
      while (v95);
    }

    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "dbQueueAlbumGUIDs");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v132, v150, 16);
    if (v100)
    {
      v101 = v100;
      v102 = *(_QWORD *)v133;
      v103 = MEMORY[0x1E0C81028];
      do
      {
        for (j = 0; j != v101; ++j)
        {
          if (*(_QWORD *)v133 != v102)
            objc_enumerationMutation(v99);
          v105 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * j);
          v106 = (void *)MEMORY[0x1D8255C20]();
          if ((objc_msgSend(v92, "containsObject:", v105) & 1) == 0)
          {
            if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
            {
              v107 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              v147 = v107;
              v148 = 2114;
              v149 = v105;
              _os_log_impl(&dword_1D3E94000, v103, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting album GUID %{public}@ due to reset sync.", buf, 0x16u);
            }
            objc_msgSend(*(id *)(a1 + 40), "dbQueueDeleteAlbumWithGUID:info:", v105, *(_QWORD *)(a1 + 32));
          }
          objc_autoreleasePoolPop(v106);
        }
        v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v132, v150, 16);
      }
      while (v101);
    }

  }
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  v108 = v125;
  v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v128, v145, 16);
  if (v109)
  {
    v110 = v109;
    v111 = *(_QWORD *)v129;
    do
    {
      for (k = 0; k != v110; ++k)
      {
        if (*(_QWORD *)v129 != v111)
          objc_enumerationMutation(v108);
        v113 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * k);
        objc_msgSend(*(id *)(a1 + 40), "pendingChanges");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "GUID");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "addPendingChangesForAlbumGUID:", v115);

      }
      v110 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v128, v145, 16);
    }
    while (v110);
  }

  objc_msgSend(*(id *)(a1 + 40), "pendingChanges");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = objc_msgSend(v116, "hasPendingChanges");

  if ((v117 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v120 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v147 = v120;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Finished checking album changes", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "MSASStateMachine:didFinishCheckingForChangesInfo:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), 0);
  }
  if (objc_msgSend(v108, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "stateMachine");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "checkForUpdatesInAlbums:resetSync:info:", v108, 0, *(_QWORD *)(a1 + 32));

  }
  if (objc_msgSend(v121, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "stateMachine");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "getAccessControlsForAlbums:info:", v121, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 40), "dbQueueEndTransaction");

}

void __67__MSASServerSideModel_MSASStateMachineDidFindGlobalResetSync_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveGlobalResetSyncForPersonID:", v3);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__MSASServerSideModel_MSASStateMachineDidFindGlobalResetSync_info___block_invoke_2;
  v5[3] = &unk_1E95BC5E8;
  v4 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v4;
  objc_msgSend(v6, "eventQueuePerformBlockOnObservers:", v5);

}

void __67__MSASServerSideModel_MSASStateMachineDidFindGlobalResetSync_info___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindGlobalResetSyncInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __48__MSASServerSideModel_MSASStateMachineDidStart___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dbQueueFlushAllPendingCommentCheckOperations");
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "retryOutstandingActivities");

}

void __64__MSASServerSideModel__invalidAssetCollectionGUIDErrorwithGUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v7 = (__CFString *)MSCFCopyLocalizedString(CFSTR("Model.error.invalidAssetCollectionGUID_GUID"));
  objc_msgSend(v3, "stringWithFormat:", v7, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSErrorWithDomain:code:description:", CFSTR("MSASModelErrorDomain"), 2, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_invalidAssetCollectionGUIDErrorwithGUID__error;
  _invalidAssetCollectionGUIDErrorwithGUID__error = v5;

}

void __62__MSASServerSideModel__invalidAccessControlGUIDErrorwithGUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v7 = (__CFString *)MSCFCopyLocalizedString(CFSTR("Model.error.invalidACLGUID_GUID"));
  objc_msgSend(v3, "stringWithFormat:", v7, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSErrorWithDomain:code:description:", CFSTR("MSASModelErrorDomain"), 1, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_invalidAccessControlGUIDErrorwithGUID__error;
  _invalidAccessControlGUIDErrorwithGUID__error = v5;

}

void __59__MSASServerSideModel__invalidInvitationGUIDErrorWithGUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v7 = (__CFString *)MSCFCopyLocalizedString(CFSTR("Model.error.invalidInvitationGUID_GUID"));
  objc_msgSend(v3, "stringWithFormat:", v7, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSErrorWithDomain:code:description:", CFSTR("MSASModelErrorDomain"), 0, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_invalidInvitationGUIDErrorWithGUID__error;
  _invalidInvitationGUIDErrorWithGUID__error = v5;

}

void __74__MSASServerSideModel_earliestUnviewedAssetCollectionGUIDInAlbumWithGUID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  void *v10;
  sqlite3_int64 v11;
  sqlite3_stmt *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v22 = 0;
  v4 = objc_msgSend(v2, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v3, &v22, 0, 0, 0, 0, 0);
  v5 = v22;
  if (v4)
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v21 = 0;
    v8 = objc_msgSend(v6, "dbQueueAlbumMetadataWithAlbumGUID:key:outValue:", v7, CFSTR("lastassetposition"), &v21);
    v9 = v21;
    v10 = v9;
    if ((v8 & 1) != 0)
    {
      v11 = objc_msgSend(v9, "longLongValue");
      v12 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("select GUID from AssetCollections where albumGUID = ? and photoNumber > ? order by albumGUID asc, batchDate asc, photoDate asc, GUID asc;"));
      v13 = MSSqliteBindStringOrNull(v12, 1, *(id *)(a1 + 40));
      v14 = v13;
      MSSqliteTrapForDBLockError(v13);
      if (!v14)
      {
        v15 = sqlite3_bind_int64(v12, 2, v11);
        v16 = v15;
        MSSqliteTrapForDBLockError(v15);
        if (!v16)
        {
          v17 = sqlite3_step(v12);
          if (v17 != 101)
          {
            if (v17 == 100)
            {
              MSSqliteStringFromStatementColumn(v12, 0);
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
              v20 = *(void **)(v19 + 40);
              *(_QWORD *)(v19 + 40) = v18;

            }
            else
            {
              MSLogSqliteError((sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "dbQueueDB"), *(_QWORD *)(a1 + 32), 3500);
            }
          }
        }
      }

      if (v12)
        sqlite3_reset(v12);
    }
    else
    {

    }
  }

}

void __71__MSASServerSideModel_lastViewedCommentDateForAssetCollectionWithGUID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v11 = 0;
  v4 = objc_msgSend(v2, "dbQueueAssetCollectionMetadataWithAssetCollectionGUID:key:outValue:", v3, CFSTR("lastcommenttimestamp"), &v11);
  v5 = v11;
  v6 = v5;
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

uint64_t __60__MSASServerSideModel_flushAllPendingCommentCheckOperations__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueFlushAllPendingCommentCheckOperations");
}

MSASCommentCheckOperation *__59__MSASServerSideModel_dbQueuePendingCommentCheckOperations__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  MSASCommentCheckOperation *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MSASCommentCheckOperation);
  MSSqliteStringFromStatementColumn(a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASCommentCheckOperation setAssetCollectionGUID:](v3, "setAssetCollectionGUID:", v4);

  MSSqliteStringFromStatementColumn(a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASCommentCheckOperation setAlbumGUID:](v3, "setAlbumGUID:", v5);

  return v3;
}

uint64_t __68__MSASServerSideModel_unviewedAssetCollectionCountForAlbumWithGUID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:", *(_QWORD *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __65__MSASServerSideModel_isAssetCollectionWithGUIDMarkedAsUnviewed___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v7 = 0;
  v4 = objc_msgSend(v2, "dbQueueAssetCollectionMetadataWithAssetCollectionGUID:key:outValue:", v3, CFSTR("unviewedFlag"), &v7);
  v5 = v7;
  v6 = v5;
  if (v4)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v5, "isEqualToString:", CFSTR("1"));

}

uint64_t __41__MSASServerSideModel_unviewedAlbumCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dbQueueUnviewedAlbumCount");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __55__MSASServerSideModel_isAlbumWithGUIDMarkedAsUnviewed___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v7 = 0;
  v4 = objc_msgSend(v2, "dbQueueAlbumMetadataWithAlbumGUID:key:outValue:", v3, CFSTR("unviewedFlag"), &v7);
  v5 = v7;
  v6 = v5;
  if (v4)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v5, "isEqualToString:", CFSTR("1"));

}

void __97__MSASServerSideModel_eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum_unviewedCount_info___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didUpdateUnviewedAssetCollectionCount:forAlbum:info:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didUpdateUnviewedAssetCollectionCount:forAlbum:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

uint64_t __76__MSASServerSideModel_dbQueueCheckToClearUnviewedStateOnAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum:unviewedCount:info:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __68__MSASServerSideModel_dbQueueSetUnviewedState_onAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  int v7;
  char v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__MSASServerSideModel_dbQueueSetUnviewedState_onAlbumWithGUID_info___block_invoke_2;
  v3[3] = &unk_1E95BC6C0;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v8 = *(_BYTE *)(a1 + 60);
  v6 = *(id *)(a1 + 48);
  v7 = *(_DWORD *)(a1 + 56);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __68__MSASServerSideModel_dbQueueSetUnviewedState_onAlbumWithGUID_info___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didMarkAlbum:asHavingUnreadContent:info:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 60), *(_QWORD *)(a1 + 48));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didMarkAlbum:asHavingUnreadContent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 60));
  objc_msgSend(*(id *)(a1 + 32), "eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum:unviewedCount:info:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

void __78__MSASServerSideModel_dbQueueSetUnviewedState_onAssetCollectionWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__MSASServerSideModel_dbQueueSetUnviewedState_onAssetCollectionWithGUID_info___block_invoke_2;
  v3[3] = &unk_1E95BC670;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v8 = *(_BYTE *)(a1 + 64);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __78__MSASServerSideModel_dbQueueSetUnviewedState_onAssetCollectionWithGUID_info___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didMarkAssetCollection:asHavingUnreadComments:inAlbum:info:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didMarkAssetCollection:asHavingUnreadComments:inAlbum:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));

}

void __91__MSASServerSideModel_dbQueueSetAssetCollectionMetadataAssetCollectionGUID_key_value_info___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __91__MSASServerSideModel_dbQueueSetAssetCollectionMetadataAssetCollectionGUID_key_value_info___block_invoke_2;
  v3[3] = &unk_1E95BCDE8;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __91__MSASServerSideModel_dbQueueSetAssetCollectionMetadataAssetCollectionGUID_key_value_info___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindLastViewedCommentDate:forAssetCollection:inAlbum:info:", a1[4], a1[5], a1[6], a1[7], a1[8]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindLastViewedCommentDate:forAssetCollection:inAlbum:", a1[4], a1[5], a1[6], a1[7]);

}

void __57__MSASServerSideModel_dbQueueDeleteCommentWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__MSASServerSideModel_dbQueueDeleteCommentWithGUID_info___block_invoke_2;
  v3[3] = &unk_1E95BCDE8;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __57__MSASServerSideModel_dbQueueDeleteCommentWithGUID_info___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didDeleteComment:forAssetCollection:inAlbum:info:", a1[4], a1[5], a1[6], a1[7], a1[8]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didDeleteComment:forAssetCollection:inAlbum:", a1[4], a1[5], a1[6], a1[7]);

}

void __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "eventQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke_2;
  block[3] = &unk_1E95BCE80;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  dispatch_async(v2, block);

}

void __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke_5;
  v3[3] = &unk_1E95BCDE8;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke_5(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindNewComment:forAssetCollection:inAlbum:info:", a1[4], a1[5], a1[6], a1[7], a1[8]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindNewComment:forAssetCollection:inAlbum:", a1[4], a1[5], a1[6], a1[7]);

}

void __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke_3;
  v3[3] = &unk_1E95BCDE8;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindCommentChange:inAssetCollection:inAlbum:info:", a1[4], a1[5], a1[6], a1[7], a1[8]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindCommentChange:inAssetCollection:inAlbum:", a1[4], a1[5], a1[6], a1[7]);

}

void __65__MSASServerSideModel_dbQueueDeleteAssetCollectionWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__MSASServerSideModel_dbQueueDeleteAssetCollectionWithGUID_info___block_invoke_2;
  v3[3] = &unk_1E95BCD70;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __65__MSASServerSideModel_dbQueueDeleteAssetCollectionWithGUID_info___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindDeletedAssetCollection:inAlbum:info:", a1[4], a1[5], a1[6], a1[7]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindDeletedAssetCollection:inAlbum:", a1[4], a1[5], a1[6]);

}

void __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "eventQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke_2;
  v4[3] = &unk_1E95BCE58;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  dispatch_async(v2, v4);

}

void __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke_5;
  v3[3] = &unk_1E95BCD70;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke_5(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindNewAssetCollection:inAlbum:info:", a1[4], a1[5], a1[6], a1[7]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindNewAssetCollection:inAlbum:", a1[4], a1[5], a1[6]);

}

void __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke_3;
  v3[3] = &unk_1E95BCD70;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindAssetCollectionChange:inAlbum:info:", a1[4], a1[5], a1[6], a1[7]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindAssetCollectionChange:inAlbum:", a1[4], a1[5], a1[6]);

}

void __60__MSASServerSideModel_dbQueueDeleteInvitationWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__MSASServerSideModel_dbQueueDeleteInvitationWithGUID_info___block_invoke_2;
  v3[3] = &unk_1E95BCD00;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __60__MSASServerSideModel_dbQueueDeleteInvitationWithGUID_info___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindDeletedInvitation:info:", a1[4], a1[5], a1[6]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindDeletedInvitation:", a1[4], a1[5]);

}

void __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "eventQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke_2;
  block[3] = &unk_1E95BCE30;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke_5;
  v3[3] = &unk_1E95BCD00;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke_5(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindNewInvitation:info:", a1[4], a1[5], a1[6]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindNewInvitation:", a1[4], a1[5]);

}

void __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke_3;
  v3[3] = &unk_1E95BCD00;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindInvitationChange:info:", a1[4], a1[5], a1[6]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindInvitationChange:", a1[4], a1[5]);

}

void __63__MSASServerSideModel_dbQueueDeleteAccessControlWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__MSASServerSideModel_dbQueueDeleteAccessControlWithGUID_info___block_invoke_2;
  v3[3] = &unk_1E95BCD70;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __63__MSASServerSideModel_dbQueueDeleteAccessControlWithGUID_info___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindDeletedAccessControl:inAlbum:info:", a1[4], a1[5], a1[6], a1[7]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindDeletedAccessControl:inAlbum:", a1[4], a1[5], a1[6]);

}

void __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "eventQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke_2;
  v4[3] = &unk_1E95BCE58;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  dispatch_async(v2, v4);

}

void __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke_5;
  v3[3] = &unk_1E95BCD70;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke_5(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindNewAccessControl:inAlbum:info:", a1[4], a1[5], a1[6], a1[7]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindNewAccessControl:inAlbum:", a1[4], a1[5], a1[6]);

}

void __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke_3;
  v3[3] = &unk_1E95BCD70;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindAccessControlChange:inAlbum:info:", a1[4], a1[5], a1[6], a1[7]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindAccessControlChange:inAlbum:", a1[4], a1[5], a1[6]);

}

void __55__MSASServerSideModel_dbQueueDeleteAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__MSASServerSideModel_dbQueueDeleteAlbumWithGUID_info___block_invoke_2;
  v3[3] = &unk_1E95BCD00;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __55__MSASServerSideModel_dbQueueDeleteAlbumWithGUID_info___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindDeletedAlbum:info:", a1[4], a1[5], a1[6]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindDeletedAlbum:", a1[4], a1[5]);

}

void __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "eventQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke_2;
  block[3] = &unk_1E95BCE30;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke_5;
  v3[3] = &unk_1E95BCD00;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke_5(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindNewAlbum:info:", a1[4], a1[5], a1[6]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindNewAlbum:", a1[4], a1[5]);

}

void __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke_3;
  v3[3] = &unk_1E95BCD00;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindAlbumMetadataChange:info:", a1[4], a1[5], a1[6]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFindAlbumMetadataChange:", a1[4], a1[5]);

}

void __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  id obj;
  id v26;
  uint64_t v27;
  void *context;
  id v29;
  id v30;
  _QWORD block[6];
  int v32;
  _QWORD v33[6];
  int v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (!v3)
  {
    v5 = 0;
    goto LABEL_38;
  }
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v42;
  v7 = MEMORY[0x1E0C809B0];
  v23 = *(_QWORD *)v42;
  do
  {
    v8 = 0;
    v24 = v4;
    do
    {
      if (*(_QWORD *)v42 != v6)
        objc_enumerationMutation(obj);
      v9 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v8);
      context = (void *)MEMORY[0x1D8255C20]();
      v10 = *(void **)(a1 + 40);
      v39 = 0;
      v40 = 0;
      v11 = objc_msgSend(v10, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v9, &v40, 0, &v39, 0, 0, 0, 0);
      v30 = v40;
      v29 = v39;
      if (!v11)
      {
        objc_msgSend(*(id *)(a1 + 40), "eventQueue");
        v22 = objc_claimAutoreleasedReturnValue();
        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke_4;
        block[3] = &unk_1E95BC610;
        block[4] = *(_QWORD *)(a1 + 40);
        block[5] = v9;
        v32 = *(_DWORD *)(a1 + 48);
        dispatch_async(v22, block);
        goto LABEL_33;
      }
      if (v5 && (objc_msgSend(v29, "isEqualToString:", v5) & 1) == 0 && objc_msgSend(v2, "count"))
      {
        objc_msgSend(*(id *)(a1 + 40), "retrieveAssets:inAlbumWithGUID:", v2, v5);
        objc_msgSend(v2, "removeAllObjects");
      }
      v27 = v8;
      v26 = v29;

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(v30, "assets");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      if (!v13)
      {

        goto LABEL_32;
      }
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v19 = objc_msgSend(v18, "mediaAssetType");
          v20 = v19;
          v21 = *(_DWORD *)(a1 + 48);
          if (((v21 & 1) == 0 || v19 != 2) && ((v21 & 2) == 0 || v19 != 3))
          {
            if ((v21 & 2) != 0 && objc_msgSend(v30, "isPhotoIris") && v20 == 7)
              goto LABEL_25;
            if (v20 != 5)
              continue;
          }
          v15 = 1;
LABEL_25:
          objc_msgSend(v2, "addObject:", v18);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v14);

      v6 = v23;
      v4 = v24;
      v7 = MEMORY[0x1E0C809B0];
      if ((v15 & 1) != 0)
      {
        v5 = v26;
        v8 = v27;
        goto LABEL_34;
      }
LABEL_32:
      objc_msgSend(*(id *)(a1 + 40), "eventQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      v33[0] = v7;
      v33[1] = 3221225472;
      v33[2] = __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke_2;
      v33[3] = &unk_1E95BC610;
      v33[4] = *(_QWORD *)(a1 + 40);
      v33[5] = v9;
      v34 = *(_DWORD *)(a1 + 48);
      dispatch_async(v22, v33);
      v5 = v26;
      v8 = v27;
LABEL_33:

LABEL_34:
      objc_autoreleasePoolPop(context);
      ++v8;
    }
    while (v8 != v4);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  }
  while (v4);
LABEL_38:

  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "retrieveAssets:inAlbumWithGUID:", v2, v5);

}

uint64_t __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  __int128 v3;
  int v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke_3;
  v2[3] = &unk_1E95BC638;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_DWORD *)(a1 + 48);
  return objc_msgSend((id)v3, "eventQueuePerformBlockOnObservers:", v2);
}

uint64_t __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke_4(uint64_t a1)
{
  _QWORD v2[4];
  __int128 v3;
  int v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke_5;
  v2[3] = &unk_1E95BC638;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_DWORD *)(a1 + 48);
  return objc_msgSend((id)v3, "eventQueuePerformBlockOnObservers:", v2);
}

void __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFailToFindAssetsForAssetCollectionGUID:assetTypeFlags:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));

}

void __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFailToFindAssetsForAssetCollectionGUID:assetTypeFlags:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));

}

void __54__MSASServerSideModel_retrieveAssets_inAlbumWithGUID___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id obj;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x1D8255C20]();
        objc_msgSend(v6, "batchCreationDate");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(v6, "photoCreationDate");
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = (id)v9;
            v1 = (void *)v9;
LABEL_15:

            goto LABEL_16;
          }
          v1 = 0;
        }
        objc_msgSend(v6, "assetCollectionGUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {

        }
        if (v11)
        {
          v12 = *(void **)(a1 + 40);
          objc_msgSend(v6, "assetCollectionGUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0;
          v19 = 0;
          v14 = objc_msgSend(v12, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v13, 0, 0, 0, &v19, &v18, 0, 0);
          v8 = v19;
          v10 = v18;

          if (v14)
          {
            objc_msgSend(v6, "setBatchCreationDate:", v8);
            objc_msgSend(v6, "setPhotoCreationDate:", v10);
          }
          goto LABEL_15;
        }
LABEL_16:
        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v3);
  }

  objc_msgSend(*(id *)(a1 + 40), "stateMachine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "retrieveAssets:inAlbumWithGUID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

void __60__MSASServerSideModel_forgetEverythingInfo_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __60__MSASServerSideModel_forgetEverythingInfo_completionBlock___block_invoke_2;
  v11 = &unk_1E95BC5E8;
  v12 = v4;
  v5 = v3;
  v13 = v5;
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", &v8);
  objc_msgSend(*(id *)(a1 + 40), "observers", v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "eventQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v7, *(dispatch_block_t *)(a1 + 48));

  }
}

void __60__MSASServerSideModel_forgetEverythingInfo_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModelWillBeForgotten:info:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModelWillBeForgotten:", *(_QWORD *)(a1 + 32));

}

void __50__MSASServerSideModel_deleteCommentWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v21 = 0;
  v20 = 0;
  objc_msgSend(v4, "dbQueueLookupOrCreateCommentWithGUID:outAssetCollection:outAlbum:", v5, &v21, &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  v8 = v20;
  v9 = *(void **)(a1 + 40);
  if (v6)
    v10 = v7 == 0;
  else
    v10 = 1;
  if (v10 || v8 == 0)
  {
    objc_msgSend(v9, "eventQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__MSASServerSideModel_deleteCommentWithGUID_info___block_invoke_2;
    block[3] = &unk_1E95BCE80;
    block[4] = *(_QWORD *)(a1 + 40);
    v16 = v6;
    v17 = v7;
    v18 = v8;
    v19 = *(id *)(a1 + 32);
    dispatch_async(v12, block);

  }
  else
  {
    objc_msgSend(v9, "stateMachine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deleteComments:inAssetCollection:inAlbum:info:", v14, v7, v8, v3);

  }
  objc_msgSend(*(id *)(a1 + 40), "dbQueueDeleteCommentWithGUID:info:", *(_QWORD *)(a1 + 48), v3);

}

void __50__MSASServerSideModel_deleteCommentWithGUID_info___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__MSASServerSideModel_deleteCommentWithGUID_info___block_invoke_3;
  v3[3] = &unk_1E95BCDE8;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __50__MSASServerSideModel_deleteCommentWithGUID_info___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  id v18;

  v18 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = a1[6];
    v6 = a1[7];
    v7 = a1[8];
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MODEL_INVALID_COMMENT"));
    objc_msgSend(v8, "MSErrorWithDomain:code:description:", CFSTR("MSASModelErrorDomain"), 4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "MSASModel:didFinishDeletingComment:fromAssetCollection:inAlbum:info:error:", v3, v4, v5, v6, v7, v10);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = a1[4];
    v12 = a1[5];
    v14 = a1[6];
    v13 = a1[7];
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MODEL_INVALID_COMMENT"));
    objc_msgSend(v15, "MSErrorWithDomain:code:description:", CFSTR("MSASModelErrorDomain"), 4, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "MSASModel:didFinishDeletingComment:fromAssetCollection:inAlbum:error:", v11, v12, v14, v13, v17);

  }
}

void __66__MSASServerSideModel_addComments_toAssetCollectionWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  _QWORD block[4];
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v30 = 0;
  objc_msgSend(v4, "dbQueueLookupOrCreateAssetCollectionWithGUID:outAlbum:", v5, &v30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v30;
  v8 = *(void **)(a1 + 40);
  if (v7)
  {
    objc_msgSend(v8, "dbQueueBeginTransaction");
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = *(id *)(a1 + 56);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13);
          v15 = (void *)MEMORY[0x1D8255C20]();
          objc_msgSend(*(id *)(a1 + 40), "dbQueueSetComment:forAssetCollectionWithGUID:info:", v14, *(_QWORD *)(a1 + 48), v3);
          objc_autoreleasePoolPop(v15);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v11);
    }

    objc_msgSend(*(id *)(a1 + 40), "dbQueueEndTransaction");
    objc_msgSend(*(id *)(a1 + 40), "stateMachine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addComments:toAssetCollection:inAlbum:info:", *(_QWORD *)(a1 + 56), v6, v7, v3);
  }
  else
  {
    objc_msgSend(v8, "eventQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__MSASServerSideModel_addComments_toAssetCollectionWithGUID_info___block_invoke_2;
    block[3] = &unk_1E95BCE80;
    v18 = *(id *)(a1 + 56);
    v19 = *(_QWORD *)(a1 + 40);
    v21 = v18;
    v22 = v19;
    v23 = v6;
    v24 = 0;
    v25 = v3;
    dispatch_async(v17, block);

    v16 = v21;
  }

}

void __66__MSASServerSideModel_addComments_toAssetCollectionWithGUID_info___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;
  _QWORD v12[4];
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v19;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1D8255C20]();
        v12[0] = v5;
        v12[1] = 3221225472;
        v12[2] = __66__MSASServerSideModel_addComments_toAssetCollectionWithGUID_info___block_invoke_3;
        v12[3] = &unk_1E95BCDE8;
        v9 = *(void **)(a1 + 48);
        v13 = *(void **)(a1 + 40);
        v10 = v13;
        v14 = v7;
        v15 = v9;
        v16 = *(id *)(a1 + 56);
        v17 = *(id *)(a1 + 64);
        objc_msgSend(v10, "eventQueuePerformBlockOnObservers:", v12);

        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v3);
  }

}

void __66__MSASServerSideModel_addComments_toAssetCollectionWithGUID_info___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  id v18;

  v18 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = a1[6];
    v6 = a1[7];
    v7 = a1[8];
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MODEL_INVALID_ALBUM"));
    objc_msgSend(v8, "MSErrorWithDomain:code:description:", CFSTR("MSASModelErrorDomain"), 3, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "MSASModel:didFinishAddingComment:toAssetCollection:inAlbum:info:error:", v3, v4, v5, v6, v7, v10);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = a1[4];
    v12 = a1[5];
    v14 = a1[6];
    v13 = a1[7];
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MODEL_INVALID_ALBUM"));
    objc_msgSend(v15, "MSErrorWithDomain:code:description:", CFSTR("MSASModelErrorDomain"), 3, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "MSASModel:didFinishAddingComment:toAssetCollection:inAlbum:error:", v11, v12, v14, v13, v17);

  }
}

void __94__MSASServerSideModel_markCommentsForAssetCollectionWithGUID_asViewedWithLastViewedDate_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v28 = 0;
  v27 = 0;
  v7 = objc_msgSend(v5, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v6, &v28, 0, &v27, 0, 0, 0, 0);
  v8 = v28;
  v9 = v27;
  v10 = 0;
  if (v7)
  {
    v11 = *(void **)(a1 + 40);
    v26 = 0;
    v12 = objc_msgSend(v11, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v9, &v26, 0, 0, 0, 0, 0);
    v10 = v26;
    v13 = *(void **)(a1 + 40);
    if (v12)
    {
      objc_msgSend(v13, "dbQueueMaximumCommentIDForAssetCollectionWithGUID:", *(_QWORD *)(a1 + 48));
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
        v15 = (void *)v14;
      else
        v15 = &unk_1E95D3388;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v15, "intValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "dbQueueSetAssetCollectionMetadataAssetCollectionGUID:key:value:info:", *(_QWORD *)(a1 + 48), CFSTR("lastcommentposition"), v16, v3);
      objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("lastcommentposition"));
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 56), "timeIntervalSinceReferenceDate");
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%f"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "dbQueueSetAssetCollectionMetadataAssetCollectionGUID:key:value:info:", *(_QWORD *)(a1 + 48), CFSTR("lastcommenttimestamp"), v19, v3);
      objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("lastcommenttimestamp"));
      objc_msgSend(*(id *)(a1 + 40), "stateMachine");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAssetCollectionSyncedState:forAssetCollection:album:info:", v4, v8, v10, v3);

    }
    else
    {
      objc_msgSend(v13, "eventQueue");
      v21 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __94__MSASServerSideModel_markCommentsForAssetCollectionWithGUID_asViewedWithLastViewedDate_info___block_invoke_246;
      block[3] = &unk_1E95BCE58;
      block[4] = *(_QWORD *)(a1 + 40);
      v23 = v8;
      v10 = v10;
      v24 = v10;
      v25 = v3;
      dispatch_async(v21, block);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "dbQueueSetUnviewedState:onAssetCollectionWithGUID:info:", 0, *(_QWORD *)(a1 + 48), v3);

}

void __94__MSASServerSideModel_markCommentsForAssetCollectionWithGUID_asViewedWithLastViewedDate_info___block_invoke_246(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __94__MSASServerSideModel_markCommentsForAssetCollectionWithGUID_asViewedWithLastViewedDate_info___block_invoke_2;
  v3[3] = &unk_1E95BCD70;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __94__MSASServerSideModel_markCommentsForAssetCollectionWithGUID_asViewedWithLastViewedDate_info___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFinishMarkingCommentsAsViewedInAssetCollection:inAlbum:info:error:", a1[4], a1[5], a1[6], a1[7], 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFinishMarkingCommentsAsViewedInAssetCollection:inAlbum:error:", a1[4], a1[5], a1[6], 0);

}

void __55__MSASServerSideModel_deleteAssetCollectionsWithGUIDs___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  id v35;
  int v36;
  _QWORD block[6];
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v3)
  {
    v4 = v3;
    v29 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        v7 = *(void **)(a1 + 40);
        v38 = 0;
        v39 = 0;
        v8 = objc_msgSend(v7, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v6, &v39, 0, &v38, 0, 0, 0, 0);
        v9 = v39;
        v10 = v38;
        v11 = MEMORY[0x1E0C809B0];
        if (v8)
        {
          objc_msgSend(v2, "objectForKey:", v10);
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v12 = objc_claimAutoreleasedReturnValue();
          }
          -[NSObject addObject:](v12, "addObject:", v9);
          objc_msgSend(v2, "setObject:forKey:", v12, v10);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "eventQueue");
          v12 = objc_claimAutoreleasedReturnValue();
          block[0] = v11;
          block[1] = 3221225472;
          block[2] = __55__MSASServerSideModel_deleteAssetCollectionsWithGUIDs___block_invoke_2;
          block[3] = &unk_1E95BCFC0;
          block[4] = *(_QWORD *)(a1 + 40);
          block[5] = v6;
          dispatch_async(v12, block);
        }

        v13 = v11;
        objc_msgSend(*(id *)(a1 + 40), "dbQueueDeleteAssetCollectionWithGUID:info:", v6, 0);
        objc_msgSend(*(id *)(a1 + 40), "dbQueueLookupOrCreateAlbumWithGUID:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(void **)(a1 + 40);
        objc_msgSend(v14, "GUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v15) = objc_msgSend(v15, "dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:", v16);

        objc_msgSend(*(id *)(a1 + 40), "eventQueue");
        v17 = objc_claimAutoreleasedReturnValue();
        v34[0] = v13;
        v34[1] = 3221225472;
        v34[2] = __55__MSASServerSideModel_deleteAssetCollectionsWithGUIDs___block_invoke_4;
        v34[3] = &unk_1E95BC610;
        v34[4] = *(_QWORD *)(a1 + 40);
        v35 = v14;
        v36 = (int)v15;
        v18 = v14;
        dispatch_async(v17, v34);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v4);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v2, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 40), "dbQueueLookupOrCreateAlbumWithGUID:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "objectForKey:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "stateMachine");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "deleteAssetCollections:inAlbum:info:", v26, v25, 0);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
    }
    while (v21);
  }

}

uint64_t __55__MSASServerSideModel_deleteAssetCollectionsWithGUIDs___block_invoke_2(int8x16_t *a1)
{
  int8x16_t v1;
  _QWORD v3[4];
  int8x16_t v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__MSASServerSideModel_deleteAssetCollectionsWithGUIDs___block_invoke_3;
  v3[3] = &unk_1E95BC5E8;
  v1 = a1[2];
  v4 = vextq_s8(v1, v1, 8uLL);
  return objc_msgSend((id)v1.i64[0], "eventQueuePerformBlockOnObservers:", v3);
}

uint64_t __55__MSASServerSideModel_deleteAssetCollectionsWithGUIDs___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum:unviewedCount:info:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), 0);
}

void __55__MSASServerSideModel_deleteAssetCollectionsWithGUIDs___block_invoke_3(uint64_t a1, void *a2)
{
  MSASAssetCollection *v3;
  void *v4;
  void *v5;
  MSASAssetCollection *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_alloc_init(MSASAssetCollection);
    -[MSASAssetCollection setGUID:](v3, "setGUID:", *(_QWORD *)(a1 + 32));
    v4 = *(void **)(a1 + 40);
    objc_msgSend(v4, "_invalidAssetCollectionGUIDErrorwithGUID:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "MSASModel:didFinishDeletingAssetCollection:fromAlbum:info:error:", v4, v3, 0, 0, v5);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_alloc_init(MSASAssetCollection);
    -[MSASAssetCollection setGUID:](v6, "setGUID:", *(_QWORD *)(a1 + 32));
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v7, "_invalidAssetCollectionGUIDErrorwithGUID:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "MSASModel:didFinishDeletingAssetCollection:fromAlbum:error:", v7, v6, 0, v8);

  }
}

void __58__MSASServerSideModel_deleteAssetCollectionWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  int v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v28 = 0;
  v29 = 0;
  v6 = objc_msgSend(v4, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v5, &v29, 0, &v28, 0, 0, 0, 0);
  v7 = v29;
  v8 = v28;
  v9 = *(void **)(a1 + 40);
  v10 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    objc_msgSend(v9, "dbQueueLookupOrCreateAlbumWithGUID:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "stateMachine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deleteAssetCollections:inAlbum:info:", v13, v11, v3);

  }
  else
  {
    objc_msgSend(v9, "eventQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __58__MSASServerSideModel_deleteAssetCollectionWithGUID_info___block_invoke_2;
    block[3] = &unk_1E95BCE30;
    v15 = *(void **)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 40);
    v26 = v15;
    v27 = v3;
    dispatch_async(v14, block);

    v11 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "dbQueueDeleteAssetCollectionWithGUID:info:", *(_QWORD *)(a1 + 48), v3);
  v16 = *(void **)(a1 + 40);
  objc_msgSend(v11, "GUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v16, "dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:", v17);

  objc_msgSend(*(id *)(a1 + 40), "eventQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __58__MSASServerSideModel_deleteAssetCollectionWithGUID_info___block_invoke_4;
  v21[3] = &unk_1E95BC488;
  v19 = *(void **)(a1 + 32);
  v21[4] = *(_QWORD *)(a1 + 40);
  v22 = v11;
  v24 = (int)v16;
  v23 = v19;
  v20 = v11;
  dispatch_async(v18, v21);

}

void __58__MSASServerSideModel_deleteAssetCollectionWithGUID_info___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__MSASServerSideModel_deleteAssetCollectionWithGUID_info___block_invoke_3;
  v5[3] = &unk_1E95BCD00;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "eventQueuePerformBlockOnObservers:", v5);

}

uint64_t __58__MSASServerSideModel_deleteAssetCollectionWithGUID_info___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum:unviewedCount:info:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __58__MSASServerSideModel_deleteAssetCollectionWithGUID_info___block_invoke_3(_QWORD *a1, void *a2)
{
  MSASAssetCollection *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  MSASAssetCollection *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_alloc_init(MSASAssetCollection);
    -[MSASAssetCollection setGUID:](v3, "setGUID:", a1[4]);
    v5 = (void *)a1[5];
    v4 = a1[6];
    objc_msgSend(v5, "_invalidAssetCollectionGUIDErrorwithGUID:", a1[4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishDeletingAssetCollection:fromAlbum:info:error:", v5, v3, 0, v4, v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_alloc_init(MSASAssetCollection);
    -[MSASAssetCollection setGUID:](v7, "setGUID:", a1[4]);
    v8 = (void *)a1[5];
    objc_msgSend(v8, "_invalidAssetCollectionGUIDErrorwithGUID:", a1[4]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishDeletingAssetCollection:fromAlbum:error:", v8, v7, 0, v9);

  }
}

void __64__MSASServerSideModel_addAssetCollections_toAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "dbQueueLookupOrCreateAlbumWithGUID:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dbQueueBeginTransaction");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = *(id *)(a1 + 56);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D8255C20]();
        objc_msgSend(*(id *)(a1 + 40), "dbQueueSetAssetCollection:inAlbumWithGUID:info:", v10, *(_QWORD *)(a1 + 48), v3);
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 40), "dbQueueEndTransaction");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = *(id *)(a1 + 56);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x1D8255C20](v14);
        objc_msgSend(v12, "addObject:", v18, (_QWORD)v23);
        if ((unint64_t)objc_msgSend(v12, "count") >= 0x1E)
        {
          objc_msgSend(*(id *)(a1 + 40), "stateMachine");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addAssetCollections:toAlbum:info:", v12, v4, v3);

          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 30);
          v21 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v21;
        }
        objc_autoreleasePoolPop(v19);
        ++v17;
      }
      while (v15 != v17);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      v15 = v14;
    }
    while (v14);
  }

  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "stateMachine");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAssetCollections:toAlbum:info:", v12, v4, v3);

  }
}

void __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  char v10;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "dbQueueLookupOrCreateAlbumWithGUID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int8 *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_2;
  v6[3] = &unk_1E95BC580;
  objc_copyWeak(&v9, &location);
  v10 = *(_BYTE *)(a1 + 64);
  v8 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v3, "setMultipleContributorsEnabled:forAlbum:info:completionBlock:", v4, v2, v5, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  const __CFString *v10;
  __CFString *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (v6)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    if (*(_BYTE *)(a1 + 56))
      v10 = CFSTR("ERROR_MODEL_CANNOT_SET_MULTIPLECONTRIBUTORS");
    else
      v10 = CFSTR("ERROR_MODEL_CANNOT_UNSET_MULTIPLECONTRIBUTORS");
    v11 = (__CFString *)MSCFCopyLocalizedString(v10);
    objc_msgSend(v9, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASModelErrorDomain"), 7, v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "eventQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_3;
    block[3] = &unk_1E95BC528;
    v14 = *(id *)(a1 + 40);
    v29 = v12;
    v30 = v14;
    v28 = v5;
    v15 = v12;
    v16 = v5;
    dispatch_async(v13, block);

  }
  else
  {
    objc_msgSend(WeakRetained, "dbQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_4;
    v20[3] = &unk_1E95BC558;
    objc_copyWeak(&v25, (id *)(a1 + 48));
    v18 = *(id *)(a1 + 32);
    v26 = *(_BYTE *)(a1 + 56);
    v21 = v18;
    v22 = v5;
    v23 = v8;
    v24 = *(id *)(a1 + 40);
    v19 = v5;
    dispatch_async(v17, v20);

    objc_destroyWeak(&v25);
  }

}

uint64_t __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  int v5;
  id v6;
  const __CFString *v7;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  v5 = objc_msgSend(WeakRetained, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v4, &v13, 0, 0, 0, 0, 0);
  v6 = v13;

  if (v5)
  {
    if (*(_BYTE *)(a1 + 72))
      v7 = CFSTR("1");
    else
      v7 = CFSTR("0");
    objc_msgSend(v6, "setMetadataValue:forKey:", v7, CFSTR("allowcontributions"));
    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "dbQueueSetAlbum:info:", v6, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 48), "eventQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_5;
  block[3] = &unk_1E95BCF98;
  v12 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  dispatch_async(v9, block);

}

uint64_t __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __87__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  char v10;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "dbQueueLookupOrCreateAlbumWithGUID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int8 *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_2;
  v6[3] = &unk_1E95BC580;
  objc_copyWeak(&v9, &location);
  v10 = *(_BYTE *)(a1 + 64);
  v8 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v3, "setPublicAccessEnabled:forAlbum:info:completionBlock:", v4, v2, v5, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  const __CFString *v10;
  __CFString *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (v6)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    if (*(_BYTE *)(a1 + 56))
      v10 = CFSTR("ERROR_MODEL_CANNOT_SET_PUBLIC");
    else
      v10 = CFSTR("ERROR_MODEL_CANNOT_UNSET_PUBLIC");
    v11 = (__CFString *)MSCFCopyLocalizedString(v10);
    objc_msgSend(v9, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASModelErrorDomain"), 6, v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "eventQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_3;
    block[3] = &unk_1E95BC528;
    v14 = *(id *)(a1 + 40);
    v29 = v12;
    v30 = v14;
    v28 = v5;
    v15 = v12;
    v16 = v5;
    dispatch_async(v13, block);

  }
  else
  {
    objc_msgSend(WeakRetained, "dbQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_4;
    v20[3] = &unk_1E95BC558;
    objc_copyWeak(&v25, (id *)(a1 + 48));
    v18 = *(id *)(a1 + 32);
    v26 = *(_BYTE *)(a1 + 56);
    v21 = v18;
    v22 = v5;
    v23 = v8;
    v24 = *(id *)(a1 + 40);
    v19 = v5;
    dispatch_async(v17, v20);

    objc_destroyWeak(&v25);
  }

}

uint64_t __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  int v5;
  id v6;
  const __CFString *v7;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  v5 = objc_msgSend(WeakRetained, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v4, &v13, 0, 0, 0, 0, 0);
  v6 = v13;

  if (v5)
  {
    if (*(_BYTE *)(a1 + 72))
      v7 = CFSTR("1");
    else
      v7 = CFSTR("0");
    objc_msgSend(v6, "setMetadataValue:forKey:", v7, CFSTR("ispublic"));
    objc_msgSend(v6, "setPublicURLString:", 0);
    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "dbQueueSetAlbum:info:", v6, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 48), "eventQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_5;
  block[3] = &unk_1E95BCF98;
  v12 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  dispatch_async(v9, block);

}

uint64_t __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __79__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__MSASServerSideModel_removeAccessControlEntryWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v19 = 0;
  v20 = 0;
  v6 = objc_msgSend(v4, "dbQueueAccessControlWithGUID:outObject:outAlbumGUID:outEmail:outUserInfoData:", v5, &v20, &v19, 0, 0);
  v7 = v20;
  v8 = v19;
  v9 = *(void **)(a1 + 40);
  if (v6)
  {
    objc_msgSend(v7, "albumGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dbQueueLookupOrCreateAlbumWithGUID:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "dbQueueDeleteAccessControlWithGUID:info:", *(_QWORD *)(a1 + 48), v3);
    objc_msgSend(*(id *)(a1 + 40), "stateMachine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeSharingRelationships:fromOwnedAlbum:info:", v13, v11, v3);

    v8 = (id)v11;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "eventQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__MSASServerSideModel_removeAccessControlEntryWithGUID_info___block_invoke_2;
    block[3] = &unk_1E95BCE30;
    v15 = *(void **)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 40);
    v17 = v15;
    v18 = v3;
    dispatch_async(v14, block);

  }
}

void __61__MSASServerSideModel_removeAccessControlEntryWithGUID_info___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__MSASServerSideModel_removeAccessControlEntryWithGUID_info___block_invoke_3;
  v5[3] = &unk_1E95BCD00;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "eventQueuePerformBlockOnObservers:", v5);

}

void __61__MSASServerSideModel_removeAccessControlEntryWithGUID_info___block_invoke_3(_QWORD *a1, void *a2)
{
  MSASSharingRelationship *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  MSASSharingRelationship *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_alloc_init(MSASSharingRelationship);
    -[MSASSharingRelationship setGUID:](v3, "setGUID:", a1[4]);
    v5 = (void *)a1[5];
    v4 = a1[6];
    objc_msgSend(v5, "_invalidAccessControlGUIDErrorwithGUID:", a1[4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishRemovingAccessControlEntry:fromAlbum:info:error:", v5, v3, 0, v4, v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_alloc_init(MSASSharingRelationship);
    -[MSASSharingRelationship setGUID:](v7, "setGUID:", a1[4]);
    v8 = (void *)a1[5];
    objc_msgSend(v8, "_invalidAccessControlGUIDErrorwithGUID:", a1[4]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishRemovingAccessControlEntry:fromAlbum:error:", v8, v7, 0, v9);

  }
}

void __68__MSASServerSideModel_addAccessControlEntries_toAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "dbQueueLookupOrCreateAlbumWithGUID:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = *(id *)(a1 + 56);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9++), "setAlbumGUID:", *(_QWORD *)(a1 + 48));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 40), "dbQueueBeginTransaction");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = *(id *)(a1 + 56);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1D8255C20](v11);
        objc_msgSend(*(id *)(a1 + 40), "dbQueueSetAccessControl:info:", v15, v3, (_QWORD)v18);
        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v12 != v14);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      v12 = v11;
    }
    while (v11);
  }

  objc_msgSend(*(id *)(a1 + 40), "dbQueueEndTransaction");
  objc_msgSend(*(id *)(a1 + 40), "stateMachine");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSharingRelationships:toOwnedAlbum:info:", *(_QWORD *)(a1 + 56), v4, v3);

}

void __92__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForToken_info_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "eventQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForToken_info_error___block_invoke_2;
  v4[3] = &unk_1E95BCE58;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  dispatch_async(v2, v4);

}

void __92__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForToken_info_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __92__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForToken_info_error___block_invoke_3;
  v3[3] = &unk_1E95BCD70;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __92__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForToken_info_error___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)a1[4];
    v4 = a1[5];
    v5 = a1[6];
    objc_msgSend(v3, "_protocolErrorForUnderlyingError:", a1[7]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "MSASModel:didFinishMarkingAsSpamInvitationWithToken:info:error:", v3, v4, v5, v6);

  }
}

void __58__MSASServerSideModel_markAsSpamInvitationWithToken_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markAsSpamInvitationForToken:info:", *(_QWORD *)(a1 + 48), v4);

}

void __107__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForAlbum_invitationGUID_info_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "eventQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __107__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForAlbum_invitationGUID_info_error___block_invoke_2;
  v4[3] = &unk_1E95BCE58;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  dispatch_async(v2, v4);

}

void __107__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForAlbum_invitationGUID_info_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __107__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForAlbum_invitationGUID_info_error___block_invoke_3;
  v5[3] = &unk_1E95BCD70;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v2, "eventQueuePerformBlockOnObservers:", v5);

}

void __107__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForAlbum_invitationGUID_info_error___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setGUID:", a1[4]);
    v4 = (void *)a1[5];
    v5 = a1[6];
    objc_msgSend(v4, "_protocolErrorForUnderlyingError:", a1[7]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "MSASModel:didFinishMarkingAsSpamInvitation:info:error:", v4, v3, v5, v6);

  }
}

void __57__MSASServerSideModel_markAsSpamInvitationWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v20 = 0;
  v21 = 0;
  v6 = objc_msgSend(v4, "dbQueueInvitationWithGUID:outObject:outAlbumGUID:outEmail:outUserInfoData:", v5, &v21, &v20, 0, 0);
  v7 = v21;
  v8 = v20;
  v9 = *(void **)(a1 + 40);
  if (v6)
  {
    objc_msgSend(v7, "albumGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dbQueueLookupOrCreateAlbumWithGUID:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = *(void **)(a1 + 40);
    objc_msgSend(v7, "albumGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dbQueueDeleteAlbumWithGUID:info:", v13, v3);

    objc_msgSend(*(id *)(a1 + 40), "dbQueueDeleteInvitationWithGUID:info:", *(_QWORD *)(a1 + 48), v3);
    objc_msgSend(*(id *)(a1 + 40), "stateMachine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "markAsSpamInvitationForAlbum:invitationGUID:info:", v11, *(_QWORD *)(a1 + 48), v3);

    v8 = (id)v11;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "eventQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__MSASServerSideModel_markAsSpamInvitationWithGUID_info___block_invoke_2;
    block[3] = &unk_1E95BCE30;
    v16 = *(void **)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 40);
    v18 = v16;
    v19 = v3;
    dispatch_async(v15, block);

  }
}

void __57__MSASServerSideModel_markAsSpamInvitationWithGUID_info___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__MSASServerSideModel_markAsSpamInvitationWithGUID_info___block_invoke_3;
  v5[3] = &unk_1E95BCD00;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "eventQueuePerformBlockOnObservers:", v5);

}

void __57__MSASServerSideModel_markAsSpamInvitationWithGUID_info___block_invoke_3(_QWORD *a1, void *a2)
{
  MSASInvitation *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_alloc_init(MSASInvitation);
    -[MSASSharingRelationship setGUID:](v3, "setGUID:", a1[4]);
    v5 = (void *)a1[5];
    v4 = a1[6];
    objc_msgSend(v5, "_invalidInvitationGUIDErrorWithGUID:", a1[4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "MSASModel:didFinishMarkingAsSpamInvitation:info:error:", v5, v3, v4, v6);

  }
}

void __52__MSASServerSideModel_markAsSpamAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "dbQueueLookupOrCreateAlbumWithGUID:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dbQueueDeleteAlbumWithGUID:info:", *(_QWORD *)(a1 + 48), v5);
  objc_msgSend(*(id *)(a1 + 40), "dbQueueDeleteInvitationForAlbumWithGUID:info:", *(_QWORD *)(a1 + 48), v5);
  objc_msgSend(*(id *)(a1 + 40), "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markAsSpamInvitationForAlbum:invitationGUID:info:", v3, 0, v5);

}

void __53__MSASServerSideModel_rejectInvitationWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v23 = 0;
  v6 = objc_msgSend(v4, "dbQueueInvitationWithGUID:outObject:outAlbumGUID:outEmail:outUserInfoData:", v5, &v23, 0, 0, 0);
  v7 = v23;
  v8 = v7;
  v9 = *(void **)(a1 + 40);
  if (v6)
  {
    objc_msgSend(v7, "albumGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dbQueueLookupOrCreateAlbumWithGUID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryWithObject:forKey:", v13, CFSTR("subscriptionMethod"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContext:", v14);

    v15 = *(void **)(a1 + 40);
    objc_msgSend(v8, "albumGUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dbQueueDeleteAlbumWithGUID:info:", v16, v3);

    objc_msgSend(*(id *)(a1 + 40), "dbQueueDeleteInvitationWithGUID:info:", *(_QWORD *)(a1 + 48), v3);
    objc_msgSend(*(id *)(a1 + 40), "stateMachine");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unsubscribeFromAlbum:info:", v11, v3);

    v8 = v11;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "eventQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __53__MSASServerSideModel_rejectInvitationWithGUID_info___block_invoke_2;
    v20[3] = &unk_1E95BCE30;
    v19 = *(void **)(a1 + 48);
    v20[4] = *(_QWORD *)(a1 + 40);
    v21 = v19;
    v22 = v3;
    dispatch_async(v18, v20);

  }
}

void __53__MSASServerSideModel_rejectInvitationWithGUID_info___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__MSASServerSideModel_rejectInvitationWithGUID_info___block_invoke_3;
  v5[3] = &unk_1E95BCD00;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "eventQueuePerformBlockOnObservers:", v5);

}

void __53__MSASServerSideModel_rejectInvitationWithGUID_info___block_invoke_3(_QWORD *a1, void *a2)
{
  MSASInvitation *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  MSASInvitation *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_alloc_init(MSASInvitation);
    -[MSASSharingRelationship setGUID:](v3, "setGUID:", a1[4]);
    v5 = (void *)a1[5];
    v4 = a1[6];
    objc_msgSend(v5, "_invalidInvitationGUIDErrorWithGUID:", a1[4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishRejectingInvitation:info:error:", v5, v3, v4, v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_alloc_init(MSASInvitation);
    -[MSASSharingRelationship setGUID:](v7, "setGUID:", a1[4]);
    v8 = (void *)a1[5];
    objc_msgSend(v8, "_invalidInvitationGUIDErrorWithGUID:", a1[4]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishRejectingInvitation:error:", v8, v7, v9);

  }
}

void __53__MSASServerSideModel_acceptInvitationWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v21 = 0;
  v22 = 0;
  v6 = objc_msgSend(v4, "dbQueueInvitationWithGUID:outObject:outAlbumGUID:outEmail:outUserInfoData:", v5, &v22, &v21, 0, 0);
  v7 = v22;
  v8 = v21;
  v9 = *(void **)(a1 + 40);
  if (v6)
  {
    objc_msgSend(v7, "albumGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dbQueueLookupOrCreateAlbumWithGUID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryWithObject:forKey:", v13, CFSTR("subscriptionMethod"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContext:", v14);

    objc_msgSend(v7, "setState:", 2);
    objc_msgSend(*(id *)(a1 + 40), "dbQueueSetInvitation:info:", v7, v3);
    objc_msgSend(*(id *)(a1 + 40), "stateMachine");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "subscribeToAlbum:info:", v11, v3);

    v8 = v11;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "eventQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__MSASServerSideModel_acceptInvitationWithGUID_info___block_invoke_2;
    block[3] = &unk_1E95BCE30;
    v17 = *(void **)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 40);
    v19 = v17;
    v20 = v3;
    dispatch_async(v16, block);

  }
}

void __53__MSASServerSideModel_acceptInvitationWithGUID_info___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__MSASServerSideModel_acceptInvitationWithGUID_info___block_invoke_3;
  v5[3] = &unk_1E95BCD00;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "eventQueuePerformBlockOnObservers:", v5);

}

void __53__MSASServerSideModel_acceptInvitationWithGUID_info___block_invoke_3(_QWORD *a1, void *a2)
{
  MSASInvitation *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  MSASInvitation *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_alloc_init(MSASInvitation);
    -[MSASSharingRelationship setGUID:](v3, "setGUID:", a1[4]);
    v5 = (void *)a1[5];
    v4 = a1[6];
    objc_msgSend(v5, "_invalidInvitationGUIDErrorWithGUID:", a1[4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishAcceptingInvitation:forAlbum:info:error:", v5, v3, 0, v4, v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_alloc_init(MSASInvitation);
    -[MSASSharingRelationship setGUID:](v7, "setGUID:", a1[4]);
    v8 = (void *)a1[5];
    objc_msgSend(v8, "_invalidInvitationGUIDErrorWithGUID:", a1[4]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASModel:didFinishAcceptingInvitation:forAlbum:error:", v8, v7, 0, v9);

  }
}

void __66__MSASServerSideModel_validateInvitationForAlbum_completionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "eventQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MSASServerSideModel_validateInvitationForAlbum_completionBlock___block_invoke_2;
  block[3] = &unk_1E95BCF70;
  v9 = v5;
  v10 = *(id *)(a1 + 40);
  v11 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

void __66__MSASServerSideModel_validateInvitationForAlbum_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MODEL_INVALID_INVITATION"));
    objc_msgSend(v2, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASModelErrorDomain"), 5, v3, *(_QWORD *)(a1 + 32));
    v4 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __70__MSASServerSideModel_acceptInvitationWithToken_info_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "eventQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MSASServerSideModel_acceptInvitationWithToken_info_completionBlock___block_invoke_2;
  block[3] = &unk_1E95BC528;
  v12 = v6;
  v8 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

void __70__MSASServerSideModel_acceptInvitationWithToken_info_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MODEL_INVALID_INVITATION"));
    objc_msgSend(v2, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASModelErrorDomain"), 5, v3, *(_QWORD *)(a1 + 32));
    v4 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __65__MSASServerSideModel_acceptInvitationWithToken_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__MSASServerSideModel_unsubscribeFromAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "dbQueueLookupOrCreateAlbumWithGUID:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dbQueueDeleteAlbumWithGUID:info:", *(_QWORD *)(a1 + 48), v5);
  objc_msgSend(*(id *)(a1 + 40), "dbQueueDeleteInvitationForAlbumWithGUID:info:", *(_QWORD *)(a1 + 48), v5);
  objc_msgSend(*(id *)(a1 + 40), "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unsubscribeFromAlbum:info:", v3, v5);

}

void __53__MSASServerSideModel_subscribeToAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "dbQueueLookupOrCreateAlbumWithGUID:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribeToAlbum:info:", v3, v5);

}

void __86__MSASServerSideModel_markAlbumGUIDAsViewed_moveLastViewedAssetCollectionMarker_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  NSObject *v20;
  _QWORD block[5];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  int v27;
  id v28;
  id v29;
  id v30;
  id v31;

  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v30 = 0;
  v31 = 0;
  v29 = 0;
  v6 = objc_msgSend(v4, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v5, &v31, 0, &v30, &v29, 0, 0);
  v7 = v31;
  v8 = v30;
  v9 = v29;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "dbQueueSetAlbumMetadataAlbumGUID:key:value:info:", *(_QWORD *)(a1 + 48), CFSTR("lastviewedctag"), v8, v3);
    objc_msgSend(*(id *)(a1 + 40), "dbQueueSetUnviewedState:onAlbumWithGUID:info:", 0, *(_QWORD *)(a1 + 48), v3);
    v11 = v9;
    if (v9 || (v11 = v8) != 0)
      objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("lastviewedctag"));
    v12 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(v12, "dbQueueMaximumPhotoNumberForAlbumWithGUID:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v14, "longLongValue"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "dbQueueSetAlbumMetadataAlbumGUID:key:value:info:", *(_QWORD *)(a1 + 48), CFSTR("lastassetposition"), v16, v3);
        objc_msgSend(v10, "setObject:forKey:", v16, CFSTR("lastassetposition"));

      }
    }
    else
    {
      v28 = 0;
      v18 = objc_msgSend(v12, "dbQueueAlbumMetadataWithAlbumGUID:key:outValue:", v13, CFSTR("lastassetposition"), &v28);
      v15 = v28;
      if (v18)
        objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("lastassetposition"));
    }

    objc_msgSend(*(id *)(a1 + 40), "stateMachine");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAlbumSyncedState:forAlbum:info:", v10, v7, v3);

    LODWORD(v19) = objc_msgSend(*(id *)(a1 + 40), "dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "eventQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __86__MSASServerSideModel_markAlbumGUIDAsViewed_moveLastViewedAssetCollectionMarker_info___block_invoke_2;
    v24[3] = &unk_1E95BC488;
    v24[4] = *(_QWORD *)(a1 + 40);
    v25 = v7;
    v27 = (int)v19;
    v26 = v3;
    dispatch_async(v20, v24);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "eventQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__MSASServerSideModel_markAlbumGUIDAsViewed_moveLastViewedAssetCollectionMarker_info___block_invoke_3;
    block[3] = &unk_1E95BCE30;
    block[4] = *(_QWORD *)(a1 + 40);
    v22 = v7;
    v23 = v3;
    dispatch_async(v17, block);

  }
}

uint64_t __86__MSASServerSideModel_markAlbumGUIDAsViewed_moveLastViewedAssetCollectionMarker_info___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum:unviewedCount:info:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __86__MSASServerSideModel_markAlbumGUIDAsViewed_moveLastViewedAssetCollectionMarker_info___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __86__MSASServerSideModel_markAlbumGUIDAsViewed_moveLastViewedAssetCollectionMarker_info___block_invoke_4;
  v3[3] = &unk_1E95BCD00;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "eventQueuePerformBlockOnObservers:", v3);

}

void __86__MSASServerSideModel_markAlbumGUIDAsViewed_moveLastViewedAssetCollectionMarker_info___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFinishMarkingAlbumAsViewed:info:error:", a1[4], a1[5], a1[6], 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModel:didFinishMarkingAlbumAsViewed:error:", a1[4], a1[5], 0);

}

void __48__MSASServerSideModel_deleteAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  id v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v14 = 0;
  v6 = objc_msgSend(v4, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v5, &v14, 0, 0, 0, 0, 0);
  v7 = v14;
  if ((v6 & 1) == 0)
  {
    +[MSASAlbum album](MSASAlbum, "album");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setGUID:", *(_QWORD *)(a1 + 48));
    v7 = v8;
  }
  if (objc_msgSend(v7, "relationshipState"))
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__MSASServerSideModel_deleteAlbumWithGUID_info___block_invoke_2;
    block[3] = &unk_1E95BCFC0;
    v10 = *(void **)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 40);
    v13 = v10;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "dbQueueDeleteAlbumWithGUID:info:", *(_QWORD *)(a1 + 48), v3);
    objc_msgSend(*(id *)(a1 + 40), "stateMachine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteAlbum:info:", v7, v3);

  }
}

uint64_t __48__MSASServerSideModel_deleteAlbumWithGUID_info___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unsubscribeFromAlbumWithGUID:", *(_QWORD *)(a1 + 40));
}

void __48__MSASServerSideModel_modifyAlbumMetadata_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASAddIsLocalChange");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "GUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dbQueueLookupOrCreateAlbumWithGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMetadata:", v6);

  objc_msgSend(*(id *)(a1 + 40), "dbQueueSetAlbum:info:", v5, v8);
  objc_msgSend(*(id *)(a1 + 40), "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateAlbum:updateAlbumFlags:info:", v5, 0, v8);

}

void __37__MSASServerSideModel_addAlbum_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dbQueueSetAlbum:info:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createAlbum:info:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __69__MSASServerSideModel_refreshAccessControlListForAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dbQueueLookupOrCreateAlbumWithGUID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __80__MSASServerSideModel_refreshCommentsForAssetCollectionWithGUID_resetSync_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  v5 = (id)objc_msgSend(v2, "dbQueueLookupOrCreateAssetCollectionWithGUID:outAlbum:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  if (!*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "dbQueueMaximumCommentIDForAssetCollectionWithGUID:", *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __68__MSASServerSideModel_refreshContentOfAlbumWithGUID_resetSync_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v8 = 0;
  v4 = objc_msgSend(v2, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v3, &v8, 0, 0, 0, 0, 0);
  v5 = v8;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "stateMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "checkForUpdatesInAlbums:resetSync:info:", v7, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

  }
}

uint64_t __35__MSASServerSideModel__reconstruct__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__MSASServerSideModel__reconstruct__block_invoke_2;
  v3[3] = &unk_1E95BC240;
  v3[4] = v1;
  return objc_msgSend(v1, "eventQueuePerformBlockOnObservers:", v3);
}

void __35__MSASServerSideModel__reconstruct__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModelDidDeleteAllAlbumsInAlbumList:", *(_QWORD *)(a1 + 32));

}

void __34__MSASServerSideModel_reconstruct__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scheduleEvent:assetCollectionGUID:albumGUID:info:", CFSTR("reconstruct"), 0, 0, 0);

}

void __79__MSASServerSideModel_MSASStateMachineDidUpdateServerCommunicationBackoffDate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MSASModelDidUpdateServerCommunicationBackoffDateNotification"), *(_QWORD *)(a1 + 32));

}

void __50__MSASServerSideModel_userInfoForCommentWithGUID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v9 = 0;
  v4 = objc_msgSend(v2, "dbQueueCommentWithGUID:outObject:outID:outTimestamp:outAssetCollectionGUID:outIsCaption:outUserInfoData:", v3, 0, 0, 0, 0, 0, &v9);
  v5 = v9;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "MSSafeUnarchiveObjectWithData:outError:", v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __54__MSASServerSideModel_setUserInfo_forCommentWithGUID___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("update or ignore Comments set userInfo = ? where GUID = ?;"));
  v3 = *(_QWORD *)(a1 + 40);
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  v6 = v5;
  if (v4)
  {
    v7 = MSSqliteBindDataOrNull(v2, 1, v4);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Failed to archive a userInfo object. Error: %@ Info: %@"), v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v10;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    v7 = sqlite3_bind_null(v2, 1);
  }
  v11 = v7;
  MSSqliteTrapForDBLockError(v7);
  if (!v11)
  {
    v12 = MSSqliteBindStringOrNull(v2, 2, *(id *)(a1 + 48));
    v13 = v12;
    MSSqliteTrapForDBLockError(v12);
    if (!v13)
    {
      v14 = sqlite3_step(v2);
      MSSqliteTrapForDBLockError(v14);
    }
  }

  if (v2)
    sqlite3_reset(v2);
}

void __53__MSASServerSideModel_userInfoForInvitationWithGUID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v9 = 0;
  v4 = objc_msgSend(v2, "dbQueueInvitationWithGUID:outObject:outAlbumGUID:outEmail:outUserInfoData:", v3, 0, 0, 0, &v9);
  v5 = v9;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "MSSafeUnarchiveObjectWithData:outError:", v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __57__MSASServerSideModel_setUserInfo_forInvitationWithGUID___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("update or ignore Invitations set userInfo = ? where GUID = ?;"));
  v3 = *(_QWORD *)(a1 + 40);
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  v6 = v5;
  if (v4)
  {
    v7 = MSSqliteBindDataOrNull(v2, 1, v4);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Failed to archive a userInfo object. Error: %@ Info: %@"), v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v10;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    v7 = sqlite3_bind_null(v2, 1);
  }
  v11 = v7;
  MSSqliteTrapForDBLockError(v7);
  if (!v11)
  {
    v12 = MSSqliteBindStringOrNull(v2, 2, *(id *)(a1 + 48));
    v13 = v12;
    MSSqliteTrapForDBLockError(v12);
    if (!v13)
    {
      v14 = sqlite3_step(v2);
      MSSqliteTrapForDBLockError(v14);
    }
  }

  if (v2)
    sqlite3_reset(v2);
}

void __56__MSASServerSideModel_userInfoForAccessControlWithGUID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v9 = 0;
  v4 = objc_msgSend(v2, "dbQueueAccessControlWithGUID:outObject:outAlbumGUID:outEmail:outUserInfoData:", v3, 0, 0, 0, &v9);
  v5 = v9;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "MSSafeUnarchiveObjectWithData:outError:", v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __60__MSASServerSideModel_setUserInfo_forAccessControlWithGUID___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("update or ignore AccessControls set userInfo = ? where GUID = ?;"));
  v3 = *(_QWORD *)(a1 + 40);
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  v6 = v5;
  if (v4)
  {
    v7 = MSSqliteBindDataOrNull(v2, 1, v4);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Failed to archive a userInfo object. Error: %@ Info: %@"), v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v10;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    v7 = sqlite3_bind_null(v2, 1);
  }
  v11 = v7;
  MSSqliteTrapForDBLockError(v7);
  if (!v11)
  {
    v12 = MSSqliteBindStringOrNull(v2, 2, *(id *)(a1 + 48));
    v13 = v12;
    MSSqliteTrapForDBLockError(v12);
    if (!v13)
    {
      v14 = sqlite3_step(v2);
      MSSqliteTrapForDBLockError(v14);
    }
  }

  if (v2)
    sqlite3_reset(v2);
}

void __58__MSASServerSideModel_userInfoForAssetCollectionWithGUID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v9 = 0;
  v4 = objc_msgSend(v2, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v3, 0, 0, 0, 0, 0, 0, &v9);
  v5 = v9;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "MSSafeUnarchiveObjectWithData:outError:", v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __62__MSASServerSideModel_setUserInfo_forAssetCollectionWithGUID___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("update or ignore AssetCollections set userInfo = ? where GUID = ?;"));
  v3 = *(_QWORD *)(a1 + 40);
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  v6 = v5;
  if (v4)
  {
    v7 = MSSqliteBindDataOrNull(v2, 1, v4);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Failed to archive a userInfo object. Error: %@ Info: %@"), v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v10;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    v7 = sqlite3_bind_null(v2, 1);
  }
  v11 = v7;
  MSSqliteTrapForDBLockError(v7);
  if (!v11)
  {
    v12 = MSSqliteBindStringOrNull(v2, 2, *(id *)(a1 + 48));
    v13 = v12;
    MSSqliteTrapForDBLockError(v12);
    if (!v13)
    {
      v14 = sqlite3_step(v2);
      MSSqliteTrapForDBLockError(v14);
    }
  }

  if (v2)
    sqlite3_reset(v2);
}

void __48__MSASServerSideModel_userInfoForAlbumWithGUID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v9 = 0;
  v4 = objc_msgSend(v2, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v3, 0, 0, 0, 0, 0, &v9);
  v5 = v9;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "MSSafeUnarchiveObjectWithData:outError:", v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __52__MSASServerSideModel_setUserInfo_forAlbumWithGUID___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("update or ignore Albums set userInfo = ? where GUID = ?;"));
  v3 = *(_QWORD *)(a1 + 40);
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  v6 = v5;
  if (v4)
  {
    v7 = MSSqliteBindDataOrNull(v2, 1, v4);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Failed to archive a userInfo object. Error: %@ Info: %@"), v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v10;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    v7 = sqlite3_bind_null(v2, 1);
  }
  v11 = v7;
  MSSqliteTrapForDBLockError(v7);
  if (!v11)
  {
    v12 = MSSqliteBindStringOrNull(v2, 2, *(id *)(a1 + 48));
    v13 = v12;
    MSSqliteTrapForDBLockError(v12);
    if (!v13)
    {
      v14 = sqlite3_step(v2);
      MSSqliteTrapForDBLockError(v14);
    }
  }

  if (v2)
    sqlite3_reset(v2);
}

void __57__MSASServerSideModel_captionForAssetCollectionWithGUID___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("select obj from Comments where assetCollectionGUID = ? and isCaption != 0 order by timestamp limit 1;"));
  v3 = MSSqliteBindStringOrNull(v2, 1, *(id *)(a1 + 40));
  v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (!v4)
  {
    v5 = sqlite3_step(v2);
    if (v5 != 101)
    {
      if (v5 == 100)
      {
        MSSqliteObjectFromStatementColumn(v2, 0);
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = v6;

      }
      else
      {
        MSLogSqliteError((sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "dbQueueDB"), *(_QWORD *)(a1 + 32), 989);
      }
    }
  }
  if (v2)
    sqlite3_reset(v2);
}

void __39__MSASServerSideModel_commentWithGUID___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "dbQueueCommentWithGUID:outObject:outID:outTimestamp:outAssetCollectionGUID:outIsCaption:outUserInfoData:", v1, &obj, 0, 0, 0, 0, 0);
  objc_storeStrong((id *)(v3 + 40), obj);
}

id __65__MSASServerSideModel_dbQueueCommentsForAssetCollectionWithGUID___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteObjectFromStatementColumn(a2, 0);
}

void __58__MSASServerSideModel_commentsForAssetCollectionWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dbQueueCommentsForAssetCollectionWithGUID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "dbQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setQueue:", v5);

}

void __47__MSASServerSideModel_assetCollectionWithGUID___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v1, &obj, 0, 0, 0, 0, 0, 0);
  objc_storeStrong((id *)(v3 + 40), obj);
}

id __66__MSASServerSideModel_dbQueueAssetCollectionGUIDsInAlbumWithGUID___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteStringFromStatementColumn(a2, 0);
}

void __59__MSASServerSideModel_assetCollectionGUIDsInAlbumWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dbQueueAssetCollectionGUIDsInAlbumWithGUID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "dbQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setQueue:", v5);

}

void __55__MSASServerSideModel_assetCollectionsInAlbumWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "dbQueueDB");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("select obj from AssetCollections where albumGUID = '%@' order by albumGUID asc, batchDate asc, photoDate asc, GUID asc;"),
    *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSASModelEnumerator enumeratorWithDatabase:query:stepBlock:](MSASModelEnumerator, "enumeratorWithDatabase:query:stepBlock:", v2, v3, &__block_literal_global_150);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 32), "dbQueue");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setQueue:", v7);

}

id __55__MSASServerSideModel_assetCollectionsInAlbumWithGUID___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteObjectFromStatementColumn(a2, 0);
}

void __93__MSASServerSideModel_videoURLsForAssetCollectionWithGUID_forMediaAssetType_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v16 = 0;
  v15 = 0;
  v4 = objc_msgSend(v2, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v3, &v16, 0, &v15, 0, 0, 0, 0);
  v5 = v16;
  v6 = v15;
  v7 = 0;
  if (v4)
  {
    v8 = *(void **)(a1 + 32);
    v14 = 0;
    v9 = objc_msgSend(v8, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v6, &v14, 0, 0, 0, 0, 0);
    v7 = v14;
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "stateMachine");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __93__MSASServerSideModel_videoURLsForAssetCollectionWithGUID_forMediaAssetType_completionBlock___block_invoke_2;
      v12[3] = &unk_1E95BC3C0;
      v11 = *(_QWORD *)(a1 + 56);
      v13 = *(id *)(a1 + 48);
      objc_msgSend(v10, "videoURLsForAssetCollection:forMediaAssetType:inAlbum:completionBlock:", v5, v11, v7, v12);

    }
  }

}

uint64_t __93__MSASServerSideModel_videoURLsForAssetCollectionWithGUID_forMediaAssetType_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __74__MSASServerSideModel_videoURLForAssetCollectionWithGUID_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v15 = 0;
  v14 = 0;
  v4 = objc_msgSend(v2, "dbQueueAssetCollectionWithGUID:outObject:outCtag:outAlbumGUID:outBatchDate:outPhotoDate:outPhotoNumber:outUserInfoData:", v3, &v15, 0, &v14, 0, 0, 0, 0);
  v5 = v15;
  v6 = v14;
  v7 = 0;
  if (v4)
  {
    v8 = *(void **)(a1 + 32);
    v13 = 0;
    v9 = objc_msgSend(v8, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v6, &v13, 0, 0, 0, 0, 0);
    v7 = v13;
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "stateMachine");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __74__MSASServerSideModel_videoURLForAssetCollectionWithGUID_completionBlock___block_invoke_2;
      v11[3] = &unk_1E95BC398;
      v12 = *(id *)(a1 + 48);
      objc_msgSend(v10, "videoURLForAssetCollection:inAlbum:completionBlock:", v5, v7, v11);

    }
  }

}

uint64_t __74__MSASServerSideModel_videoURLForAssetCollectionWithGUID_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __42__MSASServerSideModel_invitationWithGUID___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "dbQueueInvitationWithGUID:outObject:outAlbumGUID:outEmail:outUserInfoData:", v1, &obj, 0, 0, 0);
  objc_storeStrong((id *)(v3 + 40), obj);
}

void __50__MSASServerSideModel_invitationForAlbumWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dbQueueInvitationForAlbumWithGUID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __38__MSASServerSideModel_invitationGUIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[MSASModelEnumerator enumeratorWithDatabase:query:stepBlock:](MSASModelEnumerator, "enumeratorWithDatabase:query:stepBlock:", objc_msgSend(*(id *)(a1 + 32), "dbQueueDB"), CFSTR("select GUID from Invitations order by email;"),
    &__block_literal_global_145);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "dbQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setQueue:", v5);

}

id __38__MSASServerSideModel_invitationGUIDs__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteStringFromStatementColumn(a2, 0);
}

void __34__MSASServerSideModel_invitations__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[MSASModelEnumerator enumeratorWithDatabase:query:stepBlock:](MSASModelEnumerator, "enumeratorWithDatabase:query:stepBlock:", objc_msgSend(*(id *)(a1 + 32), "dbQueueDB"), CFSTR("select obj from Invitations order by email;"),
    &__block_literal_global_142);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "dbQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setQueue:", v5);

}

id __34__MSASServerSideModel_invitations__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteObjectFromStatementColumn(a2, 0);
}

void __45__MSASServerSideModel_accessControlWithGUID___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "dbQueueAccessControlWithGUID:outObject:outAlbumGUID:outEmail:outUserInfoData:", v1, &obj, 0, 0, 0);
  objc_storeStrong((id *)(v3 + 40), obj);
}

id __65__MSASServerSideModel_dbQueueAccessControlGUIDsForAlbumWithGUID___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteStringFromStatementColumn(a2, 0);
}

void __58__MSASServerSideModel_accessControlGUIDsForAlbumWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dbQueueAccessControlGUIDsForAlbumWithGUID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "dbQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setQueue:", v5);

}

id __61__MSASServerSideModel_dbQueueAccessControlsForAlbumWithGUID___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteObjectFromStatementColumn(a2, 0);
}

void __54__MSASServerSideModel_accessControlsForAlbumWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dbQueueAccessControlsForAlbumWithGUID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "dbQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setQueue:", v5);

}

void __37__MSASServerSideModel_albumWithGUID___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "dbQueueAlbumWithGUID:outObject:outName:outCtag:outForeignCtag:outURLString:outUserInfoData:", v1, &obj, 0, 0, 0, 0, 0);
  objc_storeStrong((id *)(v3 + 40), obj);
}

id __40__MSASServerSideModel_dbQueueAlbumGUIDs__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteStringFromStatementColumn(a2, 0);
}

void __33__MSASServerSideModel_albumGUIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dbQueueAlbumGUIDs");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "dbQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setQueue:", v5);

}

void __29__MSASServerSideModel_albums__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[MSASModelEnumerator enumeratorWithDatabase:query:stepBlock:](MSASModelEnumerator, "enumeratorWithDatabase:query:stepBlock:", objc_msgSend(*(id *)(a1 + 32), "dbQueueDB"), CFSTR("select obj from Albums order by GUID asc;"),
    &__block_literal_global_6504);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "dbQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setQueue:", v5);

}

id __29__MSASServerSideModel_albums__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteObjectFromStatementColumn(a2, 0);
}

id __62__MSASServerSideModel_shutDownForDestruction_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v8 = v2;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Command Queue has shut down.", buf, 0xCu);
  }
  v3 = *(unsigned __int8 *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)MSASServerSideModel;
  return objc_msgSendSuper2(&v6, sel_shutDownForDestruction_completionBlock_, v3, v4);
}

void __64__MSASServerSideModel_initWithPersonID_databasePath_eventQueue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("personID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "personID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "eventQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__MSASServerSideModel_initWithPersonID_databasePath_eventQueue___block_invoke_2;
    block[3] = &unk_1E95BCED0;
    v9 = *(id *)(a1 + 32);
    dispatch_async(v7, block);

  }
}

void __64__MSASServerSideModel_initWithPersonID_databasePath_eventQueue___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__MSASServerSideModel_initWithPersonID_databasePath_eventQueue___block_invoke_3;
  v7[3] = &unk_1E95BC240;
  v8 = v2;
  objc_msgSend(v8, "eventQueuePerformBlockOnObservers:", v7);
  v4 = *(void **)(a1 + 32);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __64__MSASServerSideModel_initWithPersonID_databasePath_eventQueue___block_invoke_4;
  v5[3] = &unk_1E95BC240;
  v6 = v4;
  objc_msgSend(v6, "eventQueuePerformBlockOnObservers:", v5);

}

void __64__MSASServerSideModel_initWithPersonID_databasePath_eventQueue___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModelDidReceiveNewServerSideConfiguration:info:", *(_QWORD *)(a1 + 32), 0);

}

void __64__MSASServerSideModel_initWithPersonID_databasePath_eventQueue___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "MSASModelDidReceiveNewServerSideConfiguration:", *(_QWORD *)(a1 + 32));

}

void __34__MSASServerSideModel_releaseBusy__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "releaseBusy");

}

void __33__MSASServerSideModel_retainBusy__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "retainBusy");

}

- (void)enqueueCommand:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  MSASServerSideModel *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "command");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MSASModelBase dbQueue](self, "dbQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__MSASServerSideModel_GroupedCommands__enqueueCommand___block_invoke;
    v7[3] = &unk_1E95BCFC0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v6, v7);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v10 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Attempting to enqueue a command without a command string. Rejected and ignored.", buf, 0xCu);
  }

}

- (int)commandCount
{
  MSASServerSideModel *v2;
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
  v5[2] = __52__MSASServerSideModel_GroupedCommands__commandCount__block_invoke;
  v5[3] = &unk_1E95BCEF8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

- (id)nextCommandGroupMaxCount:(int)a3 outCommand:(id *)a4 outLastCommandIndex:(int64_t *)a5
{
  NSObject *v9;
  id v10;
  _QWORD block[8];
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__6323;
  v28 = __Block_byref_object_dispose__6324;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6323;
  v22 = __Block_byref_object_dispose__6324;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[MSASModelBase dbQueue](self, "dbQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__MSASServerSideModel_GroupedCommands__nextCommandGroupMaxCount_outCommand_outLastCommandIndex___block_invoke;
  block[3] = &unk_1E95BC888;
  v13 = a3;
  block[4] = self;
  block[5] = &v18;
  block[6] = &v24;
  block[7] = &v14;
  dispatch_sync(v9, block);

  if (objc_msgSend((id)v25[5], "count"))
  {
    if (a4)
      *a4 = objc_retainAutorelease((id)v19[5]);
    if (a5)
      *a5 = v15[3];
    v10 = (id)v25[5];
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v10;
}

- (void)removeCommandsUpToCommandIndex:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[MSASModelBase dbQueue](self, "dbQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__MSASServerSideModel_GroupedCommands__removeCommandsUpToCommandIndex___block_invoke;
  v6[3] = &unk_1E95BCF48;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)performBlockOnObservers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASServerSideModel eventQueue](self, "eventQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__MSASServerSideModel_GroupedCommands__performBlockOnObservers___block_invoke;
  v7[3] = &unk_1E95BCF98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __64__MSASServerSideModel_GroupedCommands__performBlockOnObservers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventQueuePerformBlockOnObservers:", *(_QWORD *)(a1 + 40));
}

void __71__MSASServerSideModel_GroupedCommands__removeCommandsUpToCommandIndex___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;

  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("delete from GroupedCommand where rowid <= ?;"));
  v3 = sqlite3_bind_int64(v2, 1, *(_QWORD *)(a1 + 40));
  v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4)
  {
    v5 = 4839;
  }
  else
  {
    v6 = sqlite3_step(v2);
    v7 = v6;
    MSSqliteTrapForDBLockError(v6);
    if (v7 == 101)
      goto LABEL_6;
    v5 = 4840;
  }
  MSLogSqliteError((sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "dbQueueDB"), *(_QWORD *)(a1 + 32), v5);
LABEL_6:
  if (v2)
    sqlite3_reset(v2);
}

void __96__MSASServerSideModel_GroupedCommands__nextCommandGroupMaxCount_outCommand_outLastCommandIndex___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  uint64_t v3;
  int v4;
  char v5;
  int v6;
  sqlite3_int64 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  id v17;
  int v18;
  char v19;
  char v20;
  id v21;
  id v22;

  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("select rowid, command, invariant, variant from GroupedCommand order by rowid asc limit ?;"));
  v3 = sqlite3_bind_int(v2, 1, *(_DWORD *)(a1 + 64));
  v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (!v4)
  {
    v5 = 0;
    v21 = 0;
    while (1)
    {
      if ((v5 & 1) != 0)
        goto LABEL_3;
      v6 = sqlite3_step(v2);
      if (v6 != 101)
      {
        if (v6 == 100)
        {
          v7 = sqlite3_column_int64(v2, 0);
          MSSqliteStringFromStatementColumn(v2, 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          MSSqliteObjectFromStatementColumn(v2, 2);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          MSSqliteObjectFromStatementColumn(v2, 3);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v13 = *(_QWORD *)(v11 + 40);
          v12 = (id *)(v11 + 40);
          if (!v13)
            objc_storeStrong(v12, v8);
          +[MSASEnqueuedCommand commandwithCommand:variantParam:invariantParam:](MSASEnqueuedCommand, "commandwithCommand:variantParam:invariantParam:", v8, v10, v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v21;
          if (v21 && (v16 = objc_msgSend(v21, "canBeGroupedWithCommand:", v14), v15 = v21, !v16))
          {
            v19 = 0;
            v18 = 2;
          }
          else
          {
            v22 = v15;
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v14);
            v17 = v14;

            v18 = 0;
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7;
            v19 = 1;
            v21 = v17;
          }

          v20 = 0;
          v5 = 0;
          if ((v19 & 1) == 0)
            goto LABEL_18;
          goto LABEL_17;
        }
        MSLogSqliteError((sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "dbQueueDB"), *(_QWORD *)(a1 + 32), 4819);
      }
      v20 = 1;
LABEL_17:
      v18 = 0;
      v5 = v20;
LABEL_18:
      if (v18)
        goto LABEL_3;
    }
  }
  MSLogSqliteError((sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "dbQueueDB"), *(_QWORD *)(a1 + 32), 4797);
  v21 = 0;
LABEL_3:
  if (v2)
    sqlite3_reset(v2);

}

void __52__MSASServerSideModel_GroupedCommands__commandCount__block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  int v3;

  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("select count(*) from GroupedCommand;"));
  v3 = sqlite3_step(v2);
  if (v3 == 101)
  {
LABEL_4:
    if (!v2)
      return;
    goto LABEL_5;
  }
  if (v3 == 100)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_column_int(v2, 0);
    goto LABEL_4;
  }
  MSLogSqliteError((sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "dbQueueDB"), *(_QWORD *)(a1 + 32), 4781);
  if (v2)
LABEL_5:
    sqlite3_reset(v2);
}

void __55__MSASServerSideModel_GroupedCommands__enqueueCommand___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "statementForString:", CFSTR("insert or rollback into GroupedCommand (command, invariant, variant) values (?, ?, ?);"));
  objc_msgSend(*(id *)(a1 + 40), "command");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MSSqliteBindStringOrNull(v2, 1, v3);

  v4 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(*(id *)(a1 + 40), "invariantParam");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;

  if (v6)
  {
    MSSqliteBindDataOrNull(v2, 2, v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Failed to archive an invariantParam object. Error: %@ Info: %@"), v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v10;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    sqlite3_bind_null(v2, 2);
  }
  v11 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(*(id *)(a1 + 40), "variantParam");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v7;
  objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v20;

  if (v13)
  {
    MSSqliteBindDataOrNull(v2, 3, v13);
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Failed to archive an variantParam object. Error: %@ Info: %@"), v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v17;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    sqlite3_bind_null(v2, 3);
  }
  v18 = sqlite3_step(v2);
  v19 = v18;
  MSSqliteTrapForDBLockError(v18);
  if (v19 != 101)
    MSLogSqliteError((sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "dbQueueDB"), *(_QWORD *)(a1 + 32), 4767);
  if (v2)
    sqlite3_reset(v2);

}

@end
