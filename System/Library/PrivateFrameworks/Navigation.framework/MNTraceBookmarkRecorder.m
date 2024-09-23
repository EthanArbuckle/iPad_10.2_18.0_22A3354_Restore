@implementation MNTraceBookmarkRecorder

- (MNTraceBookmarkRecorder)initWithTrace:(id)a3
{
  id v5;
  MNTraceBookmarkRecorder *v6;
  MNTraceBookmarkRecorder *v7;
  MNTraceBookmarkRecorder *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNTraceBookmarkRecorder;
  v6 = -[MNTraceBookmarkRecorder init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_trace, a3);
    v8 = v7;
  }

  return v7;
}

- (void)recordBookmarkAtTime:(double)a3 withScreenshotData:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  MNTraceBookmarkRecorder *v16;
  id v17;
  double v18;

  v8 = a4;
  v9 = a5;
  -[MNTrace writeGroup](self->_trace, "writeGroup");
  v10 = objc_claimAutoreleasedReturnValue();
  -[MNTrace writeQueue](self->_trace, "writeQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__MNTraceBookmarkRecorder_recordBookmarkAtTime_withScreenshotData_completionHandler___block_invoke;
  v14[3] = &unk_1E61D7148;
  v15 = v8;
  v16 = self;
  v18 = a3;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_group_async(v10, v11, v14);

}

void __85__MNTraceBookmarkRecorder_recordBookmarkAtTime_withScreenshotData_completionHandler___block_invoke(uint64_t a1)
{
  const char *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;
  uint8_t v11[16];
  uint8_t buf[8];
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (*(_QWORD *)(a1 + 32))
    v2 = "INSERT INTO bookmarks (timestamp, screenshot_data) VALUES (?, ?)";
  else
    v2 = "INSERT INTO bookmarks (timestamp) VALUES (?)";
  if (sqlite3_prepare_v2((sqlite3 *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "db"), v2, -1, &ppStmt, 0))
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
LABEL_12:
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "Error recording trace bookmark", buf, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  sqlite3_bind_double(ppStmt, 1, *(double *)(a1 + 56));
  v4 = *(void **)(a1 + 32);
  if (v4)
    sqlite3_bind_blob(ppStmt, 2, (const void *)objc_msgSend(objc_retainAutorelease(v4), "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"), 0);
  sqlite3_step(ppStmt);
  if (sqlite3_finalize(ppStmt))
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      goto LABEL_12;
    }
LABEL_13:

  }
  v5 = *(void **)(a1 + 48);
  if (!v5)
  {
    v7 = 0;
    goto LABEL_22;
  }
  *(_QWORD *)buf = 0;
  if (sqlite3_prepare_v2((sqlite3 *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "db"), "SELECT Count(*) FROM bookmarks", -1, (sqlite3_stmt **)buf, 0))
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "Error counting trace bookmarks", v11, 2u);
    }
    v7 = 0;
  }
  else
  {
    sqlite3_step(*(sqlite3_stmt **)buf);
    v7 = sqlite3_column_int(*(sqlite3_stmt **)buf, 0);
    if (!sqlite3_finalize(*(sqlite3_stmt **)buf))
      goto LABEL_20;
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "Error counting trace bookmarks", v11, 2u);
    }
  }

LABEL_20:
  v5 = *(void **)(a1 + 48);
LABEL_22:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__MNTraceBookmarkRecorder_recordBookmarkAtTime_withScreenshotData_completionHandler___block_invoke_8;
  block[3] = &unk_1E61D7120;
  block[4] = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __85__MNTraceBookmarkRecorder_recordBookmarkAtTime_withScreenshotData_completionHandler___block_invoke_8(_QWORD *a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1[4] + 8), "setBookmarks:", 0);
  objc_msgSend(*(id *)(a1[4] + 8), "setBookmarkImages:", 0);
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a1[6]);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trace, 0);
}

@end
