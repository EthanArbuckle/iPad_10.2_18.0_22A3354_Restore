@implementation MKMessageMigrator

- (MKMessageMigrator)init
{
  MKMessageMigrator *v2;
  void *v3;
  uint64_t v4;
  NSString *accountGUID;
  NSMutableDictionary *v6;
  NSMutableDictionary *groups;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MKMessageMigrator;
  v2 = -[MKMigrator init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    accountGUID = v2->_accountGUID;
    v2->_accountGUID = (NSString *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    groups = v2->_groups;
    v2->_groups = v6;

    v2->_database = 0;
    -[MKMigrator setType:](v2, "setType:", 10);
    -[MKMessageMigrator open](v2, "open");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MKMessageMigrator close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)MKMessageMigrator;
  -[MKMessageMigrator dealloc](&v3, sel_dealloc);
}

- (void)open
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21EC08000, a2, OS_LOG_TYPE_ERROR, "%@ could not open a database file.", (uint8_t *)&v2, 0xCu);
}

- (void)close
{
  MKMessageMigrator *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_database)
  {
    -[MKMessageMigrator updateClient](obj, "updateClient");
    sqlite3_close(obj->_database);
    obj->_database = 0;
    -[MKMessageMigrator notify](obj, "notify");
  }
  objc_sync_exit(obj);

}

- (void)notify
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.imdpersistenceagent.notification.mergecompleted"), 0, 0, 1u);
}

- (void)import
{
  objc_super v3;

  -[MKMessageMigrator close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)MKMessageMigrator;
  -[MKMigrator import](&v3, sel_import);
}

- (void)importDataEncodedInJSON:(id)a3
{
  MKMessageMigrator *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x2207B99F4](v5);
  -[MKMessageMigrator import:](v4, "import:", v7);
  objc_autoreleasePoolPop(v6);
  objc_sync_exit(v4);

}

- (void)delete
{
  -[MKMessageMigrator delete:](self, "delete:", CFSTR("message_attachment_join"));
  -[MKMessageMigrator delete:](self, "delete:", CFSTR("chat_message_join"));
  -[MKMessageMigrator delete:](self, "delete:", CFSTR("chat_handle_join"));
  -[MKMessageMigrator delete:](self, "delete:", CFSTR("chat"));
  -[MKMessageMigrator delete:](self, "delete:", CFSTR("attachment"));
  -[MKMessageMigrator delete:](self, "delete:", CFSTR("message"));
  -[MKMessageMigrator delete:](self, "delete:", CFSTR("handle"));
}

- (void)delete:(id)a3
{
  void *v4;
  sqlite3 *database;
  id v6;
  NSObject *v7;
  NSObject *v8;
  sqlite3_stmt *ppStmt;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ppStmt = 0;
  database = self->_database;
  v6 = objc_retainAutorelease(v4);
  if (sqlite3_prepare(database, (const char *)objc_msgSend(v6, "UTF8String"), -1, &ppStmt, 0))
  {
    +[MKLog log](MKLog, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase query:].cold.2();

  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      +[MKLog log](MKLog, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[MKPhotoLibraryAssetDatabase removeCollection:].cold.2();

    }
    sqlite3_finalize(ppStmt);
  }

}

- (void)query:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_database, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), -1, &ppStmt, 0))
  {
    +[MKLog log](MKLog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase query:].cold.2();

  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      +[MKLog log](MKLog, "log");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[MKApplicationDatabase query:].cold.1();

    }
    sqlite3_finalize(ppStmt);
  }
}

- (void)begin
{
  -[MKMessageMigrator query:](self, "query:", CFSTR("BEGIN TRANSACTION"));
}

- (void)commit
{
  -[MKMessageMigrator query:](self, "query:", CFSTR("COMMIT TRANSACTION"));
}

- (void)rollback
{
  -[MKMessageMigrator query:](self, "query:", CFSTR("ROLLBACK TRANSACTION"));
}

- (void)import:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x2207B99F4](-[MKMessageMigrator begin](self, "begin"));
  v6 = -[MKMessageMigrator _import:](self, "_import:", v17);
  objc_autoreleasePoolPop(v5);
  if (v6)
  {
    -[MKMessageMigrator commit](self, "commit");
    -[MKMigrator migratorDidImport](self, "migratorDidImport");
    -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", objc_msgSend(v17, "length"));
  }
  else
  {
    -[MKMessageMigrator rollback](self, "rollback");
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MKMessageError"), 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:", v7);

  }
  +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  objc_msgSend(v8, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v4);
  v13 = v12;

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v13);
  objc_msgSend(v10, "importElapsedTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "decimalNumberByAdding:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImportElapsedTime:", v16);

  objc_sync_exit(v8);
}

- (BOOL)_import:(id)a3
{
  MKMessage *v4;
  MKMessage *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  NSMutableDictionary *v15;
  MKMessageGroup *v16;
  NSObject *v17;
  NSObject *p_super;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  __int128 v43;
  void *v44;
  MKMessageGroup *v45;
  NSObject *v46;
  void *v47;
  id v48;
  os_log_t oslog;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  NSObject *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v48 = a3;
  v4 = -[MKMessage initWithData:]([MKMessage alloc], "initWithData:", v48);
  v5 = v4;
  if (v4)
  {
    -[MKMessage body](v4, "body");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {

    }
    else
    {
      -[MKMessage attachments](v5, "attachments");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (!v10)
      {
        +[MKLog log](MKLog, "log");
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[MKMessageMigrator _import:].cold.2();
        v8 = 1;
        goto LABEL_78;
      }
    }
    +[MKLog log](MKLog, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EC08000, v11, OS_LOG_TYPE_INFO, "will import a message", buf, 2u);
    }

    -[MKMessage handles](v5, "handles");
    v7 = objc_claimAutoreleasedReturnValue();
    +[MKLog log](MKLog, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v7;
      _os_log_impl(&dword_21EC08000, v12, OS_LOG_TYPE_INFO, "handles : %@", buf, 0xCu);
    }

    if (-[NSObject count](v7, "count"))
    {
      -[MKMessageMigrator handleIDs:](self, "handleIDs:", v7);
      oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
      -[NSObject sortedArrayUsingComparator:](oslog, "sortedArrayUsingComparator:", &__block_literal_global_3);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "componentsJoinedByString:", CFSTR(","));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[MKMessage isSent](v5, "isSent"))
      {
        v46 = &unk_24E36BE08;
      }
      else
      {
        -[NSObject objectAtIndexedSubscript:](oslog, "objectAtIndexedSubscript:", 0);
        v46 = objc_claimAutoreleasedReturnValue();
      }
      if (oslog)
      {
        -[MKMessage recipients](v5, "recipients");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (unint64_t)objc_msgSend(v13, "count") > 1;

        if (v14)
        {
          v15 = self->_groups;
          objc_sync_enter(v15);
          -[NSMutableDictionary objectForKey:](self->_groups, "objectForKey:", v44);
          v16 = (MKMessageGroup *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            v16 = objc_alloc_init(MKMessageGroup);
            -[NSMutableDictionary setObject:forKey:](self->_groups, "setObject:forKey:", v16, v44);
          }
          v45 = v16;
          objc_sync_exit(v15);

        }
        else
        {
          v45 = 0;
        }
        +[MKLog log](MKLog, "log");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v56 = oslog;
          _os_log_impl(&dword_21EC08000, v19, OS_LOG_TYPE_INFO, "handle ids : %@", buf, 0xCu);
        }

        +[MKLog log](MKLog, "log");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v46;
          _os_log_impl(&dword_21EC08000, v20, OS_LOG_TYPE_INFO, "sender handle id : %@", buf, 0xCu);
        }

        +[MKLog log](MKLog, "log");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          -[MKMessageGroup ID](v45, "ID");
          v22 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v56 = v22;
          _os_log_impl(&dword_21EC08000, v21, OS_LOG_TYPE_INFO, "group id : %@", buf, 0xCu);

        }
        +[MKLog log](MKLog, "log");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          -[MKMessageGroup roomName](v45, "roomName");
          v24 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v56 = v24;
          _os_log_impl(&dword_21EC08000, v23, OS_LOG_TYPE_INFO, "group room name : %@", buf, 0xCu);

        }
        -[MKMessageMigrator insertMessage:forHandleID:withGroup:](self, "insertMessage:forHandleID:withGroup:", v5, v46, v45);
        v25 = objc_claimAutoreleasedReturnValue();
        +[MKLog log](MKLog, "log");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v25;
          _os_log_impl(&dword_21EC08000, v26, OS_LOG_TYPE_INFO, "message id : %@", buf, 0xCu);
        }

        if (v25)
        {
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          -[MKMessage attachments](v5, "attachments");
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
          if (v28)
          {
            v30 = *(_QWORD *)v51;
            *(_QWORD *)&v29 = 138412290;
            v43 = v29;
            while (2)
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v51 != v30)
                  objc_enumerationMutation(v27);
                v32 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
                objc_msgSend(v32, "write", v43);
                -[MKMessageMigrator insertAttachment:withMessage:](self, "insertAttachment:withMessage:", v32, v5);
                v33 = objc_claimAutoreleasedReturnValue();
                +[MKLog log](MKLog, "log");
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v43;
                  v56 = v33;
                  _os_log_impl(&dword_21EC08000, v34, OS_LOG_TYPE_INFO, "attachment id : %@", buf, 0xCu);
                }

                if (!v33)
                {
                  +[MKLog log](MKLog, "log");
                  v40 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                    -[MKMessageMigrator _import:].cold.8();

                  goto LABEL_67;
                }
                -[MKMessageMigrator joinAttachment:message:](self, "joinAttachment:message:", v33, v25);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v35)
                {
                  +[MKLog log](MKLog, "log");
                  v41 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                    -[MKMessageMigrator _import:].cold.9();

                  goto LABEL_67;
                }

              }
              v28 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
              if (v28)
                continue;
              break;
            }
          }

          -[MKMessageMigrator chatIDForMessage:forHandleIDs:withGroup:](self, "chatIDForMessage:forHandleIDs:withGroup:", v5, v47, v45);
          v27 = objc_claimAutoreleasedReturnValue();
          +[MKLog log](MKLog, "log");
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v27;
            _os_log_impl(&dword_21EC08000, v36, OS_LOG_TYPE_INFO, "chat id : %@", buf, 0xCu);
          }

          if (v27)
          {
            -[MKMessageMigrator joinChat:message:date:](self, "joinChat:message:date:", v27, v25, -[MKMessage timestampInNanoseconds](v5, "timestampInNanoseconds"));
            v37 = objc_claimAutoreleasedReturnValue();
            v8 = v37 != 0;
            +[MKLog log](MKLog, "log");
            v38 = objc_claimAutoreleasedReturnValue();
            v39 = v38;
            if (v37)
            {
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21EC08000, v39, OS_LOG_TYPE_INFO, "did import a message", buf, 2u);
              }
            }
            else if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              -[MKMessageMigrator _import:].cold.7();
            }

          }
          else
          {
            +[MKLog log](MKLog, "log");
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              -[MKMessageMigrator _import:].cold.6();
            v8 = 0;
          }

        }
        else
        {
          +[MKLog log](MKLog, "log");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[MKMessageMigrator _import:].cold.5();
LABEL_67:
          v8 = 0;
        }

        p_super = &v45->super;
      }
      else
      {
        +[MKLog log](MKLog, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        p_super = v17;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          -[MKMessageMigrator _import:].cold.4();
          v8 = 0;
          p_super = v17;
        }
        else
        {
          v8 = 0;
        }
      }

    }
    else
    {
      +[MKLog log](MKLog, "log");
      oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        -[MKMessageMigrator _import:].cold.3();
      v8 = 0;
    }

  }
  else
  {
    +[MKLog log](MKLog, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MKMessageMigrator _import:].cold.1();
    v8 = 0;
  }
LABEL_78:

  return v8;
}

uint64_t __29__MKMessageMigrator__import___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)_performSimpleQuery:(id)a3
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (!sqlite3_prepare_v2(self->_database, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), -1, &ppStmt, 0))sqlite3_finalize(ppStmt);
  return 0;
}

- (id)handleIDs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[MKMessageMigrator handleID:](self, "handleID:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), (_QWORD)v15);
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {

          v13 = 0;
          goto LABEL_11;
        }
        v12 = (void *)v11;
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }

  v13 = v5;
LABEL_11:

  return v13;
}

- (id)handleID:(id)a3
{
  id v4;
  sqlite3_int64 v5;
  uint64_t v6;
  void *v7;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  ppStmt = 0;
  if (sqlite3_prepare(self->_database, (const char *)objc_msgSend(CFSTR("SELECT rowid FROM handle WHERE id = ? LIMIT 1"), "UTF8String"), -1, &ppStmt, 0))
  {
    goto LABEL_6;
  }
  sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), -1, 0);
  if (sqlite3_step(ppStmt) != 100)
  {
    sqlite3_finalize(ppStmt);
    goto LABEL_6;
  }
  v5 = sqlite3_column_int64(ppStmt, 0);
  sqlite3_finalize(ppStmt);
  if (v5 == -1)
  {
LABEL_6:
    -[MKMessageMigrator insertHandle:](self, "insertHandle:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v7 = (void *)v6;

  return v7;
}

- (id)insertHandle:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  sqlite3 **p_database;
  sqlite3 *database;
  id v14;
  NSObject *v15;
  sqlite3_int64 insert_rowid;
  void *v17;
  NSObject *v18;
  _BYTE buf[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(&unk_24E36C758, "count"));
  if (objc_msgSend(&unk_24E36C758, "count"))
  {
    v6 = 0;
    do
      objc_msgSend(v5, "setObject:atIndexedSubscript:", CFSTR("?"), v6++);
    while (v6 < objc_msgSend(&unk_24E36C758, "count"));
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(&unk_24E36C758, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("INSERT INTO handle (%@) VALUES (%@)"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[MKLog log](MKLog, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl(&dword_21EC08000, v11, OS_LOG_TYPE_INFO, "query : %@", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  p_database = &self->_database;
  database = self->_database;
  v14 = objc_retainAutorelease(v10);
  if (sqlite3_prepare(database, (const char *)objc_msgSend(v14, "UTF8String"), -1, (sqlite3_stmt **)buf, 0))
  {
    +[MKLog log](MKLog, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase query:].cold.2();

    goto LABEL_16;
  }
  sqlite3_bind_text(*(sqlite3_stmt **)buf, 1, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), -1, 0);
  sqlite3_bind_null(*(sqlite3_stmt **)buf, 2);
  sqlite3_bind_text(*(sqlite3_stmt **)buf, 3, (const char *)objc_msgSend(CFSTR("SMS"), "UTF8String"), -1, 0);
  sqlite3_bind_null(*(sqlite3_stmt **)buf, 4);
  if (sqlite3_step(*(sqlite3_stmt **)buf) != 101)
  {
    +[MKLog log](MKLog, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase addIdentifier:].cold.2();

    sqlite3_finalize(*(sqlite3_stmt **)buf);
    goto LABEL_16;
  }
  insert_rowid = sqlite3_last_insert_rowid(*p_database);
  sqlite3_finalize(*(sqlite3_stmt **)buf);
  if (insert_rowid == -1)
  {
LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", insert_rowid);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v17;
}

- (id)insertMessage:(id)a3 forHandleID:(id)a4 withGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  sqlite3_int64 v18;
  sqlite3 **p_database;
  sqlite3 *database;
  id v21;
  NSObject *v22;
  sqlite3_stmt *v23;
  id v24;
  sqlite3_stmt *v25;
  id v26;
  void *v27;
  sqlite3_stmt *v28;
  id v29;
  const void *v30;
  void *v31;
  sqlite3_stmt *v32;
  id v33;
  sqlite3_stmt *v34;
  id v35;
  sqlite3_int64 insert_rowid;
  void *v37;
  NSObject *v38;
  void *v40;
  id v41;
  int v42;
  _BYTE buf[24];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(&unk_24E36C770, "count"));
  if (objc_msgSend(&unk_24E36C770, "count"))
  {
    v12 = 0;
    do
      objc_msgSend(v11, "setObject:atIndexedSubscript:", CFSTR("?"), v12++);
    while (v12 < objc_msgSend(&unk_24E36C770, "count"));
  }
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(&unk_24E36C770, "componentsJoinedByString:", CFSTR(","));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("INSERT INTO message (%@) VALUES (%@)"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[MKLog log](MKLog, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v16;
    _os_log_impl(&dword_21EC08000, v17, OS_LOG_TYPE_INFO, "query : %@", buf, 0xCu);
  }

  if (objc_msgSend(v8, "isRead"))
  {
    v18 = objc_msgSend(v8, "timestampInNanoseconds");
    v42 = 1;
  }
  else
  {
    v18 = 0;
    v42 = 0;
  }
  *(_QWORD *)buf = 0;
  p_database = &self->_database;
  database = self->_database;
  v21 = objc_retainAutorelease(v16);
  if (sqlite3_prepare(database, (const char *)objc_msgSend(v21, "UTF8String"), -1, (sqlite3_stmt **)buf, 0))
  {
    +[MKLog log](MKLog, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase query:].cold.2();

    goto LABEL_25;
  }
  v40 = v10;
  v23 = *(sqlite3_stmt **)buf;
  objc_msgSend(v8, "UUID");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v23, 1, (const char *)objc_msgSend(v24, "UTF8String"), -1, 0);

  v25 = *(sqlite3_stmt **)buf;
  objc_msgSend(v8, "body");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v25, 2, (const char *)objc_msgSend(v26, "UTF8String"), -1, 0);

  sqlite3_bind_null(*(sqlite3_stmt **)buf, 3);
  v41 = v9;
  sqlite3_bind_int64(*(sqlite3_stmt **)buf, 4, objc_msgSend(v9, "longLongValue"));
  sqlite3_bind_null(*(sqlite3_stmt **)buf, 5);
  sqlite3_bind_null(*(sqlite3_stmt **)buf, 6);
  objc_msgSend(v8, "attributedBody");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = *(sqlite3_stmt **)buf;
  if (v27)
  {
    objc_msgSend(v8, "attributedBody");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = (const void *)objc_msgSend(v29, "bytes");
    objc_msgSend(v8, "attributedBody");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_bind_blob(v28, 7, v30, objc_msgSend(v31, "length"), 0);

  }
  else
  {
    sqlite3_bind_null(*(sqlite3_stmt **)buf, 7);
  }
  sqlite3_bind_int(*(sqlite3_stmt **)buf, 8, 10);
  sqlite3_bind_text(*(sqlite3_stmt **)buf, 9, (const char *)objc_msgSend(CFSTR("SMS"), "UTF8String"), -1, 0);
  v32 = *(sqlite3_stmt **)buf;
  objc_msgSend(v8, "account");
  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v32, 10, (const char *)objc_msgSend(v33, "UTF8String"), -1, 0);

  sqlite3_bind_text(*(sqlite3_stmt **)buf, 11, -[NSString UTF8String](self->_accountGUID, "UTF8String"), -1, 0);
  sqlite3_bind_int(*(sqlite3_stmt **)buf, 12, 0);
  sqlite3_bind_int64(*(sqlite3_stmt **)buf, 13, objc_msgSend(v8, "timestampInNanoseconds"));
  sqlite3_bind_int64(*(sqlite3_stmt **)buf, 14, v18);
  sqlite3_bind_int64(*(sqlite3_stmt **)buf, 15, objc_msgSend(v8, "timestampInNanoseconds"));
  sqlite3_bind_int(*(sqlite3_stmt **)buf, 16, 1);
  sqlite3_bind_int(*(sqlite3_stmt **)buf, 17, objc_msgSend(v8, "isSent"));
  v34 = *(sqlite3_stmt **)buf;
  v10 = v40;
  if (v40)
  {
    objc_msgSend(v40, "roomName");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v34, 18, (const char *)objc_msgSend(v35, "UTF8String"), -1, 0);

  }
  else
  {
    sqlite3_bind_null(*(sqlite3_stmt **)buf, 18);
  }
  v9 = v41;
  sqlite3_bind_int(*(sqlite3_stmt **)buf, 19, 1);
  sqlite3_bind_int(*(sqlite3_stmt **)buf, 20, 0);
  sqlite3_bind_null(*(sqlite3_stmt **)buf, 21);
  sqlite3_bind_int(*(sqlite3_stmt **)buf, 22, v42);
  sqlite3_bind_int(*(sqlite3_stmt **)buf, 23, 1);
  if (sqlite3_step(*(sqlite3_stmt **)buf) != 101)
  {
    +[MKLog log](MKLog, "log");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase addIdentifier:].cold.2();

    sqlite3_finalize(*(sqlite3_stmt **)buf);
    goto LABEL_25;
  }
  insert_rowid = sqlite3_last_insert_rowid(*p_database);
  sqlite3_finalize(*(sqlite3_stmt **)buf);
  if (insert_rowid == -1)
  {
LABEL_25:
    v37 = 0;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", insert_rowid);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v37;
}

- (id)insertAttachment:(id)a3 withMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  sqlite3 **p_database;
  sqlite3 *database;
  id v16;
  NSObject *v17;
  sqlite3_stmt *v18;
  id v19;
  sqlite3_stmt *v20;
  id v21;
  sqlite3_stmt *v22;
  id v23;
  sqlite3_stmt *v24;
  id v25;
  sqlite3_stmt *v26;
  void *v27;
  id v28;
  sqlite3_stmt *v29;
  void *v30;
  sqlite3_stmt *v31;
  id v32;
  sqlite3_int64 insert_rowid;
  void *v34;
  NSObject *v35;
  sqlite3_stmt *ppStmt;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(&unk_24E36C788, "count"));
  if (objc_msgSend(&unk_24E36C788, "count"))
  {
    v9 = 0;
    do
      objc_msgSend(v8, "setObject:atIndexedSubscript:", CFSTR("?"), v9++);
    while (v9 < objc_msgSend(&unk_24E36C788, "count"));
  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(&unk_24E36C788, "componentsJoinedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("INSERT INTO attachment (%@) VALUES (%@)"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  ppStmt = 0;
  p_database = &self->_database;
  database = self->_database;
  v16 = objc_retainAutorelease(v13);
  if (sqlite3_prepare(database, (const char *)objc_msgSend(v16, "UTF8String"), -1, &ppStmt, 0))
  {
    +[MKLog log](MKLog, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase query:].cold.2();

    goto LABEL_14;
  }
  v18 = ppStmt;
  objc_msgSend(v6, "UUID");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v18, 1, (const char *)objc_msgSend(v19, "UTF8String"), -1, 0);

  sqlite3_bind_int64(ppStmt, 2, objc_msgSend(v7, "timestampInSeconds"));
  sqlite3_bind_int64(ppStmt, 3, objc_msgSend(v7, "timestampInSeconds"));
  v20 = ppStmt;
  objc_msgSend(v6, "filename");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v20, 4, (const char *)objc_msgSend(v21, "UTF8String"), -1, 0);

  v22 = ppStmt;
  objc_msgSend(v6, "uniformTypeIdentifier");
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v22, 5, (const char *)objc_msgSend(v23, "UTF8String"), -1, 0);

  v24 = ppStmt;
  objc_msgSend(v6, "contentType");
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v24, 6, (const char *)objc_msgSend(v25, "UTF8String"), -1, 0);

  sqlite3_bind_int(ppStmt, 7, objc_msgSend(v6, "transferState"));
  sqlite3_bind_int(ppStmt, 8, objc_msgSend(v7, "isSent"));
  sqlite3_bind_null(ppStmt, 9);
  v26 = ppStmt;
  objc_msgSend(v6, "filename");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lastPathComponent");
  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v26, 10, (const char *)objc_msgSend(v28, "UTF8String"), -1, 0);

  v29 = ppStmt;
  objc_msgSend(v6, "data");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(v29, 11, objc_msgSend(v30, "length"));

  v31 = ppStmt;
  objc_msgSend(v6, "UUID");
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v31, 12, (const char *)objc_msgSend(v32, "UTF8String"), -1, 0);

  if (sqlite3_step(ppStmt) != 101)
  {
    +[MKLog log](MKLog, "log");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase addIdentifier:].cold.2();

    sqlite3_finalize(ppStmt);
    goto LABEL_14;
  }
  insert_rowid = sqlite3_last_insert_rowid(*p_database);
  sqlite3_finalize(ppStmt);
  if (insert_rowid == -1)
  {
LABEL_14:
    v34 = 0;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", insert_rowid);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v34;
}

- (id)chatIDForMessage:(id)a3 forHandleIDs:(id)a4 withGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  sqlite3_int64 v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  id v27;
  uint8_t v28;
  _BYTE v29[15];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  sqlite3_stmt *ppStmt;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "roomName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("SELECT rowid FROM chat WHERE room_name = ? LIMIT 1");
  }
  else
  {
    if ((objc_msgSend(v8, "isSent") & 1) != 0)
    {
      objc_msgSend(v8, "recipients");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v8, "sender");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = CFSTR("SELECT rowid FROM chat WHERE chat_identifier = ? LIMIT 1");
  }
  ppStmt = 0;
  if (sqlite3_prepare(self->_database, (const char *)-[__CFString UTF8String](v13, "UTF8String"), -1, &ppStmt, 0))
    goto LABEL_23;
  sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), -1, 0);
  if (sqlite3_step(ppStmt) != 100)
  {
    sqlite3_finalize(ppStmt);
    goto LABEL_23;
  }
  v15 = sqlite3_column_int64(ppStmt, 0);
  sqlite3_finalize(ppStmt);
  if (v15 < 0)
  {
LABEL_23:
    -[MKMessageMigrator insertChatForMessage:forHandleIDs:withGroup:](self, "insertChatForMessage:forHandleIDs:withGroup:", v8, v9, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  v25 = v12;
  v26 = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = v9;
  v17 = v9;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v17);
        -[MKMessageMigrator joinChat:handle:](self, "joinChat:handle:", v16, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          +[MKLog log](MKLog, "log");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[MKMessageMigrator chatIDForMessage:forHandleIDs:withGroup:].cold.1(&v28, v29, v23);

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v19);
  }

  v9 = v27;
  v12 = v25;
  v11 = v26;
LABEL_24:

  return v16;
}

- (id)insertChatForMessage:(id)a3 forHandleIDs:(id)a4 withGroup:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  sqlite3 *database;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  sqlite3_stmt *v29;
  id v30;
  sqlite3_int64 insert_rowid;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  __CFString *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  uint8_t v51;
  _BYTE v52[15];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  sqlite3_stmt *ppStmt;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v47 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(&unk_24E36C7A0, "count"));
  if (objc_msgSend(&unk_24E36C7A0, "count"))
  {
    v11 = 0;
    do
      objc_msgSend(v10, "setObject:atIndexedSubscript:", CFSTR("?"), v11++);
    while (v11 < objc_msgSend(&unk_24E36C7A0, "count"));
  }
  if ((objc_msgSend(v8, "isSent") & 1) != 0)
  {
    objc_msgSend(v8, "recipients");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "sender");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v8, "isSent") & 1) != 0)
  {
    objc_msgSend(v8, "sender");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v9)
  {
    v13 = &stru_24E35A3B8;
  }
  else
  {
    objc_msgSend(v8, "recipients");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (v13)
    v15 = v13;
  else
    v15 = &stru_24E35A3B8;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("P:%@"), v15);
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v50 = v9;
  if (v9)
  {
    objc_msgSend(v9, "roomName");
    v49 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SMS;+;%@"), v49);
    v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ID");
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v46;
  }
  else
  {
    v16 = v46;
    v49 = v46;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SMS;-;%@"), v49);
    v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v44 = (id)objc_claimAutoreleasedReturnValue();

  }
  v18 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(&unk_24E36C7A0, "componentsJoinedByString:", CFSTR(","));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("INSERT INTO chat (%@) VALUES (%@)"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  ppStmt = 0;
  database = self->_database;
  v43 = objc_retainAutorelease(v21);
  if (!sqlite3_prepare(database, (const char *)objc_msgSend(v43, "UTF8String"), -1, &ppStmt, 0))
  {
    if (v9)
      v28 = 43;
    else
      v28 = 45;
    sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v48), "UTF8String"), -1, 0);
    sqlite3_bind_int(ppStmt, 2, v28);
    sqlite3_bind_int(ppStmt, 3, 3);
    sqlite3_bind_text(ppStmt, 4, -[NSString UTF8String](self->_accountGUID, "UTF8String"), -1, 0);
    sqlite3_bind_null(ppStmt, 5);
    sqlite3_bind_text(ppStmt, 6, (const char *)objc_msgSend(objc_retainAutorelease(v49), "UTF8String"), -1, 0);
    sqlite3_bind_text(ppStmt, 7, (const char *)objc_msgSend(CFSTR("SMS"), "UTF8String"), -1, 0);
    v29 = ppStmt;
    if (v9)
    {
      objc_msgSend(v9, "roomName");
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v29, 8, (const char *)objc_msgSend(v30, "UTF8String"), -1, 0);

    }
    else
    {
      sqlite3_bind_null(ppStmt, 8);
    }
    v26 = v45;
    sqlite3_bind_text(ppStmt, 9, (const char *)objc_msgSend(objc_retainAutorelease(v45), "UTF8String"), -1, 0);
    sqlite3_bind_text(ppStmt, 10, (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String"), -1, 0);
    sqlite3_bind_text(ppStmt, 11, (const char *)objc_msgSend(&stru_24E35A3B8, "UTF8String"), -1, 0);
    v27 = v44;
    sqlite3_bind_text(ppStmt, 12, (const char *)objc_msgSend(objc_retainAutorelease(v44), "UTF8String"), -1, 0);
    if (sqlite3_step(ppStmt) == 101)
    {
      insert_rowid = sqlite3_last_insert_rowid(self->_database);
      sqlite3_finalize(ppStmt);
      if (insert_rowid != -1)
      {
        v41 = v13;
        v42 = v8;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", insert_rowid);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v32 = v47;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v54 != v35)
                objc_enumerationMutation(v32);
              -[MKMessageMigrator joinChat:handle:](self, "joinChat:handle:", v24, *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v37)
              {
                +[MKLog log](MKLog, "log");
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  -[MKMessageMigrator chatIDForMessage:forHandleIDs:withGroup:].cold.1(&v51, v52, v38);

              }
            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
          }
          while (v34);
        }

        v13 = v41;
        v8 = v42;
        v16 = v46;
        v25 = v47;
        goto LABEL_22;
      }
    }
    else
    {
      +[MKLog log](MKLog, "log");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[MKApplicationDatabase addIdentifier:].cold.2();

      sqlite3_finalize(ppStmt);
    }
    v24 = 0;
    v25 = v47;
    goto LABEL_47;
  }
  +[MKLog log](MKLog, "log");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    -[MKApplicationDatabase query:].cold.2();

  v24 = 0;
  v25 = v47;
LABEL_22:
  v27 = v44;
  v26 = v45;
LABEL_47:

  return v24;
}

- (id)joinAttachment:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  sqlite3 **p_database;
  sqlite3 *database;
  id v16;
  NSObject *v17;
  sqlite3_int64 insert_rowid;
  void *v19;
  NSObject *v20;
  sqlite3_stmt *ppStmt;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(&unk_24E36C7B8, "count"));
  if (objc_msgSend(&unk_24E36C7B8, "count"))
  {
    v9 = 0;
    do
      objc_msgSend(v8, "setObject:atIndexedSubscript:", CFSTR("?"), v9++);
    while (v9 < objc_msgSend(&unk_24E36C7B8, "count"));
  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(&unk_24E36C7B8, "componentsJoinedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("INSERT INTO message_attachment_join (%@) VALUES (%@)"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  ppStmt = 0;
  p_database = &self->_database;
  database = self->_database;
  v16 = objc_retainAutorelease(v13);
  if (sqlite3_prepare(database, (const char *)objc_msgSend(v16, "UTF8String"), -1, &ppStmt, 0))
  {
    +[MKLog log](MKLog, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase query:].cold.2();

    goto LABEL_14;
  }
  sqlite3_bind_int64(ppStmt, 1, objc_msgSend(v7, "longLongValue"));
  sqlite3_bind_int64(ppStmt, 2, objc_msgSend(v6, "longLongValue"));
  if (sqlite3_step(ppStmt) != 101)
  {
    +[MKLog log](MKLog, "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase addIdentifier:].cold.2();

    sqlite3_finalize(ppStmt);
    goto LABEL_14;
  }
  insert_rowid = sqlite3_last_insert_rowid(*p_database);
  sqlite3_finalize(ppStmt);
  if (insert_rowid == -1)
  {
LABEL_14:
    v19 = 0;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", insert_rowid);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v19;
}

- (id)joinChat:(id)a3 handle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  sqlite3 **p_database;
  sqlite3 *database;
  id v16;
  NSObject *v17;
  sqlite3_int64 insert_rowid;
  void *v19;
  NSObject *v20;
  sqlite3_stmt *ppStmt;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(&unk_24E36C7D0, "count"));
  if (objc_msgSend(&unk_24E36C7D0, "count"))
  {
    v9 = 0;
    do
      objc_msgSend(v8, "setObject:atIndexedSubscript:", CFSTR("?"), v9++);
    while (v9 < objc_msgSend(&unk_24E36C7D0, "count"));
  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(&unk_24E36C7D0, "componentsJoinedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("INSERT OR IGNORE INTO chat_handle_join (%@) VALUES (%@)"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  ppStmt = 0;
  p_database = &self->_database;
  database = self->_database;
  v16 = objc_retainAutorelease(v13);
  if (sqlite3_prepare(database, (const char *)objc_msgSend(v16, "UTF8String"), -1, &ppStmt, 0))
  {
    +[MKLog log](MKLog, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase query:].cold.2();

    goto LABEL_14;
  }
  sqlite3_bind_int64(ppStmt, 1, objc_msgSend(v6, "longLongValue"));
  sqlite3_bind_int64(ppStmt, 2, objc_msgSend(v7, "longLongValue"));
  if (sqlite3_step(ppStmt) != 101)
  {
    +[MKLog log](MKLog, "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase addIdentifier:].cold.2();

    sqlite3_finalize(ppStmt);
    goto LABEL_14;
  }
  insert_rowid = sqlite3_last_insert_rowid(*p_database);
  sqlite3_finalize(ppStmt);
  if (insert_rowid == -1)
  {
LABEL_14:
    v19 = 0;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", insert_rowid);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v19;
}

- (id)joinChat:(id)a3 message:(id)a4 date:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  sqlite3 **p_database;
  sqlite3 *database;
  id v18;
  NSObject *v19;
  sqlite3_int64 insert_rowid;
  void *v21;
  NSObject *v22;
  sqlite3_stmt *ppStmt;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(&unk_24E36C7E8, "count"));
  if (objc_msgSend(&unk_24E36C7E8, "count"))
  {
    v11 = 0;
    do
      objc_msgSend(v10, "setObject:atIndexedSubscript:", CFSTR("?"), v11++);
    while (v11 < objc_msgSend(&unk_24E36C7E8, "count"));
  }
  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(&unk_24E36C7E8, "componentsJoinedByString:", CFSTR(","));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("INSERT INTO chat_message_join (%@) VALUES (%@)"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  ppStmt = 0;
  p_database = &self->_database;
  database = self->_database;
  v18 = objc_retainAutorelease(v15);
  if (sqlite3_prepare(database, (const char *)objc_msgSend(v18, "UTF8String"), -1, &ppStmt, 0))
  {
    +[MKLog log](MKLog, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase query:].cold.2();

    goto LABEL_14;
  }
  sqlite3_bind_int64(ppStmt, 1, objc_msgSend(v8, "longLongValue"));
  sqlite3_bind_int64(ppStmt, 2, objc_msgSend(v9, "longLongValue"));
  sqlite3_bind_int64(ppStmt, 3, a5);
  if (sqlite3_step(ppStmt) != 101)
  {
    +[MKLog log](MKLog, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MKApplicationDatabase addIdentifier:].cold.2();

    sqlite3_finalize(ppStmt);
    goto LABEL_14;
  }
  insert_rowid = sqlite3_last_insert_rowid(*p_database);
  sqlite3_finalize(ppStmt);
  if (insert_rowid == -1)
  {
LABEL_14:
    v21 = 0;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", insert_rowid);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v21;
}

- (void)updateClient
{
  sqlite3 **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(v0);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21EC08000, v1, v2, "update failed. %d (%s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_accountGUID, 0);
}

- (void)_import:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21EC08000, v0, v1, "message is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_import:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21EC08000, v0, v1, "message import will be skipped due to empty body.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_import:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21EC08000, v0, v1, "handles is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_import:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21EC08000, v0, v1, "handle ids is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_import:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21EC08000, v0, v1, "message id is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_import:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21EC08000, v0, v1, "chat id is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_import:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21EC08000, v0, v1, "chat join id is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_import:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21EC08000, v0, v1, "attachment id is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_import:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21EC08000, v0, v1, "attachment join id is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)chatIDForMessage:(uint8_t *)a1 forHandleIDs:(_BYTE *)a2 withGroup:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_6_0(&dword_21EC08000, a3, (uint64_t)a3, "chat handle join id is missing", a1);
}

@end
