@implementation ML3MigrationFunction1710061to1750000

void __ML3MigrationFunction1710061to1750000_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "numberForColumnIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(v3, "stringForColumnIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

}

void __ML3MigrationFunction1710061to1750000_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  _QWORD v47[2];
  _QWORD v48[4];
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "executeQuery:withParameters:", CFSTR("SELECT album_pid FROM album WHERE all_compilations = 0 AND album_artist_pid = ? AND album = ?"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "int64ValueForFirstRowAndColumn");

  objc_msgSend(*(id *)(a1 + 32), "executeQuery:withParameters:", CFSTR("SELECT album_pid FROM album WHERE all_compilations = 1 AND album_artist_pid = ? AND album = ?"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "int64ValueForFirstRowAndColumn");
  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeQuery:withParameters:", CFSTR("SELECT item_pid FROM item WHERE album_pid = ?"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __ML3MigrationFunction1710061to1750000_block_invoke_3;
  v38[3] = &unk_1E5B65EE0;
  v39 = *(id *)(a1 + 40);
  objc_msgSend(v12, "enumerateRowsWithBlock:", v38);
  v13 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v14;
  v48[1] = &unk_1E5BAAB78;
  v48[2] = &unk_1E5BAAB90;
  v48[3] = &unk_1E5BAABC0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  LOBYTE(v13) = objc_msgSend(v13, "executeUpdate:withParameters:error:", CFSTR("INSERT OR REPLACE INTO entity_revision (entity_pid, revision_type, deleted, class) VALUES(?, ?, ?, ?)"), v15, &v37);
  v16 = v37;

  if ((v13 & 1) == 0)
  {
    v17 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v18;
      v43 = 2114;
      v44 = v16;
      _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_ERROR, "Could not update entity_revision table for album_pid=%{public}@, error=%{public}@", buf, 0x16u);

    }
  }
  v19 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v16;
  v23 = objc_msgSend(v19, "executeUpdate:withParameters:error:", CFSTR("UPDATE item SET album_pid = ? WHERE album_pid = ?"), v22, &v36);
  v24 = v36;

  if ((v23 & 1) == 0)
  {
    v25 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v26;
      v43 = 2114;
      v44 = v27;
      v45 = 2114;
      v46 = v24;
      _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_ERROR, "Could not update item album_pid from %{public}@ to %{public}@ error=%{public}@", buf, 0x20u);

    }
  }
  v28 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v24;
  v31 = objc_msgSend(v28, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM album WHERE album_pid = ?"), v30, &v35);
  v32 = v35;

  if ((v31 & 1) == 0)
  {
    v33 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v34;
      v43 = 2114;
      v44 = v32;
      _os_log_impl(&dword_1AC149000, v33, OS_LOG_TYPE_ERROR, "Could not delete album with pid=%{public}@, error=%{public}@", buf, 0x16u);

    }
  }

}

void __ML3MigrationFunction1710061to1750000_block_invoke_1829(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v14[0] = v3;
  v14[1] = &unk_1E5BAAB78;
  v14[2] = &unk_1E5BAAB78;
  v14[3] = &unk_1E5BAABD8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v4, "executeUpdate:withParameters:error:", CFSTR("INSERT OR REPLACE INTO entity_revision (entity_pid, revision_type, deleted, class) VALUES(?, ?, ?, ?)"), v5, &v9);
  v7 = v9;

  if ((v6 & 1) == 0)
  {
    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v11 = v3;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "Could not update entity_revision table for item_pid=%{public}@, error=%{public}@", buf, 0x16u);
    }

  }
}

void __ML3MigrationFunction1710061to1750000_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "numberForColumnIndex:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
