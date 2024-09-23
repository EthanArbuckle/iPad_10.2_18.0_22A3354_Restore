@implementation ML3MigrationMigrateLibraryToCurrentVersion

BOOL __ML3MigrationMigrateLibraryToCurrentVersion_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  char v10;
  uint64_t (*v11)(void *, void *);
  uint64_t (*v12)(void *, void *);
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  char v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  uint8_t *v38;
  NSObject *v39;
  id v40;
  void *v41;
  void *v42;
  char v43;
  id v44;
  void *v45;
  char v46;
  int v47;
  NSObject *v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[4];
  void *v60;
  uint8_t buf[4];
  _QWORD v62[16];
  _QWORD v63[7];

  v63[5] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  v3 = *(unsigned int *)(a1 + 72);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  v8 = *(id *)(a1 + 32);
  v9 = v2;
  if (objc_msgSend(v9, "currentUserVersion") == (_DWORD)v3)
  {
    v10 = 1;
  }
  else
  {
    v54 = v6;
    while (1)
    {
      v11 = ML3MigrationFunctionForLibraryVersion(objc_msgSend(v9, "currentUserVersion"));
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No migration path exists to upgrade from (%d) to system version (%d)"), objc_msgSend(v9, "currentUserVersion"), v3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 20;
        goto LABEL_12;
      }
      v12 = v11;
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v14 = v13;
      LOBYTE(v12) = v12(v8, v9);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      if ((v12 & 1) == 0)
        break;
      v16 = v15;
      v17 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend(v9, "currentUserVersion");
        *(_DWORD *)buf = 67109376;
        LODWORD(v62[0]) = v18;
        WORD2(v62[0]) = 2048;
        *(double *)((char *)v62 + 6) = v16 - v14;
        _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_DEFAULT, "[Migration] Database migration to user version %d took %.2fs", buf, 0x12u);
      }

      if (objc_msgSend(v9, "currentUserVersion") == (_DWORD)v3)
      {
        v10 = 1;
        goto LABEL_15;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to upgrade from version %d."), objc_msgSend(v9, "currentUserVersion"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 30;
LABEL_12:
    _ML3MigrationCreateMigrationError(v20, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v6 = objc_retainAutorelease(v21);

      v10 = 0;
    }
    else
    {
      v10 = 0;
      v6 = v54;
    }
  }
LABEL_15:

  objc_storeStrong(v5, v6);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v34 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138543362;
      v62[0] = v35;
      _os_log_impl(&dword_1AC149000, v34, OS_LOG_TYPE_DEFAULT, "[Migration] Migration step failed with error: %{public}@", buf, 0xCu);
    }
    goto LABEL_76;
  }
  v23 = *(void **)(a1 + 40);
  v22 = *(void **)(a1 + 48);
  v24 = *(id *)(a1 + 32);
  v25 = v22;
  v26 = v23;
  if (objc_msgSend(v26, "needsToReloadContainerMediaTypes"))
    +[ML3Container populateMediaTypesOfStaticContainersInLibrary:](ML3Container, "populateMediaTypesOfStaticContainersInLibrary:", v25);
  if (objc_msgSend(v26, "needsToReloadStoreBookmarkMetadataIdentifiers"))
    +[ML3Track updateAllBookmarkableStoreBookmarkMetadataIdentifiersOnConnection:](ML3Track, "updateAllBookmarkableStoreBookmarkMetadataIdentifiersOnConnection:", v24);
  if (objc_msgSend(v26, "needsToRemoveLocationsForItemsMissingAssets")
    && (ML3MigrationRemoveLocationsForItemsMissingAssets(v24) & 1) == 0)
  {
    v36 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      goto LABEL_66;
    *(_WORD *)buf = 0;
    v37 = "[Migration] Failed to remove locations missing assets.";
    goto LABEL_41;
  }
  if (objc_msgSend(v26, "needsToUpdateSortMap")
    && (!objc_msgSend(v25, "inTransactionUpdateSortMapOnConnection:forceUpdateOriginals:", v24, objc_msgSend(v26, "forceUpdateOriginals"))|| (objc_msgSend(v25, "inTransactionUpdateSearchMapOnConnection:", v24) & 1) == 0))
  {
    v36 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      goto LABEL_66;
    *(_WORD *)buf = 0;
    v37 = "[Migration] Failed to update sort map.";
LABEL_41:
    v38 = buf;
LABEL_65:
    _os_log_impl(&dword_1AC149000, v36, OS_LOG_TYPE_DEFAULT, v37, v38, 2u);
    goto LABEL_66;
  }
  if (objc_msgSend(v26, "needsToReloadCollectionRepresentativeItems"))
  {
    v63[0] = objc_opt_class();
    v63[1] = objc_opt_class();
    v63[2] = objc_opt_class();
    v63[3] = objc_opt_class();
    v63[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 5);
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v55, buf, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v56;
      while (2)
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v56 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          if ((objc_msgSend(v32, "canonicalizeCollectionRepresentativeItemsInLibrary:usingConnection:", v25, v24) & 1) == 0)
          {
            v39 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v59 = 138543362;
              v60 = v32;
              _os_log_impl(&dword_1AC149000, v39, OS_LOG_TYPE_DEFAULT, "[Migration] Failed to canonicalize collection representative items for class: %{public}@", v59, 0xCu);
            }

            v33 = 0;
            goto LABEL_46;
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v55, buf, 16);
        if (v29)
          continue;
        break;
      }
    }
    v33 = 1;
LABEL_46:

  }
  else
  {
    v33 = 1;
  }
  if (objc_msgSend(v26, "needsToRecreateIndexes"))
  {
    v40 = v24;
    +[ML3MusicLibrary indexSchemaSQL](ML3MusicLibrary, "indexSchemaSQL");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "allObjects");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = ML3MigrationExecuteSQLArray(v40, v42);

    if ((v43 & 1) == 0)
    {
      v36 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        goto LABEL_66;
      *(_WORD *)v59 = 0;
      v37 = "[Migration] Failed to create indexes.";
LABEL_64:
      v38 = v59;
      goto LABEL_65;
    }
    v33 = 1;
    objc_msgSend(v26, "setNeedsAnalyze:", 1);
  }
  if (!objc_msgSend(v26, "needsToRecreateTriggers"))
    goto LABEL_53;
  v44 = v24;
  +[ML3MusicLibrary allTriggersSQL](ML3MusicLibrary, "allTriggersSQL");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = ML3MigrationExecuteSQLArray(v44, v45);

  if ((v46 & 1) == 0)
  {
    v36 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      goto LABEL_66;
    *(_WORD *)v59 = 0;
    v37 = "[Migration] Failed to create triggers.";
    goto LABEL_64;
  }
  v33 = 1;
  objc_msgSend(v26, "setNeedsAnalyze:", 1);
LABEL_53:
  if (!objc_msgSend(v26, "needsAnalyze"))
    goto LABEL_56;
  if ((objc_msgSend(v24, "executeUpdate:", CFSTR("ANALYZE")) & 1) == 0)
  {
    v36 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v59 = 0;
      v37 = "[Migration] Failed to execute SQLite ANALYZE.";
      goto LABEL_64;
    }
LABEL_66:

    v33 = 0;
    goto LABEL_67;
  }
  v33 = 1;
LABEL_56:
  if (objc_msgSend(v26, "needsToAutogenerateArtworkVariants"))
    objc_msgSend(v25, "autogenerateSupportedSizesForAllOriginalArtworkWithConnection:completionHandler:", v24, &__block_literal_global_9555);
LABEL_67:

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v33;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v50 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v50, OS_LOG_TYPE_DEFAULT, "[Migration] Failed to execute directives after migration.", buf, 2u);
    }

    v49 = 50;
    goto LABEL_75;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = _ML3MigrationPerformPostMigration(*(void **)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 40));
  v47 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v48 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v48, OS_LOG_TYPE_DEFAULT, "[Migration] Post-migration sanity check failed unrecoverably.", buf, 2u);
    }

    v49 = 40;
LABEL_75:
    _ML3MigrationCreateMigrationError(v49, 0);
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v34 = *(NSObject **)(v52 + 40);
    *(_QWORD *)(v52 + 40) = v51;
LABEL_76:

    v47 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  return v47 != 0;
}

@end
