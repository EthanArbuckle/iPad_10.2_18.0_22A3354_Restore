@implementation FCFDBConnection

void __42__FCFDBConnection_selectFeedsWithFeedIDs___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(","));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("'%@'"), v5);

}

- (id)selectFeedsWithFeedIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  const unsigned __int8 *v8;
  sqlite3_int64 v9;
  sqlite3_int64 v10;
  sqlite3_int64 v11;
  const void *v12;
  id v13;
  void *v14;
  sqlite3_stmt *pStmt;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("SELECT * FROM feed WHERE feed_id IN ("));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __42__FCFDBConnection_selectFeedsWithFeedIDs___block_invoke;
  v17[3] = &unk_1E463C690;
  v7 = v6;
  v18 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v17);
  objc_msgSend(v7, "appendString:", CFSTR(");"));
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, v7, &pStmt);
  while (FCFDBInvokeStep(self->_db, pStmt) == 100)
  {
    v8 = sqlite3_column_text(pStmt, 0);
    v9 = sqlite3_column_int64(pStmt, 1);
    v10 = sqlite3_column_int64(pStmt, 2);
    v11 = sqlite3_column_int64(pStmt, 3);
    v12 = sqlite3_column_blob(pStmt, 4);
    v13 = -[FCFDBFeed initFromSQLWithFeedID:feedLookupID:refreshedFromOrder:refreshedToOrder:fetchedRangesBytes:fetchedRangesLength:]([FCFDBFeed alloc], "initFromSQLWithFeedID:feedLookupID:refreshedFromOrder:refreshedToOrder:fetchedRangesBytes:fetchedRangesLength:", v8, v9, v10, v11, v12, sqlite3_column_bytes(pStmt, 4));
    objc_msgSend(v13, "feedID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v13, v14);

  }
  FCFDBInvokeFinalize(self->_db, pStmt);

  return v5;
}

- (FCFDBConnection)initWithPath:(id)a3
{
  id v4;
  FCFDBConnection *v5;
  sqlite3 **p_db;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FCFDBConnection;
  v5 = -[FCFDBConnection init](&v8, sel_init);
  if (v5)
  {
    p_db = &v5->_db;
    if (FCFDBInvokeOpen((const char *)objc_msgSend(objc_retainAutorelease(v4), "cStringUsingEncoding:", 4), &v5->_db))
    {
      if (*p_db)
        sqlite3_close(*p_db);

      v5 = 0;
    }
    else
    {
      -[FCFDBConnection _prepareForUse](v5, "_prepareForUse");
    }
  }

  return v5;
}

- (void)_prepareForUse
{
  sqlite3_busy_timeout(self->_db, 1000);
  FCFDBInvokeExec(self->_db, "PRAGMA journal_mode = WAL;");
  FCFDBInvokeExec(self->_db, "PRAGMA auto_vacuum = incremental");
  FCFDBInvokeExec(self->_db, "CREATE TABLE IF NOT EXISTS metadata (last_feed_lookup_id INTEGER, last_feed_item_id INTEGER);");
  FCFDBInvokeExec(self->_db, "CREATE TABLE IF NOT EXISTS feed (feed_id STRING PRIMARY KEY, lookup_id INTEGER, refreshed_from_order INTEGER, refreshed_to_order INTEGER, fetched_ranges BLOB);");
  FCFDBInvokeExec(self->_db, "CREATE TABLE IF NOT EXISTS feed_item_lookup (feed_lookup_id INTEGER, feed_item_order INTEGER, feature INTEGER);");
  FCFDBInvokeExec(self->_db, "CREATE TABLE IF NOT EXISTS feed_item (id INTEGER PRIMARY KEY, encoded BLOB);");
  FCFDBInvokeExec(self->_db, "CREATE INDEX IF NOT EXISTS index_feed_item_lookup ON feed_item_lookup (feed_lookup_id, feed_item_order, feature);");
}

- (void)dealloc
{
  objc_super v3;

  FCFDBInvokeClose(self->_db);
  v3.receiver = self;
  v3.super_class = (Class)FCFDBConnection;
  -[FCFDBConnection dealloc](&v3, sel_dealloc);
}

- (int64_t)selectMaxFeedLookupID
{
  sqlite3_int64 v3;
  sqlite3_stmt *pStmt;

  pStmt = 0;
  FCFDBInvokePrepare(self->_db, CFSTR("SELECT MAX(lookup_id) FROM feed;"), &pStmt);
  FCFDBInvokeStep(self->_db, pStmt);
  v3 = sqlite3_column_int64(pStmt, 0);
  FCFDBInvokeFinalize(self->_db, pStmt);
  return v3;
}

- (id)selectFeedItemIDsWithFeedLookupIDs:(id)a3 feedRange:(id)a4 feature:(id)a5 maxCount:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  sqlite3_int64 v19;
  void *v20;
  sqlite3_stmt *pStmt;
  _QWORD v23[4];
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("SELECT feed_lookup_id, feed_item_order FROM feed_item_lookup WHERE feed_lookup_id IN ("));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __81__FCFDBConnection_selectFeedItemIDsWithFeedLookupIDs_feedRange_feature_maxCount___block_invoke;
  v23[3] = &unk_1E463C6B8;
  v15 = v14;
  v24 = v15;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v23);
  objc_msgSend(v11, "top");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "order");
  objc_msgSend(v11, "bottom");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendFormat:", CFSTR(") AND feed_item_order <= %llu AND feed_item_order > %llu"), v17, objc_msgSend(v18, "order"));

  objc_msgSend(v15, "appendFormat:", CFSTR(" AND feature = %lld"), objc_msgSend(v12, "hash"));
  if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    objc_msgSend(v15, "appendFormat:", CFSTR(" ORDER BY feed_item_order DESC LIMIT %lu"), a6);
  objc_msgSend(v15, "appendString:", CFSTR(";"));
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, v15, &pStmt);
  while (FCFDBInvokeStep(self->_db, pStmt) == 100)
  {
    v19 = sqlite3_column_int64(pStmt, 0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v19 | (sqlite3_column_int64(pStmt, 1) << 20));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v20);

  }
  FCFDBInvokeFinalize(self->_db, pStmt);

  return v13;
}

void __81__FCFDBConnection_selectFeedItemIDsWithFeedLookupIDs_feedRange_feature_maxCount___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(","));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("'%@'"), v5);

}

- (id)selectAllFeedItemIDsWithFeedLookupIDs:(id)a3 feedRange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  sqlite3_int64 v14;
  void *v15;
  sqlite3_stmt *pStmt;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("SELECT feed_lookup_id, feed_item_order FROM feed_item_lookup WHERE feed_lookup_id IN ("));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__FCFDBConnection_selectAllFeedItemIDsWithFeedLookupIDs_feedRange___block_invoke;
  v18[3] = &unk_1E463C6B8;
  v10 = v9;
  v19 = v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v18);
  objc_msgSend(v7, "top");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "order");
  objc_msgSend(v7, "bottom");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendFormat:", CFSTR(") AND feed_item_order <= %llu AND feed_item_order > %llu"), v12, objc_msgSend(v13, "order"));

  objc_msgSend(v10, "appendString:", CFSTR(";"));
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, v10, &pStmt);
  while (FCFDBInvokeStep(self->_db, pStmt) == 100)
  {
    v14 = sqlite3_column_int64(pStmt, 0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v14 | (sqlite3_column_int64(pStmt, 1) << 20));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v15);

  }
  FCFDBInvokeFinalize(self->_db, pStmt);

  return v8;
}

void __67__FCFDBConnection_selectAllFeedItemIDsWithFeedLookupIDs_feedRange___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(","));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("'%@'"), v5);

}

- (id)selectFeedItemsWithIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  sqlite3_int64 v9;
  const void *v10;
  void *v11;
  void *v12;
  void *v13;
  sqlite3_stmt *pStmt;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("SELECT * FROM feed_item WHERE id IN ("));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __42__FCFDBConnection_selectFeedItemsWithIDs___block_invoke;
  v16[3] = &unk_1E463C6B8;
  v7 = v6;
  v17 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v16);
  objc_msgSend(v7, "appendString:", CFSTR(");"));
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, v7, &pStmt);
  while (FCFDBInvokeStep(self->_db, pStmt) == 100)
  {
    v8 = (void *)MEMORY[0x1A8580B64]();
    v9 = sqlite3_column_int64(pStmt, 0);
    v10 = sqlite3_column_blob(pStmt, 1);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v10, sqlite3_column_bytes(pStmt, 1), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D626D0]), "initWithData:", v11);
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v12, v13);

    }
    objc_autoreleasePoolPop(v8);
  }
  FCFDBInvokeFinalize(self->_db, pStmt);

  return v5;
}

void __42__FCFDBConnection_selectFeedItemsWithIDs___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(","));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("'%@'"), v5);

}

- (void)beginTransaction
{
  sqlite3_stmt *pStmt;

  pStmt = 0;
  FCFDBInvokePrepare(self->_db, CFSTR("BEGIN TRANSACTION;"), &pStmt);
  FCFDBInvokeStep(self->_db, pStmt);
  FCFDBInvokeFinalize(self->_db, pStmt);
}

- (void)commitTransaction
{
  sqlite3_stmt *pStmt;

  pStmt = 0;
  FCFDBInvokePrepare(self->_db, CFSTR("COMMIT;"), &pStmt);
  FCFDBInvokeStep(self->_db, pStmt);
  FCFDBInvokeFinalize(self->_db, pStmt);
}

- (void)insertFeeds:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  sqlite3_stmt *v11;
  id v12;
  void *v13;
  sqlite3_stmt *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  sqlite3_stmt *pStmt;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, CFSTR("INSERT OR REPLACE INTO feed (feed_id, lookup_id, refreshed_from_order, refreshed_to_order, fetched_ranges) VALUES (?, ?, ?, ?, ?);"),
    &pStmt);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = pStmt;
        objc_msgSend(v10, "feedID", (_QWORD)v16);
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        sqlite3_bind_text(v11, 1, (const char *)objc_msgSend(v12, "cStringUsingEncoding:", 4), -1, 0);

        sqlite3_bind_int64(pStmt, 2, objc_msgSend(v10, "feedLookupID"));
        sqlite3_bind_int64(pStmt, 3, objc_msgSend(v10, "refreshedFromOrder"));
        sqlite3_bind_int64(pStmt, 4, objc_msgSend(v10, "refreshedToOrder"));
        objc_msgSend(v10, "fetchedRangesData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = pStmt;
        v15 = objc_retainAutorelease(v13);
        sqlite3_bind_blob(v14, 5, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        FCFDBInvokeStep(self->_db, pStmt);
        sqlite3_reset(pStmt);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v7);
  }

  FCFDBInvokeFinalize(self->_db, pStmt);
}

- (void)insertFeedItems:(id)a3 knownFeedsByID:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  sqlite3_int64 v18;
  void *v19;
  sqlite3_stmt *v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  sqlite3_stmt *pStmt;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, CFSTR("INSERT OR IGNORE INTO feed_item (id, encoded) VALUES (?, ?);"), &pStmt);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v25;
    *(_QWORD *)&v10 = 136315906;
    v23 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v14, "feedID", v23, (_QWORD)v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("attempting to save feed items for a feed that hasn't been faulted in"));
          *(_DWORD *)buf = v23;
          v30 = "-[FCFDBConnection insertFeedItems:knownFeedsByID:]";
          v31 = 2080;
          v32 = "FCFDBConnection.m";
          v33 = 1024;
          v34 = 269;
          v35 = 2114;
          v36 = v22;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        v17 = objc_msgSend(v16, "feedLookupID");
        v18 = v17 | (objc_msgSend(v14, "order") << 20);
        objc_msgSend(v14, "data");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        sqlite3_bind_int64(pStmt, 1, v18);
        v20 = pStmt;
        v21 = objc_retainAutorelease(v19);
        sqlite3_bind_blob(v20, 2, (const void *)objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length"), 0);
        FCFDBInvokeStep(self->_db, pStmt);
        sqlite3_reset(pStmt);

      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
    }
    while (v11);
  }

  FCFDBInvokeFinalize(self->_db, pStmt);
}

- (void)insertIndexesForFeedItems:(id)a3 knownFeedsByID:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  sqlite3_stmt *pStmt;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, CFSTR("INSERT OR IGNORE INTO feed_item_lookup (feed_lookup_id, feed_item_order, feature) VALUES (?, ?, 0);"),
    &pStmt);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
  if (v9)
  {
    v11 = v9;
    v12 = MEMORY[0x1E0C81028];
    v13 = *(_QWORD *)v21;
    *(_QWORD *)&v10 = 136315906;
    v19 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "feedID", v19, (_QWORD)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("attempting to save feed items for a feed that hasn't been faulted in"));
          *(_DWORD *)buf = v19;
          v26 = "-[FCFDBConnection insertIndexesForFeedItems:knownFeedsByID:]";
          v27 = 2080;
          v28 = "FCFDBConnection.m";
          v29 = 1024;
          v30 = 292;
          v31 = 2114;
          v32 = v18;
          _os_log_error_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        sqlite3_bind_int64(pStmt, 1, objc_msgSend(v17, "feedLookupID"));
        sqlite3_bind_int64(pStmt, 2, objc_msgSend(v15, "order"));
        FCFDBInvokeStep(self->_db, pStmt);
        sqlite3_reset(pStmt);

      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
    }
    while (v11);
  }

  FCFDBInvokeFinalize(self->_db, pStmt);
}

- (void)insertFeatureIndexesForFeedItems:(id)a3 knownFeedsByID:(id)a4
{
  id v6;
  sqlite3 *db;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  FCFDBConnection *v12;
  sqlite3_stmt *v13;
  sqlite3_stmt *v14;

  v6 = a4;
  v14 = 0;
  db = self->_db;
  v8 = a3;
  FCFDBInvokePrepare(db, CFSTR("INSERT OR IGNORE INTO feed_item_lookup (feed_lookup_id, feed_item_order, feature) VALUES (?, ?, ?);"),
    &v14);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__FCFDBConnection_insertFeatureIndexesForFeedItems_knownFeedsByID___block_invoke;
  v10[3] = &unk_1E463C708;
  v12 = self;
  v13 = v14;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  FCFDBInvokeFinalize(self->_db, v14);
}

void __67__FCFDBConnection_insertFeatureIndexesForFeedItems_knownFeedsByID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  __int128 v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "feedID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("attempting to index features for a feed that hasn't been faulted in"));
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCFDBConnection insertFeatureIndexesForFeedItems:knownFeedsByID:]_block_invoke";
    v16 = 2080;
    v17 = "FCFDBConnection.m";
    v18 = 1024;
    v19 = 312;
    v20 = 2114;
    v21 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__FCFDBConnection_insertFeatureIndexesForFeedItems_knownFeedsByID___block_invoke_50;
  v10[3] = &unk_1E463C6E0;
  v11 = v6;
  v12 = v3;
  v13 = *(_OWORD *)(a1 + 40);
  v7 = v3;
  v8 = v6;
  objc_msgSend(v7, "enumerateFeaturesWithBlock:", v10);

}

uint64_t __67__FCFDBConnection_insertFeatureIndexesForFeedItems_knownFeedsByID___block_invoke_50(uint64_t a1, void *a2)
{
  sqlite3_stmt *v3;
  void *v4;
  id v5;
  sqlite3_stmt *v6;
  sqlite3_int64 v7;

  v3 = *(sqlite3_stmt **)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  sqlite3_bind_int64(v3, 1, objc_msgSend(v4, "feedLookupID"));
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 56), 2, objc_msgSend(*(id *)(a1 + 40), "order"));
  v6 = *(sqlite3_stmt **)(a1 + 56);
  v7 = objc_msgSend(v5, "hash");

  sqlite3_bind_int64(v6, 3, v7);
  FCFDBInvokeStep(*(sqlite3 **)(*(_QWORD *)(a1 + 48) + 8), *(sqlite3_stmt **)(a1 + 56));
  return sqlite3_reset(*(sqlite3_stmt **)(a1 + 56));
}

- (void)deleteFeedItemIndexesFromFeedLookupID:(id)a3 feedRange:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  sqlite3_stmt *pStmt;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "top");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "order");
  objc_msgSend(v7, "bottom");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("DELETE FROM feed_item_lookup WHERE feed_lookup_id = %@ AND feed_item_order <= %llu AND feed_item_order > %llu;"),
    v8,
    v10,
    objc_msgSend(v11, "order"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  pStmt = 0;
  FCFDBInvokePrepare(self->_db, v12, &pStmt);
  FCFDBInvokeStep(self->_db, pStmt);
  FCFDBInvokeFinalize(self->_db, pStmt);

}

- (void)deleteFeedItemsWithIDs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  sqlite3_stmt *pStmt;
  _QWORD v9[4];
  id v10;

  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = a3;
  objc_msgSend(v4, "stringWithString:", CFSTR("DELETE FROM feed_item WHERE id IN ("));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__FCFDBConnection_deleteFeedItemsWithIDs___block_invoke;
  v9[3] = &unk_1E463C6B8;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  objc_msgSend(v7, "appendString:", CFSTR(");"));
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, v7, &pStmt);
  FCFDBInvokeStep(self->_db, pStmt);
  FCFDBInvokeFinalize(self->_db, pStmt);

}

void __42__FCFDBConnection_deleteFeedItemsWithIDs___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(","));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("'%@'"), v5);

}

- (void)incrementalVacuum
{
  FCFDBInvokeExec(self->_db, "PRAGMA incremental_vacuum;");
}

@end
