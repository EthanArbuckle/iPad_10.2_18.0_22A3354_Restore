@implementation ML3MigrationPerformPostMigration

void ___ML3MigrationPerformPostMigration_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void ___ML3MigrationPerformPostMigration_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void ___ML3MigrationPerformPostMigration_block_invoke_63(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "stringForColumnIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v13, "stringForColumnIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sanitizedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  objc_msgSend(v13, "stringForColumnIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v13, "stringForColumnIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sanitizedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

  }
}

void ___ML3MigrationPerformPostMigration_block_invoke_2_66(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a2;
  objc_msgSend(v23, "stringForColumnIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v23, "stringForColumnIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sanitizedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  objc_msgSend(v23, "stringForColumnIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v23, "stringForColumnIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sanitizedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

  }
  objc_msgSend(v23, "stringForColumnIndex:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v23, "stringForColumnIndex:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sanitizedString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v17);

  }
  objc_msgSend(v23, "stringForColumnIndex:", 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v19)
  {
    v20 = *(void **)(a1 + 32);
    objc_msgSend(v23, "stringForColumnIndex:", 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sanitizedString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v22);

  }
}

void ___ML3MigrationPerformPostMigration_block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "stringForColumnIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v13, "stringForColumnIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sanitizedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  objc_msgSend(v13, "stringForColumnIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v13, "stringForColumnIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sanitizedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

  }
}

void ___ML3MigrationPerformPostMigration_block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "stringForColumnIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v13, "stringForColumnIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sanitizedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  objc_msgSend(v13, "stringForColumnIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v13, "stringForColumnIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sanitizedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

  }
}

void ___ML3MigrationPerformPostMigration_block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "stringForColumnIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v13, "stringForColumnIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sanitizedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  objc_msgSend(v13, "stringForColumnIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v13, "stringForColumnIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sanitizedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

  }
}

void ___ML3MigrationPerformPostMigration_block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "stringForColumnIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v8, "stringForColumnIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sanitizedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
}

void ___ML3MigrationPerformPostMigration_block_invoke_79(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = objc_msgSend(v6, "int64ForColumnIndex:", 0);
  v8 = objc_msgSend(v6, "int64ForColumnIndex:", 1);

  if (v7)
  {
    v9 = *(_QWORD *)(a1[4] + 8);
    if (v7 >= *(_QWORD *)(v9 + 24))
    {
      *(_QWORD *)(v9 + 24) = v7;
      if (v8 == -1)
        return;
      v12 = *(_QWORD *)(a1[6] + 8);
      if (v8 >= *(_QWORD *)(v12 + 24))
      {
        *(_QWORD *)(v12 + 24) = v8;
        return;
      }
      v13 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
        v15 = 134218240;
        v16 = v8;
        v17 = 2048;
        v18 = v14;
        _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "[Migration] Sort map nextSection %lli, nameSection %lli", (uint8_t *)&v15, 0x16u);
      }

    }
    else
    {
      v10 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
        v15 = 134218240;
        v16 = v7;
        v17 = 2048;
        v18 = v11;
        _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "[Migration] Sort map nextOrder %lli, nameOrder %lli", (uint8_t *)&v15, 0x16u);
      }

    }
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    *a4 = 1;
  }
}

void ___ML3MigrationPerformPostMigration_block_invoke_84(uint64_t a1)
{
  ML3MaintenanceUtilitiesMarkArtworkPurgeable(*(void **)(a1 + 32));
}

uint64_t ___ML3MigrationPerformPostMigration_block_invoke_106(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "notifyContentsDidChange");
  return result;
}

@end
