@implementation BRCDiskSpaceReclaimer

+ (int)simpleUrgencyForCacheDeleteUrgency:(int)a3
{
  if ((a3 - 1) >= 4)
    return 3;
  else
    return a3;
}

- (BOOL)documentWasCreated:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  -[BRCDiskSpaceReclaimer _updateNonPurgeableCachedSizeForDocument:](self, "_updateNonPurgeableCachedSizeForDocument:", v4);
  v5 = objc_msgSend(v4, "isAutomaticallyEvictable");
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "dbRowID");
  objc_msgSend(v4, "currentVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "execute:", CFSTR("INSERT INTO client_document_access (item_rowid, modify_access_time, properties) VALUES (%llu, %lld, %d)"), v7, objc_msgSend(v8, "mtime"), v5);
  return (char)v4;
}

- (BOOL)documentWasDeleted:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[BRCDiskSpaceReclaimer _updateNonPurgeableCachedSizeForDocument:](self, "_updateNonPurgeableCachedSizeForDocument:", v4);
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "dbRowID");

  LOBYTE(v4) = objc_msgSend(v5, "execute:", CFSTR("DELETE FROM client_document_access WHERE item_rowid = %llu"), v6);
  return (char)v4;
}

- (BOOL)documentWasUpdated:(id)a3 diffs:(unint64_t)a4
{
  int v4;
  id v6;
  char v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  char v16;
  void *v17;
  void *v18;
  int v19;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "isAutomaticallyEvictable");
  if ((v4 & 0x20000) != 0 && (v7 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v9 = objc_msgSend(v6, "isAutomaticallyEvictable");
    objc_msgSend(v6, "orig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asDocument");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9 ^ objc_msgSend(v11, "isAutomaticallyEvictable");

  }
  objc_msgSend(v6, "orig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "asDocument");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasLocalContent");
  v15 = objc_msgSend(v6, "hasLocalContent");

  if ((*(_QWORD *)&v4 & 0xA0000) != 0 || (v8 & 1) != 0 || v14 != v15)
  {
    -[BRCDiskSpaceReclaimer _updateNonPurgeableCachedSizeForDocument:](self, "_updateNonPurgeableCachedSizeForDocument:", v6);
    if ((v4 & 0x20000) != 0)
    {
      -[BRCAccountSession clientDB](self->_session, "clientDB");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentVersion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "execute:", CFSTR("UPDATE client_document_access SET modify_access_time = MAX(access_time, %lld)  WHERE item_rowid = %llu"), objc_msgSend(v18, "mtime"), objc_msgSend(v6, "dbRowID"));

    }
    else
    {
      v19 = 1;
    }
    if ((v8 & v19) == 1)
      v16 = -[BRCDiskSpaceReclaimer documentUpdateEvictability:](self, "documentUpdateEvictability:", v6);
    else
      v16 = v19 & ~(_BYTE)v8;
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (BOOL)documentUpdateEvictability:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  char v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "isAutomaticallyEvictable");
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "dbRowID");

  if (v5)
    v8 = CFSTR("UPDATE client_document_access SET properties = (properties | 0x1) WHERE item_rowid = %llu");
  else
    v8 = CFSTR("UPDATE client_document_access SET properties = (properties & ~0x1) WHERE item_rowid = %llu");
  v9 = objc_msgSend(v6, "execute:", v8, v7);

  return v9;
}

- (BOOL)overwriteDocumentAccessTime:(id)a3 atime:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  void *v11;
  char v12;

  v6 = a3;
  objc_msgSend(v6, "currentVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mtime");

  if (v8 <= a4)
    v9 = a4;
  else
    v9 = v8;
  v10 = objc_msgSend(v6, "isAutomaticallyEvictable");
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "execute:", CFSTR("UPDATE client_document_access SET access_time = %lld, modify_access_time = %llu, properties = (properties | %d) WHERE item_rowid = %llu"), a4, v9, v10, objc_msgSend(v6, "dbRowID"));

  -[BRCDiskSpaceReclaimer _updateNonPurgeableCachedSizeForDocument:](self, "_updateNonPurgeableCachedSizeForDocument:", v6);
  return v12;
}

- (void)didAccessDocument:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unsigned int v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v4 = time(0);
  objc_msgSend(v19, "currentVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mtime");

  v7 = objc_msgSend(v19, "isAutomaticallyEvictable");
  objc_msgSend(v19, "desiredVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "options");

  if ((v9 & 2) != 0)
  {
    objc_msgSend(v19, "desiredVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "options");

    if ((v11 & 8) == 0)
    {
      objc_msgSend(v19, "desiredVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setOptions:", objc_msgSend(v12, "options") | 8);

      objc_msgSend(v19, "saveToDB");
    }
    -[BRCAccountSession clientDB](self->_session, "clientDB");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v19, "dbRowID");
    objc_msgSend(v19, "clientZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dbRowID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "executeWithExpectedIndex:sql:", CFSTR("sqlite_autoindex_client_downloads_2"), CFSTR("UPDATE OR IGNORE client_downloads SET download_priority = %ld, download_request_stamp = %lld WHERE throttle_id = %lld AND +zone_rowid = %@"), 25, v4, v14, v16);

  }
  if (v4 <= v6)
    v17 = v6;
  else
    v17 = v4;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "execute:", CFSTR("UPDATE client_document_access SET access_time = %lld, modify_access_time = %lld, properties = (properties | %d) WHERE item_rowid = %llu"), v4, v17, v7, objc_msgSend(v19, "dbRowID"));

  -[BRCDiskSpaceReclaimer _updateNonPurgeableCachedSizeForDocument:](self, "_updateNonPurgeableCachedSizeForDocument:", v19);
}

- (BOOL)documentWasAccessedRecently:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  time_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "appLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mangledID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentAccessHighPriorityInterval");
  v9 = v8;

  v10 = time(0) - (uint64_t)v9;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "dbRowID");

  v13 = (void *)objc_msgSend(v11, "numberWithSQL:", CFSTR("SELECT access_time > %lld FROM client_document_access WHERE item_rowid = %llu"), v10, v12);
  LOBYTE(v12) = objc_msgSend(v13, "BOOLValue");

  return v12;
}

- (id)accessTimestampForDocument:(id)a3
{
  BRCAccountSession *session;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  session = self->_session;
  v4 = a3;
  -[BRCAccountSession clientDB](session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "dbRowID");

  v7 = (void *)objc_msgSend(v5, "numberWithSQL:", CFSTR("SELECT access_time FROM client_document_access WHERE item_rowid = %llu"), v6);
  return v7;
}

- (void)_updateNonPurgeableCachedSizeByAddingBytes:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[6];

  if (a3)
  {
    -[BRCAccountSession clientState](self->_session, "clientState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("purgeableSpaceDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v6);
      v9 = v8;

      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cacheDeleteRecomputeInterval");
      if (v9 < v11)
      {
        -[BRCAccountSession clientDB](self->_session, "clientDB");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "serialQueue");
        v13 = objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __85__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeByAddingBytes___block_invoke;
        v14[3] = &unk_1E875F828;
        v14[4] = self;
        v14[5] = a3;
        dispatch_async(v13, v14);

      }
    }

  }
}

void __85__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeByAddingBytes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("nonPurgeableSpace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = objc_msgSend(v3, "integerValue");
  objc_msgSend(v4, "numberWithLongLong:", (*(_QWORD *)(a1 + 40) + v5) & ~((*(_QWORD *)(a1 + 40) + v5) >> 63));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("nonPurgeableSpace"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forceBatchStart");

  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __85__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeByAddingBytes___block_invoke_cold_1();

}

- (void)_updateNonPurgeableCachedSizeForDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (**v16)(_QWORD, _QWORD, _QWORD);
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  char v25;
  _QWORD v26[5];

  v4 = a3;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "numberWithSQL:", CFSTR("SELECT MAX(modify_access_time, access_time)   FROM client_document_access  WHERE item_rowid = %llu"), objc_msgSend(v4, "dbRowID"));

  v8 = __83__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeForDocument___block_invoke(v7, v4);
  objc_msgSend(v4, "orig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "asDocument");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = __83__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeForDocument___block_invoke((uint64_t)v10, v10);

  objc_msgSend((id)objc_opt_class(), "accessTimeDeltaForUrgency:", 3);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSince1970");
  v15 = v14;

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __83__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeForDocument___block_invoke_2;
  v26[3] = &__block_descriptor_40_e38_B24__0__BRCDocumentItem_8__NSNumber_16l;
  v26[4] = v15;
  v16 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17A6DB0](v26);
  v17 = ((uint64_t (**)(_QWORD, id, void *))v16)[2](v16, v4, v6);
  objc_msgSend(v4, "orig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "asDocument");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = ((uint64_t (**)(_QWORD, void *, void *))v16)[2](v16, v19, v6);

  if ((v17 & 1) != 0)
  {
    if ((v20 & 1) != 0)
      goto LABEL_12;
    objc_msgSend(v4, "orig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "asDocument");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "hasLocalContent");

    if (!v23)
      goto LABEL_12;
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "isDead"))
  {
    objc_msgSend(v4, "orig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isDead");

    if ((v25 & 1) == 0)
    {
LABEL_10:
      v8 = -v11;
LABEL_11:
      -[BRCDiskSpaceReclaimer _updateNonPurgeableCachedSizeByAddingBytes:](self, "_updateNonPurgeableCachedSizeByAddingBytes:", v8);
      goto LABEL_12;
    }
  }
  if ((v20 & 1) != 0)
    goto LABEL_11;
  v8 -= v11;
  if (v8)
    goto LABEL_11;
LABEL_12:

}

uint64_t __83__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeForDocument___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "hasLocalContent"))
  {
    objc_msgSend(v2, "currentVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "size");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __83__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeForDocument___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v5 = a2;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(a3, "longLongValue");
  if (!v7)
  {
    objc_msgSend(v5, "st");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "lastUsedTime");

  }
  objc_msgSend(v5, "currentVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "mtime");

  if (v7 <= v10)
    v11 = v10;
  else
    v11 = v7;
  objc_msgSend(v6, "numberWithLongLong:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(double *)(a1 + 32) >= (double)objc_msgSend(v12, "longLongValue")
    && objc_msgSend(v5, "hasLocalContent"))
  {
    v13 = objc_msgSend(v5, "isAutomaticallyEvictable");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)descriptionForItem:(id)a3 context:(id)a4
{
  id v6;
  BRCAccountSession *session;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;
  const char *v17;
  const __CFString *v18;
  void *v19;

  v6 = a4;
  session = self->_session;
  v8 = a3;
  -[BRCAccountSession clientDB](session, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "dbRowID");

  v11 = (void *)objc_msgSend(v9, "fetch:", CFSTR("SELECT access_time, document_is_evictable(properties) FROM client_document_access WHERE item_rowid = %llu"), v10);
  if (objc_msgSend(v11, "next"))
  {
    v12 = (__CFString *)objc_msgSend(v11, "longLongAtIndex:", 0);
    v13 = objc_msgSend(v11, "longLongAtIndex:", 1);
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(uint64_t)v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceNow");
      +[BRCDumpContext stringFromInterval:context:](BRCDumpContext, "stringFromInterval:context:", v6, -v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" access:%@ ago"), v16);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v17 = "yes";
    if (!v13)
      v17 = "no";
    v18 = &stru_1E8769030;
    if (v12)
      v18 = v12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("evictable:%s%@"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_enumerateItemsForEvictSyncWithBlock:(id)a3 withTimeDelta:(double)a4 onDiskAccessTimeDelta:(double)a5
{
  id v7;
  BRCAccountSession *v8;
  void *v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  BRCAccountSession *v15;
  id v16;
  _QWORD block[4];
  BRCAccountSession *v18;
  BRCDiskSpaceReclaimer *v19;
  id v20;
  unint64_t v21;

  v7 = a3;
  v8 = self->_session;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = (unint64_t)v10;

  v12 = v11 + 1;
  -[BRCAccountSession clientDB](v8, "clientDB");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "serialQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__BRCDiskSpaceReclaimer_LegacyAdditions___enumerateItemsForEvictSyncWithBlock_withTimeDelta_onDiskAccessTimeDelta___block_invoke;
  block[3] = &unk_1E8760188;
  v18 = v8;
  v19 = self;
  v20 = v7;
  v21 = v12;
  v16 = v7;
  v15 = v8;
  dispatch_sync(v14, block);

}

void __115__BRCDiskSpaceReclaimer_LegacyAdditions___enumerateItemsForEvictSyncWithBlock_withTimeDelta_onDiskAccessTimeDelta___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __115__BRCDiskSpaceReclaimer_LegacyAdditions___enumerateItemsForEvictSyncWithBlock_withTimeDelta_onDiskAccessTimeDelta___block_invoke_2;
  v11[3] = &unk_1E8766238;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v12 = v2;
  v13 = v3;
  v14 = v4;
  v5 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17A6DB0](v11);
  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "fetch:", CFSTR("   SELECT dt.throttle_id, dt.zone_rowid      FROM client_downloads AS dt     WHERE dt.download_kind = %d       AND dt.throttle_state = 43"), 0);
  v8 = ((uint64_t (**)(_QWORD, void *, uint64_t))v5)[2](v5, v7, 1);

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "clientDB");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "fetchWithSlowStatementRadar:sql:", CFSTR("<rdar://problem/34004579>"), CFSTR("   SELECT da.item_rowid, ci.zone_rowid      FROM client_document_access AS da, client_items as ci     WHERE da.item_rowid = ci.rowid        AND document_is_evictable(da.properties)        AND access_time < %lld        AND NOT EXISTS(SELECT 1 FROM client_downloads AS dt                       WHERE dt.throttle_id = da.item_rowid                         AND dt.download_kind = %d                         AND dt.throttle_state = 43)  ORDER BY access_time ASC"), *(_QWORD *)(a1 + 56), 0);
    ((uint64_t (**)(_QWORD, void *, _QWORD))v5)[2](v5, v10, 0);

  }
}

uint64_t __115__BRCDiskSpaceReclaimer_LegacyAdditions___enumerateItemsForEvictSyncWithBlock_withTimeDelta_onDiskAccessTimeDelta___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int128 v29;
  uint64_t v31[3];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (objc_msgSend(v4, "next"))
  {
    *(_QWORD *)&v5 = 138412546;
    v29 = v5;
    do
    {
      v6 = (void *)MEMORY[0x1D17A6BE8]();
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v4, "numberAtIndex:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serverZoneByRowID:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clientZone");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "itemByRowID:", objc_msgSend(v4, "integerAtIndex:", 0));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "asDocument");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        brc_bread_crumbs();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v33 = (uint64_t)v21;
          _os_log_fault_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't fetch from the db%@", buf, 0xCu);
        }

        goto LABEL_22;
      }
      memset(v31, 0, sizeof(v31));
      __brc_create_section(0, (uint64_t)"-[BRCDiskSpaceReclaimer(LegacyAdditions) _enumerateItemsForEvictSyncWithBlock:withTimeDelta:onDiskAccessTimeDelta:]_block_invoke", 278, v31);
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v33 = v31[0];
        v34 = 2112;
        v35 = v12;
        v36 = 2112;
        v37 = v13;
        _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx considering eviction for %@%@", buf, 0x20u);
      }

      if ((objc_msgSend(v12, "isAutomaticallyEvictable") & 1) != 0 || a3 && (objc_msgSend(v12, "isEvictable") & 1) != 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "downloadTrackers", v29);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fileObjectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "hasPendingTrackerForFileObjectID:", v16);

        if (v17)
        {
          brc_bread_crumbs();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "itemID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v29;
            v33 = (uint64_t)v20;
            v34 = 2112;
            v35 = v18;
            _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ isn't automatically evictable because has a pending read%@", buf, 0x16u);

          }
        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "notificationManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "st");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "documentID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v23, "hasWatcherForDocumentID:", v25);

          if (!v26)
          {
            if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() & 1) == 0)
            {
              objc_msgSend(v4, "close");
              __brc_leave_section(v31);

              objc_autoreleasePoolPop(v6);
              break;
            }
            goto LABEL_21;
          }
          brc_bread_crumbs();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "itemID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v29;
            v33 = (uint64_t)v27;
            v34 = 2112;
            v35 = v18;
            _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ isn't automatically evictable because has a registered file presenters%@", buf, 0x16u);

          }
        }

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "documentUpdateEvictability:", v12, v29);
      }
LABEL_21:
      __brc_leave_section(v31);
LABEL_22:

      objc_autoreleasePoolPop(v6);
    }
    while ((objc_msgSend(v4, "next") & 1) != 0);
  }

  return 1;
}

+ (double)_onDiskAccessTimeDeltaForUrgency:(int)a3
{
  double v3;
  void *v4;
  double v5;

  v3 = 978307200.0;
  switch(a3)
  {
    case -2:
    case 1:
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "onDiskAccessTimeDeltaInLowUrgency");
      goto LABEL_6;
    case 2:
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "onDiskAccessTimeDeltaInMedUrgency");
      goto LABEL_6;
    case 3:
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "onDiskAccessTimeDeltaInHighUrgency");
      goto LABEL_6;
    case 4:
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "onDiskAccessTimeDeltaInVeryHighUrgency");
LABEL_6:
      v3 = v5;

      break;
    default:
      return v3;
  }
  return v3;
}

- (void)_enumerateItemsForEvictSyncWithBlock:(id)a3 withUrgency:(int)a4
{
  uint64_t v4;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v9 = a3;
  +[BRCDiskSpaceReclaimer accessTimeDeltaForUrgency:](BRCDiskSpaceReclaimer, "accessTimeDeltaForUrgency:", v4);
  v7 = v6;
  +[BRCDiskSpaceReclaimer _onDiskAccessTimeDeltaForUrgency:](BRCDiskSpaceReclaimer, "_onDiskAccessTimeDeltaForUrgency:", v4);
  -[BRCDiskSpaceReclaimer _enumerateItemsForEvictSyncWithBlock:withTimeDelta:onDiskAccessTimeDelta:](self, "_enumerateItemsForEvictSyncWithBlock:withTimeDelta:onDiskAccessTimeDelta:", v9, v7, v8);

}

- (BOOL)renameAndUnlinkInBackgroundItemAtRelpath:(id)a3
{
  id v4;
  id v5;
  char v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__BRCDiskSpaceReclaimer_LegacyAdditions__renameAndUnlinkInBackgroundItemAtRelpath___block_invoke;
  v8[3] = &unk_1E875DEB8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = objc_msgSend(v5, "performOnOpenParentFileDescriptor:error:", v8, 0);

  return v6;
}

uint64_t __83__BRCDiskSpaceReclaimer_LegacyAdditions__renameAndUnlinkInBackgroundItemAtRelpath___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "fileUnlinker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a2) = objc_msgSend(v4, "renameAndUnlinkInBackgroundItemAt:path:", a2, v5);

  if ((a2 & 1) != 0)
    return 0;
  else
    return *__error();
}

- (void)_setupPurgePacer
{
  void *v3;
  br_pacer *v4;
  br_pacer *purgePacer;
  id v6;
  id location;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "purgePacerInterval");

  br_pacer_create();
  v4 = (br_pacer *)objc_claimAutoreleasedReturnValue();
  purgePacer = self->_purgePacer;
  self->_purgePacer = v4;

  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  br_pacer_set_event_handler();
  br_pacer_resume();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__BRCDiskSpaceReclaimer_LegacyAdditions___setupPurgePacer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_requestPurgeSpace");

}

- (void)_requestPurgeSpace
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  _QWORD block[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke;
  block[3] = &unk_1E8760960;
  block[4] = self;
  block[5] = &v19;
  dispatch_sync(v4, block);

  v6 = -[BRCAccountSession availableDiskSpace](self->_session, "availableDiskSpace");
  v7 = v20[3];
  v8 = v7 - v6;
  if (v7 >= v6)
  {
    if (self->_purgeRequest)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[BRCDiskSpaceReclaimer(LegacyAdditions) _requestPurgeSpace].cold.2((uint64_t)v9, v10);
    }
    else
    {
      -[BRCAccountSession volume](self->_session, "volume");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mountPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      br_pacer_suspend();
      v23[0] = CFSTR("CACHE_DELETE_VOLUME");
      v23[1] = CFSTR("CACHE_DELETE_AMOUNT");
      v24[0] = v9;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v10 = objc_claimAutoreleasedReturnValue();

      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[BRCDiskSpaceReclaimer(LegacyAdditions) _requestPurgeSpace].cold.1();

      v17[0] = v5;
      v17[1] = 3221225472;
      v17[2] = __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke_61;
      v17[3] = &unk_1E8766288;
      v17[4] = self;
      self->_purgeRequest = (CacheDeleteToken *)MEMORY[0x1D17A6144](v10, v17);
    }
  }
  else
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", v6, 0, 0, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", v20[3], 0, 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v26 = v11;
      v27 = 2112;
      v28 = v12;
      v29 = 2112;
      v30 = v9;
      _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] not requesting space because we already have enough (available:%@ > required:%@)%@", buf, 0x20u);

    }
  }

  _Block_object_dispose(&v19, 8);
}

uint64_t __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  __int128 v6;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "minimumDiskSpaceRequiredToDownloadUserInitiated");

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke_2;
  v5[3] = &unk_1E8766260;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(v3, "enumerateSupportedFolderTypes:", v5);
}

uint64_t __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "downloadTrackers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v2, "spaceRequiredForTrackers");

  return 1;
}

void __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke_61(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke_61_cold_1();

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke_62;
  block[3] = &unk_1E875D500;
  block[4] = v4;
  dispatch_async(v5, block);
}

uint64_t __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke_62(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  }
  return br_pacer_resume();
}

- (void)requestPurgeSpace
{
  br_pacer_signal();
}

- (void)lowDiskStatusChangedForDevice:(int)a3 hasEnoughSpace:(BOOL)a4
{
  void *v6;
  int v7;

  if (!a4)
  {
    -[BRCAccountSession volume](self->_session, "volume");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "deviceID");

    if (v7 == a3)
      -[BRCDiskSpaceReclaimer requestPurgeSpace](self, "requestPurgeSpace");
  }
}

- (BRCDiskSpaceReclaimer)initWithAccountSession:(id)a3
{
  id v5;
  BRCDiskSpaceReclaimer *v6;
  BRCDiskSpaceReclaimer *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  dispatch_block_t v12;
  void *v13;
  int v14;
  dispatch_time_t v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BRCDiskSpaceReclaimer;
  v6 = -[BRCDiskSpaceReclaimer init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.bird.cache-delete", v9);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    -[BRCDiskSpaceReclaimer _setupPurgePacer](v7, "_setupPurgePacer");
    objc_initWeak(&location, v5);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke;
    v20 = &unk_1E875DC98;
    objc_copyWeak(&v21, &location);
    v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, &v17);
    +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager", v17, v18, v19, v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "connectedToPowerSource");

    if (v14)
    {
      v15 = dispatch_time(0, 5000000000);
      dispatch_after(v15, (dispatch_queue_t)v7->_queue, v12);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id WeakRetained;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  id v15;

  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "connectedToPowerSource");

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "clientDB");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = MEMORY[0x1E0C809B0];
    if (v4)
    {
      objc_msgSend(WeakRetained, "clientDB");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serialQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = v5;
      block[1] = 3221225472;
      block[2] = __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke_2;
      block[3] = &unk_1E875D500;
      v15 = WeakRetained;
      dispatch_sync(v7, block);

    }
    objc_msgSend(WeakRetained, "serverDB");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(WeakRetained, "serverDB");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "serialQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      v12[0] = v5;
      v12[1] = 3221225472;
      v12[2] = __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke_3;
      v12[3] = &unk_1E875D500;
      v13 = WeakRetained;
      dispatch_sync(v10, v12);

    }
  }
}

void __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "autovacuumIfNeeded");

}

void __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "serverDB");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "autovacuumIfNeeded");

}

- (void)close
{
  NSObject *queue;
  br_pacer *purgePacer;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__BRCDiskSpaceReclaimer_close__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_sync(queue, block);
  purgePacer = self->_purgePacer;
  self->_purgePacer = 0;

}

uint64_t __30__BRCDiskSpaceReclaimer_close__block_invoke(uint64_t a1)
{
  const void *v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  }
  return br_pacer_cancel();
}

- (void)computePurgeableSpaceForAllUrgenciesWithReply:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke;
  v7[3] = &unk_1E875EAA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  _QWORD v51[5];
  id v52;
  void (**v53)(_QWORD, _QWORD, _QWORD);
  id v54;
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[5];
  _QWORD v59[6];
  _QWORD block[6];
  uint64_t v61[3];
  _BYTE buf[24];
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 40) || *(_BYTE *)(v2 + 41))
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorOperationCancelled");
    v50 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0);

    return;
  }
  objc_msgSend(*(id *)(v2 + 8), "clientState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("purgeableSpaceDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v6);
  v9 = v8;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cacheDeleteRecomputeInterval");
  v12 = v11;

  if (!v6 || v9 >= v12)
    goto LABEL_14;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("purgeableSpace"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nonPurgeableSpace"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v13 || !v14)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] could not retrieve cached purgeable space%@", buf, 0xCu);
    }

LABEL_14:
    memset(v61, 0, sizeof(v61));
    __brc_create_section(0, (uint64_t)"-[BRCDiskSpaceReclaimer computePurgeableSpaceForAllUrgenciesWithReply:]_block_invoke", 145, v61);
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_4(v61, (uint64_t)v20, v21);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v63 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "serialQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_12;
    block[3] = &unk_1E8760960;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = buf;
    dispatch_sync(v23, block);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "serverDB");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "serialQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    v59[0] = v24;
    v59[1] = 3221225472;
    v59[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_2;
    v59[3] = &unk_1E8760960;
    v59[4] = *(_QWORD *)(a1 + 32);
    v59[5] = buf;
    dispatch_sync(v26, v59);

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "dbReclaimableSpaceThreshold");

    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = (*(_QWORD *)(*(_QWORD *)&buf[8] + 24) - v28) & ~((*(_QWORD *)(*(_QWORD *)&buf[8] + 24)
                                                                                               - v28) >> 63);
    brc_bread_crumbs();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24), 0);
      objc_claimAutoreleasedReturnValue();
      __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_3();
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stageRegistry");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "purgableSpace");

    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", v32, 0);
      objc_claimAutoreleasedReturnValue();
      __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_2();
    }

    v35 = objc_msgSend(*(id *)(a1 + 32), "_computeCiconiaSizeInBytes:", 0);
    v58[0] = v24;
    v58[1] = 3221225472;
    v58[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_15;
    v58[3] = &unk_1E8767CE0;
    v58[4] = *(_QWORD *)(a1 + 32);
    v36 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17A6DB0](v58);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "expensiveReadOnlyDB");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "hasOptimizeStorageEnabled"))
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 1;
      objc_msgSend(v37, "serialQueue");
      v38 = objc_claimAutoreleasedReturnValue();
      v51[0] = v24;
      v51[1] = 3221225472;
      v51[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_3;
      v51[3] = &unk_1E8767D58;
      v51[4] = *(_QWORD *)(a1 + 32);
      v52 = v37;
      v55 = buf;
      v56 = v32;
      v57 = v35;
      v53 = v36;
      v54 = *(id *)(a1 + 40);
      dispatch_async(v38, v51);

    }
    else
    {
      brc_bread_crumbs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_1();

      v41 = (void *)objc_opt_new();
      v42 = v35 + v32;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v42 + *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v43, &unk_1E87D7A18);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v42 + *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v44, &unk_1E87D7A30);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v42 + *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v45, &unk_1E87D7A48);

      v46 = objc_msgSend(*(id *)(a1 + 32), "nonPurgeableSizeWithPurgeableSize:", v42 + *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v36)[2](v36, v41, v47);

      v48 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v46);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, _QWORD))(v48 + 16))(v48, v41, v49, 0);

    }
    _Block_object_dispose(buf, 8);
    __brc_leave_section(v61);
    goto LABEL_26;
  }
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v63 = v16;
    _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] returning purgeable info from cache\npurgeableSpaceByUrgency:%@\nnonPurgeableSpace:%@%@", buf, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_26:

}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_12(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v2, "autovacuumableSpaceInBytes");

}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "serverDB");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v2, "autovacuumableSpaceInBytes");

}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_2_16;
  block[3] = &unk_1E875D448;
  block[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v8, block);

}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_2_16(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 8), "clientState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("purgeableSpaceDate"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", a1[5], CFSTR("purgeableSpace"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", a1[6], CFSTR("nonPurgeableSpace"));
  objc_msgSend(*(id *)(a1[4] + 8), "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceBatchStart");

}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "computeTotalLiveDocumentSizeWithDb:", *(_QWORD *)(a1 + 40));
  +[BRCDiskSpaceReclaimer accessTimeDeltaForUrgency:](BRCDiskSpaceReclaimer, "accessTimeDeltaForUrgency:", 1);
  v4 = v3;
  +[BRCDiskSpaceReclaimer accessTimeDeltaForUrgency:](BRCDiskSpaceReclaimer, "accessTimeDeltaForUrgency:", 2);
  v6 = v5;
  +[BRCDiskSpaceReclaimer accessTimeDeltaForUrgency:](BRCDiskSpaceReclaimer, "accessTimeDeltaForUrgency:", 3);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(v9 + 8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_4;
  v13[3] = &unk_1E8767D30;
  v12 = *(_QWORD *)(a1 + 64);
  v13[4] = v9;
  v16 = v12;
  v17 = *(_OWORD *)(a1 + 72);
  v18 = v2;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  objc_msgSend(v11, "computeTotalEvictableSizeWithAccessLowTimeDelta:medTimeDelta:highTimeDelta:db:reply:", v10, v13, v4, v6, v8);

}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  _QWORD block[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v9 = a5;
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_5;
  block[3] = &unk_1E8767D08;
  v12 = *(_QWORD *)(a1 + 56);
  v18 = v9;
  v22 = v12;
  block[1] = 3221225472;
  v23 = *(_OWORD *)(a1 + 64);
  v24 = a2;
  v25 = a3;
  v13 = *(_QWORD *)(a1 + 80);
  v26 = a4;
  v27 = v13;
  v20 = v10;
  v14 = *(id *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 32);
  v21 = v14;
  v19 = v15;
  v16 = v9;
  dispatch_async(v11, block);

}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_5(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[9] + a1[10] + a1[11] + *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, &unk_1E87D7A18);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[9] + a1[10] + a1[12] + *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, &unk_1E87D7A30);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[9] + a1[10] + a1[13] + *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, &unk_1E87D7A48);

    v6 = a1[14] - a1[13];
    if (v6 < 0)
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v15 = a1[13];
        v16 = a1[14];
        v17 = 134218498;
        v18 = v15;
        v19 = 2048;
        v20 = v16;
        v21 = 2112;
        v22 = v7;
        _os_log_fault_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: purgeable size is greater than non purgeable size (%lld > %lld)%@", (uint8_t *)&v17, 0x20u);
      }

      v6 = 0;
    }
    v9 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v2, v10);

    v11 = a1[7];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, _QWORD))(v11 + 16))(v11, v2, v12, 0);

    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_5_cold_1();

  }
  *(_BYTE *)(a1[5] + 41) = 0;
}

- (int64_t)_computeCiconiaSizeInBytes:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  BOOL v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  char v27;
  id v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  unsigned __int8 v41;
  _BYTE v42[128];
  uint64_t v43;

  v3 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "brc_ciconiaDumpDirForCurrentPersona");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v6, &v41);
  v8 = v41;

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v5, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributesOfItemAtPath:error:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileCreationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "timeIntervalSinceNow");
    v10 = 0;
    if (fabs(v14) > 86400.0)
    {
      v32 = v3;
      v33 = v13;
      v15 = *MEMORY[0x1E0C99998];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99998]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v4;
      objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v16, 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v19)
      {
        v20 = v19;
        v21 = 0;
        v10 = 0;
        v22 = *(_QWORD *)v38;
        do
        {
          v23 = 0;
          v24 = v21;
          do
          {
            if (*(_QWORD *)v38 != v22)
              objc_enumerationMutation(v18);
            v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v23);
            v36 = 0;
            v26 = objc_msgSend(v25, "getResourceValue:forKey:error:", &v36, v15, 0);
            v21 = v36;

            if (v26)
              v10 += objc_msgSend(v21, "unsignedLongLongValue");
            ++v23;
            v24 = v21;
          }
          while (v20 != v23);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v20);
      }
      else
      {
        v21 = 0;
        v10 = 0;
      }

      if (v32)
      {
        v35 = 0;
        v4 = v34;
        v27 = objc_msgSend(v34, "removeItemAtURL:error:", v5, &v35);
        v28 = v35;
        if ((v27 & 1) == 0)
        {
          brc_bread_crumbs();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
            -[BRCDiskSpaceReclaimer _computeCiconiaSizeInBytes:].cold.1();

          v10 = 0;
        }

      }
      else
      {
        v4 = v34;
      }

      v13 = v33;
    }

  }
  return v10;
}

- (int64_t)_dbSizeInBytes:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(v3, "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__BRCDiskSpaceReclaimer__dbSizeInBytes___block_invoke;
    v8[3] = &unk_1E8760960;
    v10 = &v11;
    v9 = v4;
    dispatch_sync(v5, v8);

    v6 = v12[3];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __40__BRCDiskSpaceReclaimer__dbSizeInBytes___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "sizeInBytes");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_dbAutovacuumableSpaceInBytes:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  objc_msgSend(v3, "serialQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v5);

  }
  if (v3)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    objc_msgSend(v3, "serialQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__BRCDiskSpaceReclaimer__dbAutovacuumableSpaceInBytes___block_invoke;
    v9[3] = &unk_1E8760960;
    v11 = &v12;
    v10 = v3;
    dispatch_sync(v6, v9);

    v7 = v13[3];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __55__BRCDiskSpaceReclaimer__dbAutovacuumableSpaceInBytes___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "autovacuumableSpaceInBytes");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_fullVacuumIfPossible:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int64_t v7;

  v4 = a3;
  objc_msgSend(v4, "serialQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "serialQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v6);

  }
  if (v4)
    v7 = -[BRCDiskSpaceReclaimer _doIncrementalVacuum:amount:](self, "_doIncrementalVacuum:amount:", v4, -[BRCDiskSpaceReclaimer _dbAutovacuumableSpaceInBytes:](self, "_dbAutovacuumableSpaceInBytes:", v4));
  else
    v7 = 0;

  return v7;
}

- (int64_t)_doIncrementalVacuum:(id)a3 amount:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  NSObject *v14;
  int64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v23;
  _QWORD block[4];
  id v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "serialQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "serialQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v8);

  }
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v23, "dbAutovacuumBatchSize");
  if (v9)
    v10 = v9;
  else
    v10 = a4;
  mach_absolute_time();
  v11 = -[BRCDiskSpaceReclaimer _dbSizeInBytes:](self, "_dbSizeInBytes:", v6);
  if (a4 >= 1)
  {
    v12 = 0;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      objc_msgSend(v6, "serialQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = v13;
      block[1] = 3221225472;
      block[2] = __53__BRCDiskSpaceReclaimer__doIncrementalVacuum_amount___block_invoke;
      block[3] = &unk_1E87629A8;
      v25 = v6;
      v26 = a4;
      v27 = v12;
      v28 = v10;
      dispatch_sync(v14, block);

      v12 += v10;
    }
    while (v12 < a4);
  }
  v15 = v11 - -[BRCDiskSpaceReclaimer _dbSizeInBytes:](self, "_dbSizeInBytes:", v6);
  mach_absolute_time();
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_monotonic_time_diff_to_interval();
    v20 = v19;
    +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", v15, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v30 = v18;
    v31 = 2048;
    v32 = v20;
    v33 = 2112;
    v34 = v21;
    v35 = 2048;
    v36 = (double)v15 * 100.0 / (double)v11;
    v37 = 2112;
    v38 = v16;
    _os_log_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_INFO, "[INFO] Incremental vacuuming %@ took %f seconds reclaimed %@ (size reduction %.2f percent)%@", buf, 0x34u);

  }
  return v15;
}

uint64_t __53__BRCDiskSpaceReclaimer__doIncrementalVacuum_amount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(a1 + 40) - v1 >= *(_QWORD *)(a1 + 56))
    v2 = *(_QWORD *)(a1 + 56);
  else
    v2 = *(_QWORD *)(a1 + 40) - v1;
  return objc_msgSend(*(id *)(a1 + 32), "incrementalVacuum:", v2);
}

- (int64_t)_vacuumDB:(id)a3 amount:(int64_t)a4 withUrgency:(int)a5
{
  id v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;

  v8 = a3;
  v9 = -[BRCDiskSpaceReclaimer _dbAutovacuumableSpaceInBytes:](self, "_dbAutovacuumableSpaceInBytes:", v8);
  if (v8)
  {
    if (a5 < 3 || 2 * v9 >= a4)
      v10 = -[BRCDiskSpaceReclaimer _doIncrementalVacuum:amount:](self, "_doIncrementalVacuum:amount:", v8, a4);
    else
      v10 = -[BRCDiskSpaceReclaimer _fullVacuumIfPossible:](self, "_fullVacuumIfPossible:", v8);
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_asyncAutovacuumIfNeeds:(id)a3
{
  id v4;
  NSObject *v5;
  BRCAccountSession *session;
  _QWORD block[4];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    session = self->_session;
    if (session)
    {
      if (!-[BRCAccountSession isCancelled](session, "isCancelled"))
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __49__BRCDiskSpaceReclaimer__asyncAutovacuumIfNeeds___block_invoke;
        block[3] = &unk_1E875D500;
        v8 = v4;
        dispatch_async(v5, block);

      }
    }
  }

}

uint64_t __49__BRCDiskSpaceReclaimer__asyncAutovacuumIfNeeds___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "autovacuumIfNeeded");
}

- (int64_t)_purgeSpaceUnderQueue:(int64_t)a3 withUrgency:(int)a4
{
  uint64_t v6;
  void *v7;
  int64_t v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int64_t v26;
  int64_t v27;
  void *v28;
  int64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  BOOL (*v36)(_QWORD *, void *);
  void *v37;
  NSObject *v38;
  uint64_t *v39;
  int64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[BRCDiskSpaceReclaimer _purgeSpaceUnderQueue:withUrgency:].cold.1(a3, (uint64_t)v15, v16);

    +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "connectedToPowerSource");

    if (v18)
    {
      -[BRCAccountSession clientDB](self->_session, "clientDB");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCDiskSpaceReclaimer _asyncAutovacuumIfNeeds:](self, "_asyncAutovacuumIfNeeds:", v19);

      -[BRCAccountSession serverDB](self->_session, "serverDB");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCDiskSpaceReclaimer _asyncAutovacuumIfNeeds:](self, "_asyncAutovacuumIfNeeds:", v20);

    }
    return 0;
  }
  else
  {
    v6 = *(_QWORD *)&a4;
    -[BRCAccountSession stageRegistry](self->_session, "stageRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "purgeSpace:withUrgency:", a3, v6);

    if (v8 >= a3)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[BRCDiskSpaceReclaimer _purgeSpaceUnderQueue:withUrgency:].cold.5(v8, (uint64_t)v21, v22);

    }
    else
    {
      v42 = 0;
      v43 = &v42;
      v44 = 0x2020000000;
      v45 = 0;
      if (-[BRCAccountSession hasOptimizeStorageEnabled](self->_session, "hasOptimizeStorageEnabled"))
      {
        brc_task_tracker_create("com.apple.bird.eviction");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = MEMORY[0x1E0C809B0];
        v35 = 3221225472;
        v36 = __59__BRCDiskSpaceReclaimer__purgeSpaceUnderQueue_withUrgency___block_invoke;
        v37 = &unk_1E8767D80;
        v10 = v9;
        v38 = v10;
        v39 = &v42;
        v40 = v8;
        v41 = a3;
        -[BRCDiskSpaceReclaimer _enumerateItemsForEvictSyncWithBlock:withUrgency:](self, "_enumerateItemsForEvictSyncWithBlock:withUrgency:", &v34, v6);
        v11 = dispatch_time(0, 60000000000);
        if (brc_task_tracker_wait_timeout((uint64_t)v10, v11))
        {
          brc_bread_crumbs();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
            -[BRCDiskSpaceReclaimer _purgeSpaceUnderQueue:withUrgency:].cold.3();

          v43[3] = 0;
        }
        v14 = v38;
      }
      else
      {
        brc_bread_crumbs();
        v10 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[BRCDiskSpaceReclaimer _purgeSpaceUnderQueue:withUrgency:].cold.4();
      }

      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", v43[3], 0);
        objc_claimAutoreleasedReturnValue();
        -[BRCDiskSpaceReclaimer _purgeSpaceUnderQueue:withUrgency:].cold.2();
      }

      v8 += v43[3];
      if (a3 > v8)
      {
        -[BRCAccountSession clientDB](self->_session, "clientDB");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[BRCDiskSpaceReclaimer _vacuumDB:amount:withUrgency:](self, "_vacuumDB:amount:withUrgency:", v25, a3 - v8, v6);

        v8 += v26;
      }
      v27 = a3 - v8;
      if (a3 > v8)
      {
        -[BRCAccountSession serverDB](self->_session, "serverDB");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[BRCDiskSpaceReclaimer _vacuumDB:amount:withUrgency:](self, "_vacuumDB:amount:withUrgency:", v28, v27, v6);

        v8 += v29;
      }
      -[BRCAccountSession clientState](self->_session, "clientState", v34, v35, v36, v37);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKeyedSubscript:", 0, CFSTR("purgeableSpaceDate"));

      -[BRCAccountSession clientState](self->_session, "clientState");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("purgeableSpace"));

      -[BRCAccountSession clientState](self->_session, "clientState");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, CFSTR("nonPurgeableSpace"));

      _Block_object_dispose(&v42, 8);
    }
  }
  return v8;
}

BOOL __59__BRCDiskSpaceReclaimer__purgeSpaceUnderQueue_withUrgency___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL8 v9;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1[4];
  v11 = 0;
  v5 = objc_msgSend(v3, "evictInTask:options:error:", v4, 1, &v11);
  v6 = v11;
  if (v5)
  {
    objc_msgSend(v3, "currentVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += objc_msgSend(v7, "size");
  }
  else
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v13 = v3;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't evict %@: %@%@", buf, 0x20u);
    }

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + a1[6] < a1[7];

  return v9;
}

- (int64_t)purgeSpace:(int64_t)a3 withUrgency:(int)a4
{
  NSObject *queue;
  int64_t v5;
  _QWORD v7[7];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__BRCDiskSpaceReclaimer_purgeSpace_withUrgency___block_invoke;
  v7[3] = &unk_1E8767DA8;
  v7[4] = self;
  v7[5] = &v9;
  v7[6] = a3;
  v8 = a4;
  dispatch_sync(queue, v7);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __48__BRCDiskSpaceReclaimer_purgeSpace_withUrgency___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[40])
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v2, "_purgeSpaceUnderQueue:withUrgency:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(*(id *)(a1 + 32), "_computeCiconiaSizeInBytes:", 1);
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", *(_QWORD *)(a1 + 48), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_DWORD *)(a1 + 56);
      v8 = 138413058;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      v12 = 1024;
      v13 = v7;
      v14 = 2112;
      v15 = v3;
      _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] Purged %@ when asked to purge %@ for urgency %d%@", (uint8_t *)&v8, 0x26u);

    }
  }
}

- (int64_t)periodicReclaimSpace
{
  BRCAccountSession *v3;
  NSObject *queue;
  BRCAccountSession *v5;
  int64_t v6;
  _QWORD block[5];
  BRCAccountSession *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = self->_session;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke;
  block[3] = &unk_1E875D3D8;
  v9 = v3;
  v10 = &v11;
  block[4] = self;
  v5 = v3;
  dispatch_sync(queue, block);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 40))
  {
    objc_msgSend(*(id *)(v1 + 8), "stageRegistry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "purgeSpace:withUrgency:", 0x7FFFFFFFFFFFFFFFLL, 4294967294);
    v6 = *(_QWORD *)(a1 + 48);
    v5 = a1 + 48;
    *(_QWORD *)(*(_QWORD *)(v6 + 8) + 24) += v4;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) += objc_msgSend(*(id *)(v5 - 16), "_computeCiconiaSizeInBytes:", 1);
    objc_msgSend(*(id *)(v5 - 8), "clientDB");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke_2;
    v14[3] = &unk_1E875D8C8;
    v15 = *(id *)(v5 - 8);
    objc_msgSend(v7, "performWithFlags:action:", 1, v14);

    v8 = *(void **)(v5 - 16);
    objc_msgSend(*(id *)(v5 - 8), "clientDB");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) += objc_msgSend(v8, "_fullVacuumIfPossible:", v9);

    v10 = *(void **)(v5 - 16);
    objc_msgSend(*(id *)(v5 - 8), "serverDB");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) += objc_msgSend(v10, "_fullVacuumIfPossible:", v11);

    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke_cold_1(v5, (uint64_t)v12, v13);

  }
}

uint64_t __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "fsReader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteExpiredJobs");

  objc_msgSend(*(id *)(a1 + 32), "fsUploader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteExpiredJobs");

  objc_msgSend(*(id *)(a1 + 32), "fsDownloader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteExpiredJobs");

  objc_msgSend(*(id *)(a1 + 32), "applyScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteExpiredJobs");

  objc_msgSend(*(id *)(a1 + 32), "syncUpScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteExpiredJobs");

  objc_msgSend(*(id *)(a1 + 32), "analyticsReporter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteMissingErrorThrottles");

  return 1;
}

- (int)urgencyForCacheDeleteUrgency:(int)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  BRCAccountSession *session;
  void *v9;
  unint64_t v10;
  BOOL v11;

  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  if ((a3 - 1) >= 2 && a3 != 4)
  {
    if (a3 == 3)
    {
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "minimumDiskSpaceRequiredToDownload");

      session = self->_session;
      a3 = 3;
      if (session)
      {
        -[BRCAccountSession downloadTrackers](session, "downloadTrackers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "spaceRequiredForTrackers") + v7;
        v11 = v10 > -[BRCAccountSession availableDiskSpaceUsingCache:](self->_session, "availableDiskSpaceUsingCache:", 0);

        if (v11)
          return 4;
        else
          return 3;
      }
    }
    else
    {
      return 3;
    }
  }
  return a3;
}

+ (double)accessTimeDeltaForUrgency:(int)a3
{
  double v3;
  void *v4;
  double v5;

  v3 = 978307200.0;
  switch(a3)
  {
    case -2:
    case 1:
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessTimeDeltaInLowUrgency");
      goto LABEL_6;
    case 2:
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessTimeDeltaInMedUrgency");
      goto LABEL_6;
    case 3:
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessTimeDeltaInHighUrgency");
      goto LABEL_6;
    case 4:
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessTimeDeltaInVeryHighUrgency");
LABEL_6:
      v3 = v5;

      break;
    default:
      return v3;
  }
  return v3;
}

- (BOOL)renameAndUnlinkInBackgroundItemAt:(int)a3 path:(id)a4
{
  uint64_t v4;
  BRCAccountSession *session;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  session = self->_session;
  v6 = a4;
  -[BRCAccountSession fileUnlinker](session, "fileUnlinker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "renameAndUnlinkInBackgroundItemAt:path:", v4, v6);

  return v4;
}

- (int64_t)cachedPurgeableSpaceForUrgency:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = *(_QWORD *)&a3;
  -[BRCAccountSession clientState](self->_session, "clientState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("purgeableSpace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  return v8;
}

- (int64_t)cachedNonPurgeableSpace
{
  void *v2;
  void *v3;
  int64_t v4;

  -[BRCAccountSession clientState](self->_session, "clientState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("nonPurgeableSpace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (BOOL)performOptimizeStorageWithTimeDelta:(double)a3 onDiskAccessTimeDelta:(double)a4 error:(id *)a5
{
  void *v9;
  char *v10;
  NSObject *v11;
  id v12;
  dispatch_time_t v13;
  intptr_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  brc_task_tracker_create("com.apple.bird.eviction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v10 = (char *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v10;
    _os_log_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] evicting for storage optimization%@", buf, 0xCu);
  }

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __89__BRCDiskSpaceReclaimer_performOptimizeStorageWithTimeDelta_onDiskAccessTimeDelta_error___block_invoke;
  v22[3] = &unk_1E8767DD0;
  v12 = v9;
  v23 = v12;
  -[BRCDiskSpaceReclaimer _enumerateItemsForEvictSyncWithBlock:withTimeDelta:onDiskAccessTimeDelta:](self, "_enumerateItemsForEvictSyncWithBlock:withTimeDelta:onDiskAccessTimeDelta:", v22, a3, a4);
  v13 = dispatch_time(0, 60000000000);
  v14 = brc_task_tracker_wait_timeout((uint64_t)v12, v13);
  if (v14)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      -[BRCDiskSpaceReclaimer _purgeSpaceUnderQueue:withUrgency:].cold.3();

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:description:", 60, CFSTR("timed out waiting for eviction"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v25 = "-[BRCDiskSpaceReclaimer performOptimizeStorageWithTimeDelta:onDiskAccessTimeDelta:error:]";
        v26 = 2080;
        if (!a5)
          v21 = "(ignored by caller)";
        v27 = v21;
        v28 = 2112;
        v29 = v17;
        v30 = 2112;
        v31 = v18;
        _os_log_error_impl(&dword_1CBD43000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v17);

  }
  return v14 == 0;
}

uint64_t __89__BRCDiskSpaceReclaimer_performOptimizeStorageWithTimeDelta_onDiskAccessTimeDelta_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  char v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v10 = 0;
  v5 = objc_msgSend(v3, "evictInTask:options:error:", v4, 1, &v10);
  v6 = v10;
  if ((v5 & 1) == 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v12 = v3;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't evict %@: %@%@", buf, 0x20u);
    }

  }
  return 1;
}

- (unint64_t)_recursivelySizeDirectoryAtPath:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  unint64_t v6;
  int v7;
  int v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v17[2];
  _BYTE buf[24];
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "length"))
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:].cold.1((uint64_t)v12, v13, v14);

LABEL_14:
    v6 = 0;
    goto LABEL_24;
  }
  v4 = objc_retainAutorelease(v3);
  v5 = (const char *)objc_msgSend(v4, "fileSystemRepresentation");
  v6 = (unint64_t)v5;
  if (v5)
  {
    v7 = open(v5, 1048832);
    if ((v7 & 0x80000000) == 0)
    {
      v8 = v7;
      v19 = 0u;
      *(_OWORD *)&buf[8] = 0u;
      *(_QWORD *)buf = 1;
      if (ffsctl(v7, 0xC0284A20uLL, buf, 0) < 0
        && (*__error() != 45
         || (v17[0] = 0, ffsctl(v8, 0x80084A02uLL, v17, 0) < 0)
         || ffsctl(v8, 0xC0284A20uLL, buf, 0) < 0))
      {
        v17[0] = 0;
        v17[1] = 0;
        if (dirstat_np())
        {
          brc_bread_crumbs();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
            -[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:].cold.3((uint64_t)v4, (uint64_t)v9, v10);
          v6 = 0;
          goto LABEL_23;
        }
        v6 = v17[0];
        brc_bread_crumbs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
LABEL_23:

          close(v8);
          goto LABEL_24;
        }
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v4;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&v19 = v9;
        v11 = "[DEBUG] space for %@ is %llu bytes (hfs compat. dirstat)%@";
      }
      else
      {
        v6 = v19;
        brc_bread_crumbs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          goto LABEL_23;
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v4;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&v19 = v9;
        v11 = "[DEBUG] space for %@ is %llu bytes (apfs dirstat)%@";
      }
      _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, v11, buf, 0x20u);
      goto LABEL_23;
    }
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:].cold.2();

    goto LABEL_14;
  }
LABEL_24:

  return v6;
}

- (unint64_t)nonPurgeableSizeWithPurgeableSize:(unint64_t)a3
{
  unint64_t v4;

  v4 = -[BRCDiskSpaceReclaimer totalSize](self, "totalSize");
  if (v4 >= a3)
    return v4 - a3;
  else
    return 0;
}

- (unint64_t)totalSize
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[BRCAccountSession sessionDirPath](self->_session, "sessionDirPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:](self, "_recursivelySizeDirectoryAtPath:", v3);

  -[BRCAccountSession cacheDirPath](self->_session, "cacheDirPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:](self, "_recursivelySizeDirectoryAtPath:", v5) + v4;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[BRCAccountSession roots](self->_session, "roots", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "absolutePath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += -[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:](self, "_recursivelySizeDirectoryAtPath:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_purgePacer, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __85__BRCDiskSpaceReclaimer_LegacyAdditions___updateNonPurgeableCachedSizeByAddingBytes___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] non-purgeable space was updated to %@%@");
  OUTLINED_FUNCTION_2();
}

void __60__BRCDiskSpaceReclaimer_LegacyAdditions___requestPurgeSpace__block_invoke_61_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] CacheDelete purge request succeeded: %@%@");
  OUTLINED_FUNCTION_2();
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] not account for local document because optimize storage is set to off%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v6, v4, "[DEBUG] reclaimable size from stage is %@%@", v5);

  OUTLINED_FUNCTION_20_0();
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v6, v4, "[DEBUG] reclaimable size from db is %@%@", v5);

  OUTLINED_FUNCTION_20_0();
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_4(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, (uint64_t)a3, "[DEBUG] ┏%llx recomputing purgeable space for all urgencies%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, (uint64_t)v0, "[DEBUG] computed purgable space by urgency: %@%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_computeCiconiaSizeInBytes:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] Failed removing ciconia_diagnose: %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_purgeSpaceUnderQueue:(NSObject *)a3 withUrgency:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", a1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v5, "[DEBUG] no need to evict, amount requested is %@%@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_purgeSpaceUnderQueue:withUrgency:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v6, v4, "[DEBUG] evicted %@ from stage and containers%@", v5);

  OUTLINED_FUNCTION_20_0();
}

- (void)_purgeSpaceUnderQueue:withUrgency:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_1CBD43000, v0, v1, "[ERROR] Timed out waiting for eviction!%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_purgeSpaceUnderQueue:withUrgency:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] not evicting document because optimize storage is off%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_purgeSpaceUnderQueue:(NSObject *)a3 withUrgency:.cold.5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", a1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v5, "[DEBUG] evicted %@ from stage%@", v6);

  OUTLINED_FUNCTION_6();
}

void __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 24), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v6, "[DEBUG] Periodicly reclaimed %@%@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_6();
}

- (void)_recursivelySizeDirectoryAtPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = "-[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:]";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, a2, a3, "[CRIT] UNREACHABLE: calling %s with empty path%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)_recursivelySizeDirectoryAtPath:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: can't open %@%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_recursivelySizeDirectoryAtPath:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int *v6;
  char *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = __error();
  v7 = strerror(*v6);
  v8 = 138412802;
  v9 = a1;
  v10 = 2080;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_fault_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't get size for %@ : %s%@", (uint8_t *)&v8, 0x20u);
}

@end
