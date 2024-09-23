@implementation BRCContainerMetadataSyncDownOperation

- (BRCContainerMetadataSyncDownOperation)initWithSession:(id)a3 state:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BRCContainerMetadataSyncDownOperation *v12;
  BRCContainerMetadataSyncDownOperation *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "cloudDocsClientZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultAppLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transferSyncContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15.receiver = self;
  v15.super_class = (Class)BRCContainerMetadataSyncDownOperation;
  v12 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v15, sel_initWithName_syncContext_sessionContext_, CFSTR("sync-down/container-metadata"), v11, v7);
  v13 = v12;
  if (v12)
  {
    -[_BRCOperation setNonDiscretionary:](v12, "setNonDiscretionary:", -[BRCContainerMetadataSyncPersistedState hasCaughtUpAtLeastOnce](v12->_state, "hasCaughtUpAtLeastOnce") ^ 1);
    objc_storeStrong((id *)&v13->_session, a3);
    objc_storeStrong((id *)&v13->_state, a4);
  }

  return v13;
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "sync-down/container-metadata", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)performAfterCreatingZoneIfNeeded:(id)a3
{
  void *v4;
  BRCCreateZoneAndSubscribeOperation *v5;
  BRCAccountSession *session;
  void *v7;
  BRCCreateZoneAndSubscribeOperation *v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a3;
  -[BRCContainerMetadataSyncPersistedState serverChangeToken](self->_state, "serverChangeToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v9[2](v9, 0);
  }
  else
  {
    v5 = [BRCCreateZoneAndSubscribeOperation alloc];
    session = self->_session;
    objc_msgSend(MEMORY[0x1E0C95098], "brc_containerMetadataZoneID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[BRCCreateZoneAndSubscribeOperation initWithSession:zoneID:](v5, "initWithSession:zoneID:", session, v7);

    -[BRCCreateZoneAndSubscribeOperation setOptimisticSubscribe:](v8, "setOptimisticSubscribe:", 1);
    -[BRCCreateZoneAndSubscribeOperation setCreateZoneAndSubscribeCompletionBlock:](v8, "setCreateZoneAndSubscribeCompletionBlock:", v9);
    -[_BRCOperation addSubOperation:](self, "addSubOperation:", v8);

  }
}

- (void)performAfterFetchingRecordChanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  NSMutableArray *v24;
  NSMutableArray *recordIDsForDesiredAssets;
  NSMutableArray *v26;
  NSMutableArray *desiredKeysForDesiredAssets;
  NSMutableDictionary *v28;
  NSMutableDictionary *recordIDsToVersionETagsForDesiredAssets;
  NSMutableSet *v30;
  NSMutableSet *containerIDsUpdated;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *);
  void *v35;
  id v36;
  _BYTE *v37;
  __int128 v38;
  uint64_t v39;
  _QWORD v40[5];
  id v41;
  id v42;
  _BYTE *v43;
  _QWORD *v44;
  __int128 v45;
  uint64_t v46;
  _QWORD v47[6];
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  _QWORD v54[3];
  char v55;
  _BYTE buf[24];
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v55 = 0;
  objc_msgSend(MEMORY[0x1E0C95098], "brc_containerMetadataZoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  +[BRCUserDefaults defaultsForMetadataContainer](BRCUserDefaults, "defaultsForMetadataContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResultsLimit:", objc_msgSend(v7, "maxRecordCountInFetchRecordsOperation"));

  BRContainerIconCKAssetKeys();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObject:", CFSTR("infoPlist"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDesiredKeys:", v10);

  -[BRCContainerMetadataSyncPersistedState serverChangeToken](self->_state, "serverChangeToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreviousServerChangeToken:", v11);

  v12 = objc_alloc(MEMORY[0x1E0C94DE8]);
  v60[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v5;
  v59 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithRecordZoneIDs:optionsByRecordZoneID:", v13, v14);

  v16 = (void *)objc_opt_new();
  objc_msgSend(v15, "setConfiguration:", v16);

  objc_msgSend(v15, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSourceApplicationBundleIdentifier:", *MEMORY[0x1E0D10DA0]);

  objc_msgSend(v15, "setShouldFetchAssetContents:", 0);
  v50 = 0uLL;
  v51 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCContainerMetadataSyncDownOperation performAfterFetchingRecordChanges:]", 149, &v50);
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v50;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v57 = v18;
    _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx starting fetch container-metadata changes operation %@%@", buf, 0x20u);
  }

  v52 = v50;
  v53 = v51;
  objc_msgSend(v15, "setFetchAllChanges:", 0);
  v20 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke;
  v47[3] = &unk_1E8761208;
  v48 = v52;
  v49 = v53;
  v47[4] = self;
  v47[5] = v54;
  objc_msgSend(v15, "setRecordChangedBlock:", v47);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v57) = 0;
  v40[0] = v20;
  v40[1] = 3221225472;
  v40[2] = __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_17;
  v40[3] = &unk_1E8761258;
  v45 = v52;
  v46 = v53;
  v43 = buf;
  v40[4] = self;
  v21 = v5;
  v41 = v21;
  v44 = v54;
  v22 = v4;
  v42 = v22;
  objc_msgSend(v15, "setRecordZoneFetchCompletionBlock:", v40);
  v32 = v20;
  v33 = 3221225472;
  v34 = __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_2;
  v35 = &unk_1E8761280;
  v38 = v52;
  v39 = v53;
  v37 = buf;
  v23 = v22;
  v36 = v23;
  objc_msgSend(v15, "setFetchRecordZoneChangesCompletionBlock:", &v32);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  recordIDsForDesiredAssets = self->_recordIDsForDesiredAssets;
  self->_recordIDsForDesiredAssets = v24;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", CFSTR("infoPlist"), 0, v32, v33, v34, v35);
  v26 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  desiredKeysForDesiredAssets = self->_desiredKeysForDesiredAssets;
  self->_desiredKeysForDesiredAssets = v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  recordIDsToVersionETagsForDesiredAssets = self->_recordIDsToVersionETagsForDesiredAssets;
  self->_recordIDsToVersionETagsForDesiredAssets = v28;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v30 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  containerIDsUpdated = self->_containerIDsUpdated;
  self->_containerIDsUpdated = v30;

  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v15);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v54, 8);
}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  char v54;
  __int128 v55;
  uint64_t v56;
  uint8_t v57[128];
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v55 = *(_OWORD *)(a1 + 48);
  v56 = *(_QWORD *)(a1 + 64);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v47 = v3;
  v48 = a1;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "recordID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allKeys");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recordChangeTag");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "modifiedByDevice");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v59 = v55;
    v60 = 2112;
    v61 = v32;
    v62 = 2112;
    v63 = (uint64_t)v33;
    v64 = 2112;
    v65 = v34;
    v66 = 2112;
    v67 = v35;
    v68 = 2112;
    v69 = v4;
    _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx got container-metadata changes for %@ keys:%@ changeTag:%@ modified:%@%@", buf, 0x3Eu);

  }
  objc_msgSend(v3, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordName");
  v46 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)v46;
  if ((objc_msgSend(MEMORY[0x1E0D10E88], "validateContainerID:", v46) & 1) != 0)
  {
    v54 = 0;
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E88]), "initWithAppLibraryName:", v46);
    objc_msgSend(*(id *)(*(_QWORD *)(v48 + 32) + 504), "getOrCreateAppLibraryAndPrivateZonesIfNecessary:appLibraryExists:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v48 + 40) + 8) + 24) = 1;
    if (!v8)
    {
LABEL_19:

      v7 = (void *)v46;
      goto LABEL_20;
    }
    v10 = *(void **)(*(_QWORD *)(v48 + 32) + 544);
    objc_msgSend(v8, "appLibraryID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    objc_msgSend(v47, "brc_containerMetadataPropertiesData");
    v12 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)v12;
    if (v12)
    {
      v53 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v12, 0, 0, &v53, v12);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v53;
      if (!v13)
      {
        brc_bread_crumbs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v59 = (uint64_t)v44;
          v60 = 2112;
          v61 = v45;
          v62 = 2112;
          v63 = (uint64_t)v20;
          _os_log_debug_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] received container-metadata properties plist %@ for %@%@", buf, 0x20u);
        }

        if (!objc_msgSend(MEMORY[0x1E0D10E48], "isDocumentScopePublicWithProperties:mangledID:", v44, v45))
        {
          v17 = 1;
          goto LABEL_15;
        }
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        objc_msgSend(v47, "brc_containerMetadataIconNames");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0;
        v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v50 != v23)
                objc_enumerationMutation(v14);
              v25 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
              objc_msgSend(v9, "containerMetadata");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "hasIconWithName:", v25);

              if ((v27 & 1) == 0)
              {
                brc_bread_crumbs();
                v17 = objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v9, "appLibraryID");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v59 = (uint64_t)v25;
                  v60 = 2112;
                  v61 = v31;
                  v62 = 2112;
                  v63 = v17;
                  _os_log_debug_impl(&dword_1CBD43000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] we'll download icon %@ for container %@%@", buf, 0x20u);

                }
                v29 = *(void **)(*(_QWORD *)(v48 + 32) + 528);
                BRContainerIconCKAssetKeyForName();
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "addObject:", v30);

                LOBYTE(v17) = 1;
              }
            }
            v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          }
          while (v22);

          if ((v17 & 1) != 0)
          {
            v38 = *(void **)(*(_QWORD *)(v48 + 32) + 520);
            objc_msgSend(v47, "recordID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "addObject:", v39);

            v40 = *(void **)(*(_QWORD *)(v48 + 32) + 536);
            objc_msgSend(v47, "etag");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "recordID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setObject:forKey:", v41, v42);

LABEL_18:
            goto LABEL_19;
          }
          v17 = 0;
LABEL_15:
          brc_bread_crumbs();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v47, "recordID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "recordChangeTag");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v59 = (uint64_t)v36;
            v60 = 2112;
            v61 = v37;
            v62 = 2112;
            v63 = (uint64_t)v18;
            _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] updating container-metadata %@ at etag:%@ (no asset downloaded)%@", buf, 0x20u);

          }
          objc_msgSend(v9, "_updateContainerMetadataFromRecord:stripIcons:", v47, v17);
          goto LABEL_18;
        }
LABEL_14:

        goto LABEL_15;
      }
      v14 = v13;
      brc_bread_crumbs();
      v15 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v59 = v46;
        v60 = 2112;
        v61 = v14;
        v62 = 2112;
        v63 = (uint64_t)v15;
        _os_log_error_impl(&dword_1CBD43000, v16, (os_log_type_t)0x90u, "[ERROR] failed parsing container-metadata plist for container %@: %@%@", buf, 0x20u);
      }

    }
    else
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_cold_1();
      v44 = 0;
    }

    v17 = 1;
    goto LABEL_14;
  }
LABEL_20:

  __brc_leave_section((uint64_t *)&v55);
}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_17(uint64_t a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  const char *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  v30 = *(_OWORD *)(a1 + 72);
  v31 = *(_QWORD *)(a1 + 88);
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219266;
    v33 = v30;
    if (a5)
      v23 = "no";
    else
      v23 = "yes";
    v34 = 2112;
    v35 = v12;
    v36 = 2080;
    v37 = v23;
    v38 = 2112;
    v39 = v13;
    v40 = 2112;
    v41 = v14;
    v42 = 2112;
    v43 = v15;
    _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx container-metadata receieved server change token %@, caught-up:%s client change token %@ error:%@%@", buf, 0x3Eu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 552) = a5;
  objc_msgSend(v14, "brc_cloudKitErrorForZone:", *(_QWORD *)(a1 + 40));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "clientTruthWorkloop");
  v18 = objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_20;
  v24[3] = &unk_1E8761230;
  v29 = *(_QWORD *)(a1 + 64);
  v24[4] = *(_QWORD *)(a1 + 32);
  v25 = v13;
  v19 = *(id *)(a1 + 48);
  v27 = v17;
  v28 = v19;
  v26 = v12;
  v20 = v17;
  v21 = v12;
  v22 = v13;
  dispatch_async(v18, v24);

  __brc_leave_section((uint64_t *)&v30);
}

uint64_t __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_20(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "containerScheduler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scheduleSyncDownForSharedDatabaseImmediately:", 1);

  }
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  __int128 v6;
  uint64_t v7;

  v3 = a2;
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_2_cold_1();

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0);
  __brc_leave_section((uint64_t *)&v6);

}

- (void)performAfterFetchingAssetContents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSMutableArray *v12;
  NSMutableArray *desiredKeysForDesiredAssets;
  NSMutableDictionary *recordIDsToVersionETagsForDesiredAssets;
  NSMutableArray *recordIDsForDesiredAssets;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[5];
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  _BYTE buf[24];
  NSMutableArray *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94E18]), "initWithRecordIDs:", self->_recordIDsForDesiredAssets);
  objc_msgSend(v5, "setRecordIDsToVersionETags:", self->_recordIDsToVersionETagsForDesiredAssets);
  objc_msgSend(v5, "setDesiredKeys:", self->_desiredKeysForDesiredAssets);
  objc_msgSend(v5, "operationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0uLL;
  v28 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCContainerMetadataSyncDownOperation performAfterFetchingAssetContents:]", 249, &v27);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    recordIDsForDesiredAssets = self->_recordIDsForDesiredAssets;
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = v27;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2112;
    v30 = recordIDsForDesiredAssets;
    v31 = 2112;
    v32 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx adding sub-operation to fetch asset contents: %@ for records: %@%@", buf, 0x2Au);
  }

  *(_QWORD *)&buf[16] = v28;
  *(_OWORD *)buf = v27;
  v9 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingAssetContents___block_invoke;
  v24[3] = &unk_1E87612A8;
  v25 = v27;
  v26 = v28;
  v24[4] = self;
  objc_msgSend(v5, "setPerRecordCompletionBlock:", v24);
  v16 = v9;
  v17 = 3221225472;
  v18 = __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingAssetContents___block_invoke_29;
  v19 = &unk_1E87612D0;
  v22 = *(_OWORD *)buf;
  v23 = *(_QWORD *)&buf[16];
  v20 = v6;
  v21 = v4;
  v10 = v4;
  v11 = v6;
  objc_msgSend(v5, "setFetchRecordsCompletionBlock:", &v16);
  v12 = self->_recordIDsForDesiredAssets;
  self->_recordIDsForDesiredAssets = 0;

  desiredKeysForDesiredAssets = self->_desiredKeysForDesiredAssets;
  self->_desiredKeysForDesiredAssets = 0;

  recordIDsToVersionETagsForDesiredAssets = self->_recordIDsToVersionETagsForDesiredAssets;
  self->_recordIDsToVersionETagsForDesiredAssets = 0;

  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v5, v16, v17, v18, v19);
}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingAssetContents___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  __int128 v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v31 = *(_OWORD *)(a1 + 40);
  v32 = *(_QWORD *)(a1 + 56);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v34 = (void *)v31;
    v35 = 2112;
    v36 = v8;
    v37 = 2112;
    v38 = v9;
    v39 = 2112;
    v40 = v10;
    _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx per record callback: %@ - %@%@", buf, 0x2Au);
  }

  if (objc_msgSend(v9, "brc_isCloudKitUnknownItemError"))
  {
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 504);
    v13 = objc_alloc(MEMORY[0x1E0D10E88]);
    objc_msgSend(v8, "zoneID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithRecordZoneID:", v14);
    objc_msgSend(v12, "clientZoneByMangledID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "enhancedDrivePrivacyEnabled");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "analyticsReporter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = +[AppTelemetryTimeSeriesEvent newMissingAssetContentEventWithRecordID:enhancedDrivePrivacyEnabled:](AppTelemetryTimeSeriesEvent, "newMissingAssetContentEventWithRecordID:enhancedDrivePrivacyEnabled:", v8, v17);
    objc_msgSend(v18, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v19);

  }
  if (!v9)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingAssetContents___block_invoke_cold_2();

    objc_msgSend(v7, "recordID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "recordName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "appLibraryByID:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v7, "recordID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "recordChangeTag");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v34 = v29;
        v35 = 2112;
        v36 = v30;
        v37 = 2112;
        v38 = v25;
        _os_log_debug_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] updating container metadata %@ at etag:%@ (after asset download)%@", buf, 0x20u);

      }
      objc_msgSend(v24, "_updateContainerMetadataFromRecord:stripIcons:", v7, 0);
    }
    else
    {
      brc_bread_crumbs();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
        __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingAssetContents___block_invoke_cold_1();

    }
  }
  __brc_leave_section((uint64_t *)&v31);

}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingAssetContents___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v13 = *(_OWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 64);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v16 = v13;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx finished %@%@", buf, 0x20u);
  }

  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 134218498;
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEFAULT, "[NOTICE] fetched %lu containers metadata from the cloud - %@%@", buf, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __brc_leave_section((uint64_t *)&v13);

}

- (BOOL)shouldRetryForError:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "brc_isResetError") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BRCContainerMetadataSyncDownOperation;
    v5 = -[_BRCOperation shouldRetryForError:](&v7, sel_shouldRetryForError_, v4);
  }

  return v5;
}

- (void)_completedWithServerChangeToken:(id)a3 requestID:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  _QWORD v11[6];
  _QWORD block[5];
  id v13;
  _QWORD *v14;
  unint64_t v15;
  _QWORD v16[3];
  char v17;

  v6 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__BRCContainerMetadataSyncDownOperation__completedWithServerChangeToken_requestID___block_invoke;
  block[3] = &unk_1E875FFA0;
  block[4] = self;
  v14 = v16;
  v15 = a4;
  v9 = v6;
  v13 = v9;
  dispatch_async_and_wait(v7, block);

  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __83__BRCContainerMetadataSyncDownOperation__completedWithServerChangeToken_requestID___block_invoke_36;
  v11[3] = &unk_1E8760960;
  v11[4] = self;
  v11[5] = v16;
  dispatch_async(v10, v11);

  _Block_object_dispose(v16, 8);
}

uint64_t __83__BRCContainerMetadataSyncDownOperation__completedWithServerChangeToken_requestID___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = *(id *)(a1[4] + 544);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1D17A6BE8]();
        objc_msgSend(*(id *)(a1[4] + 504), "appLibraryByID:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "defaultClientZone");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "recomputeAppSyncBlockState");

        if (v11)
          atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24));

        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v4);
  }

  v12 = *(void **)(a1[4] + 504);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__BRCContainerMetadataSyncDownOperation__completedWithServerChangeToken_requestID___block_invoke_2;
  v18[3] = &__block_descriptor_40_e23_B16__0__BRCAppLibrary_8l;
  v18[4] = a1[7];
  objc_msgSend(v12, "enumerateAppLibraries:", v18);
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v16 = a1[5];
    v17 = a1[7];
    *(_DWORD *)buf = 138412802;
    v24 = v16;
    v25 = 2048;
    v26 = v17;
    v27 = 2112;
    v28 = v13;
    _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] remembering container-metadata server change token %@ requestID %llu%@", buf, 0x20u);
  }

  return objc_msgSend(*(id *)(a1[4] + 512), "updateWithServerChangeToken:requestID:", a1[5], a1[7]);
}

uint64_t __83__BRCContainerMetadataSyncDownOperation__completedWithServerChangeToken_requestID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "containerMetadataSyncRequestID");
  if (v4 == *(_QWORD *)(a1 + 32))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __83__BRCContainerMetadataSyncDownOperation__completedWithServerChangeToken_requestID___block_invoke_2_cold_1();

    objc_msgSend(v3, "setContainerMetadataNeedsSyncUp:", 0);
LABEL_9:
    objc_msgSend(v3, "setContainerMetadataSyncRequestID:", 0);
    goto LABEL_10;
  }
  v7 = v4;
  if (v4)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v12 = 138413058;
      v13 = v3;
      v14 = 2048;
      v15 = v7;
      v16 = 2048;
      v17 = v10;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Sync up of app library container metdata failed for %@ because requestIDs differ %lld vs %lld%@", (uint8_t *)&v12, 0x2Au);
    }

    goto LABEL_9;
  }
LABEL_10:

  return 1;
}

uint64_t __83__BRCContainerMetadataSyncDownOperation__completedWithServerChangeToken_requestID___block_invoke_36(uint64_t a1)
{
  unsigned __int8 v2;
  void *v3;

  v2 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  if ((v2 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "containerScheduler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "refreshPushRegistrationAfterAppsListChanged");

  }
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, 0);
}

- (void)main
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx Sync: syncing down container metadata%@");
  OUTLINED_FUNCTION_2();
}

uint64_t __45__BRCContainerMetadataSyncDownOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "completedWithResult:error:", 0, a2);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__BRCContainerMetadataSyncDownOperation_main__block_invoke_2;
  v4[3] = &unk_1E8761380;
  v4[4] = v2;
  return objc_msgSend(v2, "performAfterFetchingRecordChanges:", v4);
}

void __45__BRCContainerMetadataSyncDownOperation_main__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v7 = a2;
  v8 = v7;
  v9 = *(void **)(a1 + 32);
  if (a4)
  {
    objc_msgSend(v9, "completedWithResult:error:", 0, a4);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__BRCContainerMetadataSyncDownOperation_main__block_invoke_3;
    v10[3] = &unk_1E8761358;
    v10[4] = v9;
    v11 = v7;
    v12 = a3;
    objc_msgSend(v9, "performAfterFetchingAssetContents:", v10);

  }
}

void __45__BRCContainerMetadataSyncDownOperation_main__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  char v5;
  id v6;
  id v7;

  v7 = a2;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "skipContainerRecordsWithMissingAssets");

  if (!v4)
  {
    v6 = v7;
    if (!v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v6);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v7, "brc_checkErrorsFromCloudKit:", &__block_literal_global_22);
  v6 = v7;
  if ((v5 & 1) != 0)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(*(id *)(a1 + 32), "_completedWithServerChangeToken:requestID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_6:

}

uint64_t __45__BRCContainerMetadataSyncDownOperation_main__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "brc_isCloudKitUnknownItemError") ^ 1;
}

- (BOOL)shouldFetchAnotherBatch
{
  return self->_shouldFetchAnotherBatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIDsUpdated, 0);
  objc_storeStrong((id *)&self->_recordIDsToVersionETagsForDesiredAssets, 0);
  objc_storeStrong((id *)&self->_desiredKeysForDesiredAssets, 0);
  objc_storeStrong((id *)&self->_recordIDsForDesiredAssets, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] containerID %@ had no properties plist%@");
  OUTLINED_FUNCTION_2();
}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┳%llx finished operation%@");
  OUTLINED_FUNCTION_2();
}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingAssetContents___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] unknown container %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingAssetContents___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] got asset contents for %@%@");
  OUTLINED_FUNCTION_2();
}

void __83__BRCContainerMetadataSyncDownOperation__completedWithServerChangeToken_requestID___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Sync up of app library container metdata succeeded for %@%@");
  OUTLINED_FUNCTION_2();
}

@end
