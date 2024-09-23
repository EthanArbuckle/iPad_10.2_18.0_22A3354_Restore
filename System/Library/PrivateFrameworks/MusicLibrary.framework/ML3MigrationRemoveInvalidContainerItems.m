@implementation ML3MigrationRemoveInvalidContainerItems

void __ML3MigrationRemoveInvalidContainerItems_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "numberForColumnIndex:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 1);

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "addIndex:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v7);
  }

}

void __ML3MigrationRemoveInvalidContainerItems_block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, unint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD v23[4];
  _QWORD v24[4];
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __ML3MigrationRemoveInvalidContainerItems_block_invoke_3;
  v17 = &unk_1E5B62C30;
  v20 = v24;
  v18 = *(id *)(a1 + 32);
  v9 = v7;
  v19 = v9;
  v21 = v23;
  v22 = a4;
  objc_msgSend(v8, "enumerateRangesUsingBlock:", &v14);
  v10 = *(void **)(a1 + 32);
  v26[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "executeUpdate:withParameters:error:", CFSTR("REPLACE INTO entity_revision (entity_pid, deleted, class, revision_type) VALUES (?, 0, 1, 0)"), v11, 0);

  v12 = *(void **)(a1 + 32);
  v25 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM entity_revision WHERE entity_pid = ? AND class = 1 AND revision_type > 0"), v13, 0);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);

}

void __ML3MigrationRemoveInvalidContainerItems_block_invoke_3(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[3];
  uint8_t buf[4];
  id v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(_QWORD *)(v6 + 24);
  if (v7)
    v8 = a2 > v7;
  else
    v8 = 1;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void ML3MigrationRemoveInvalidContainerItems(NSString *__strong, ML3DatabaseConnection *__strong)_block_invoke_3");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("ML3MigrationUtilities.m"), 593, CFSTR("[NSIndexSet enumerateRangesUsingBlock:] is not enumerating ranges in order!"));

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  }
  *(_QWORD *)(v6 + 24) = a2;
  v9 = *(void **)(a1 + 32);
  v30[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2 + a3 + ~*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v13 = objc_msgSend(v9, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM container_item WHERE container_pid = ? AND position BETWEEN ? AND ?"), v12, &v26);
  v14 = v26;

  if ((v13 & 1) != 0)
  {
    v15 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    v27[0] = v16;
    v27[1] = v17;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    LOBYTE(v15) = objc_msgSend(v15, "executeUpdate:withParameters:error:", CFSTR("UPDATE container_item SET position = (position - ?) WHERE container_pid = ? AND position >= ?"), v19, &v25);
    v20 = v25;

    if ((v15 & 1) == 0)
    {
      v21 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v29 = v20;
        _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_ERROR, "Failed to update container_item position(s) with error: %{public}@", buf, 0xCu);
      }

      **(_BYTE **)(a1 + 64) = 1;
    }

  }
  else
  {
    v22 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v14;
      _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_ERROR, "Failed to delete existing container_item row(s) with error: %{public}@", buf, 0xCu);
    }

    **(_BYTE **)(a1 + 64) = 1;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += a3;

}

@end
