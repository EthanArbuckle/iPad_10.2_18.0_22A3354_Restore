@implementation ML3MigrationFunction1450010to1450020

void __ML3MigrationFunction1450010to1450020_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "stringForColumnIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataForColumnIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleForColumnIndex:", 2);
  v10 = v9;

  v11 = (void *)MEMORY[0x1E0CB3710];
  MSVPropertyListDataClasses();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v11, "unarchivedObjectOfClasses:fromData:error:", v12, v8, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v18;
  v15 = (void *)objc_msgSend(v13, "mutableCopy");

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("timestamp"));

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v15, v7);
  }
  else
  {
    v17 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v5;
      _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_ERROR, "Failed to decode sbk property values. err=%{public}@", buf, 0xCu);
    }

  }
}

void __ML3MigrationFunction1450010to1450020_block_invoke_1598(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id obj;
  _QWORD v27[6];

  v27[5] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v7, "objectForKey:", CFSTR("item_stats.play_count_user"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longLongValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("item_stats.has_been_played"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "longLongValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("item_stats.bookmark_time_ms"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v7, "objectForKey:", CFSTR("timestamp"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "longLongValue");
  v27[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = *(void **)(a1 + 32);
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v24 + 40);
  objc_msgSend(v23, "executeUpdate:withParameters:error:", CFSTR("INSERT OR REPLACE INTO cloud_kvs (key, play_count_user, has_been_played, bookmark_time_ms, bookmark_sync_timestamp) VALUES (?, ?, ?, ?, ?)"), v22, &obj);
  objc_storeStrong((id *)(v24 + 40), obj);
  v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);

  if (v25)
    *a4 = 1;

}

void __ML3MigrationFunction1450010to1450020_block_invoke_1610(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id obj;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(v7, "stringForColumnIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringForColumnIndex:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 32);
    v15[0] = v9;
    v15[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v13 + 40);
    LOBYTE(v11) = objc_msgSend(v11, "executeUpdate:withParameters:error:", CFSTR("INSERT OR REPLACE INTO _MLDatabaseProperties (key, value) VALUES (?, ?)"), v12, &obj);
    objc_storeStrong((id *)(v13 + 40), obj);

    if ((v11 & 1) == 0)
      *a4 = 1;

  }
}

@end
