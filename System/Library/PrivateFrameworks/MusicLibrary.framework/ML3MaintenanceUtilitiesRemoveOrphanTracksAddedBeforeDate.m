@implementation ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate

void __ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate_block_invoke_9(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", a2, *(_QWORD *)(a1 + 32));
  +[ML3Track containerQueryWithContainer:predicate:](ML3Track, "containerQueryWithContainer:predicate:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("item_extra.title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate_block_invoke_2;
  v6[3] = &unk_1E5B62770;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "enumeratePersistentIDsAndProperties:usingBlock:", v5, v6);

}

void __ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate_block_invoke_11(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *a3;
    v10 = 134218242;
    v11 = a2;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "[PH] %lld - %{public}@", (uint8_t *)&v10, 0x16u);
  }

  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v9);

}

void __ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate_block_invoke_13(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *a3;
    v10 = 134218242;
    v11 = a2;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "[LC] %lld - %{public}@", (uint8_t *)&v10, 0x16u);
  }

  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v9);

}

void __ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate_block_invoke_14(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *a3;
    v8 = a3[1];
    v11 = 134218498;
    v12 = a2;
    v13 = 2114;
    v14 = v7;
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "[LC] %lld - %{public}@ (%{public}@)", (uint8_t *)&v11, 0x20u);
  }

  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v10);

}

void __ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *a3;
    v10 = 134218242;
    v11 = a2;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "[SC] %lld - %{public}@", (uint8_t *)&v10, 0x16u);
  }

  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v9);

}

@end
