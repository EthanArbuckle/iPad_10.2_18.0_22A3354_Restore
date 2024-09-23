@implementation ML3MigrationFunction1710030to1710040

void __ML3MigrationFunction1710030to1710040_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(a2, "int64ForColumnIndex:", 0);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

void __ML3MigrationFunction1710030to1710040_block_invoke_1784(uint64_t a1, void *a2)
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
  v14[2] = &unk_1E5BAAB90;
  v14[3] = &unk_1E5BAABA8;
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
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "Could not update entity_revision table for containerPID=%{public}@, error=%{public}@", buf, 0x16u);
    }

  }
}

@end
