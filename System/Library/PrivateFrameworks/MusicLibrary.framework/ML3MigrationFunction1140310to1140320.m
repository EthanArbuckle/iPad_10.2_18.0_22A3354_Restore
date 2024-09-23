@implementation ML3MigrationFunction1140310to1140320

void __ML3MigrationFunction1140310to1140320_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 0);
  objc_msgSend(v3, "stringForColumnIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberForColumnIndex:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  v8 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithObjects:", v9, v5, v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executeQuery:withParameters:", CFSTR("select item_pid from item_store join item_extra using (item_pid) where item_store.sync_id = ? and (item_extra.title = ? or item_extra.total_time_ms = ?)"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "int64ValueForFirstRowAndColumn");

  if (v12)
  {
    v23 = v5;
    v13 = *(void **)(a1 + 32);
    v14 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayWithObjects:", v15, v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v13, "executeUpdate:withParameters:error:", CFSTR("update item_store set sync_id = ? where item_pid = ?"), v17, 0);

    if ((v13 & 1) != 0)
    {
      v18 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "arrayWithObject:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v23;
      if (!objc_msgSend(*(id *)(a1 + 32), "executeUpdate:withParameters:error:", CFSTR("delete from item where item_pid = ?"), v20, 0)|| !objc_msgSend(*(id *)(a1 + 32), "executeUpdate:withParameters:error:", CFSTR("delete from item_extra where item_pid = ?"), v20, 0)|| !objc_msgSend(*(id *)(a1 + 32), "executeUpdate:withParameters:error:", CFSTR("delete from item_store where item_pid = ?"), v20, 0)|| !objc_msgSend(*(id *)(a1 + 32),
                            "executeUpdate:withParameters:error:",
                            CFSTR("delete from item_stats where item_pid = ?"),
                            v20,
                            0)
        || !objc_msgSend(*(id *)(a1 + 32), "executeUpdate:withParameters:error:", CFSTR("delete from item_playback where item_pid = ?"), v20, 0)|| !objc_msgSend(*(id *)(a1 + 32), "executeUpdate:withParameters:error:", CFSTR("delete from item_search where item_pid = ?"), v20, 0)|| !objc_msgSend(*(id *)(a1 + 32), "executeUpdate:withParameters:error:", CFSTR("delete from item_video where item_pid = ?"), v20, 0)|| (objc_msgSend(*(id *)(a1 + 32),
              "executeUpdate:withParameters:error:",
              CFSTR("delete from entity_revision where entity_pid = ?"),
              v20,
              0) & 1) == 0)
      {
        v21 = os_log_create("com.apple.amp.medialibrary", "Migration");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v25 = v4;
          _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_ERROR, "failed to delete duplicate item for %lld", buf, 0xCu);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      }

    }
    else
    {
      v22 = os_log_create("com.apple.amp.medialibrary", "Migration");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v25 = v4;
        _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_ERROR, "failed to merge duplicate items for %lld", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      v5 = v23;
    }
  }

}

@end
