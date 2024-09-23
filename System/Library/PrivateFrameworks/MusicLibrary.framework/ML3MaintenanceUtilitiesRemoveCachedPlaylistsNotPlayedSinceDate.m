@implementation ML3MaintenanceUtilitiesRemoveCachedPlaylistsNotPlayedSinceDate

void __ML3MaintenanceUtilitiesRemoveCachedPlaylistsNotPlayedSinceDate_block_invoke(uint64_t a1, uint64_t a2, id *a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v9 = *a3;
  v10 = a3[1];
  v11 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v15 = 134218754;
    v16 = a2;
    v17 = 2114;
    v18 = v10;
    v19 = 2114;
    v20 = v9;
    v21 = 1024;
    v22 = v12;
    _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, "[Maintenance] Purging playlist %lld - %{public}@ (%{public}@), purgedPlaylistCount=%d", (uint8_t *)&v15, 0x26u);
  }

  v13 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

  if (a5 && *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 10)
    *a5 = 1;

}

@end
