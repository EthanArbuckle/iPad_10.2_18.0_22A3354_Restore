@implementation BRCRecentsEnumerator

- (void)dropIndexForClientZone:(id)a3
{
  BRCAccountSession *session;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  session = self->_session;
  v5 = a3;
  -[BRCAccountSession clientDB](session, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertOnQueue");

  +[BRCPersistedState loadFromClientStateInSession:](BRCClientRanksPersistedState, "loadFromClientStateInSession:", self->_session);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allocateNotifRank");

  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dbRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "execute:", CFSTR("INSERT INTO tombstones (file_object_id, file_object_id_type, notif_rank) VALUES (%lld, %d, %lld)"), objc_msgSend(v9, "longLongValue"), 2, v8);
}

- (void)dropItemWithFileObjectID:(id)a3 notifRank:(unint64_t)a4 itemIsLive:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  char v11;
  BRCAccountSession *session;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int v18;

  v8 = a3;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertOnQueue");

  if (a5)
  {
    v10 = 0;
    goto LABEL_11;
  }
  v11 = objc_msgSend(v8, "isFolderOrAliasID");
  session = self->_session;
  if ((v11 & 1) != 0)
  {
    objc_msgSend(v8, "folderID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession globalItemByFileID:](session, "globalItemByFileID:", objc_msgSend(v13, "unsignedLongLongValue"));
  }
  else
  {
    objc_msgSend(v8, "documentID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession globalItemByDocumentID:](session, "globalItemByDocumentID:", objc_msgSend(v13, "unsignedIntValue"));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || (objc_msgSend(v10, "isOnDisk") & 1) == 0)
  {
LABEL_11:
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[BRCRecentsEnumerator(LegacyAdditions) dropItemWithFileObjectID:notifRank:itemIsLive:].cold.1();

    v18 = -[BRCRecentsEnumerator computeTombstoneEntryType:](self, "computeTombstoneEntryType:", v8);
    -[BRCAccountSession clientDB](self->_session, "clientDB");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "execute:", CFSTR("INSERT INTO tombstones (file_object_id, file_object_id_type, notif_rank) VALUES (%lld, %d, %lld)"), objc_msgSend(v8, "rawID"), v18, a4);
    goto LABEL_14;
  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[BRCRecentsEnumerator(LegacyAdditions) dropItemWithFileObjectID:notifRank:itemIsLive:].cold.2();

LABEL_14:
}

+ (void)dropRecentsForSession:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD block[4];
  id v20;
  NSObject *v21;
  _QWORD *v22;
  _QWORD v23[4];
  NSObject *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;

  v5 = a3;
  v6 = a4;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  v28[4] = __Block_byref_object_dispose_;
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  v27 = 0;
  v7 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0D10E78], "br_getDomainIdentifierForCurrentPersona");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CAAD28], "br_sharedProviderManagerWithDomainID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    dispatch_group_enter(v7);
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke;
    v23[3] = &unk_1E875D3B0;
    v25 = v28;
    v24 = v7;
    objc_msgSend(v9, "br_signalWorkingSetEnumeratorWithCompletionHandler:", v23);

  }
  objc_msgSend(v5, "clientDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    dispatch_group_enter(v7);
    objc_msgSend(v11, "serialQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_4;
    block[3] = &unk_1E875D3D8;
    v20 = v11;
    v22 = v26;
    v21 = v7;
    dispatch_async(v12, block);

  }
  dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_8;
  v15[3] = &unk_1E875D400;
  v16 = v6;
  v17 = v28;
  v18 = v26;
  v14 = v6;
  dispatch_group_notify(v7, v13, v15);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);

}

void __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a2;
  if (v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
      __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_4(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (id *)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 32), "execute:", CFSTR("DELETE FROM tombstones")) & 1) != 0)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_4_cold_1((uint64_t)v3, v4);

  }
  else
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
      __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_4_cold_2(v2, (uint64_t)v5, v6);

    objc_msgSend(*(id *)(a1 + 32), "lastError");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v3 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_8(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = a1[4];
  if (result)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
    if (!v3)
      v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

+ (void)dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler:(id)a3
{
  void (**v3)(id, _QWORD);
  int AppBooleanValue;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  void (**v14)(id, _QWORD);
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD))a3;
  if ((objc_msgSend(MEMORY[0x1E0CA6B38], "isIndexingAvailable") & 1) == 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[BRCRecentsEnumerator dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler:].cold.3();
    goto LABEL_8;
  }
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("didDropCoreSpotlightIndex"), (CFStringRef)*MEMORY[0x1E0D10BE0], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && AppBooleanValue)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[BRCRecentsEnumerator dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler:].cold.1();
LABEL_8:

    if (v3)
      v3[2](v3, 0);
    goto LABEL_14;
  }
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] dropping CoreSpotlight index%@", buf, 0xCu);
  }

  v9 = objc_alloc(MEMORY[0x1E0CA6B38]);
  v10 = (void *)objc_msgSend(v9, "initWithName:protectionClass:", CFSTR("com.apple.clouddocs-items"), *MEMORY[0x1E0CB2AC0]);
  if (!v10)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      +[BRCRecentsEnumerator dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler:].cold.2();

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__BRCRecentsEnumerator_dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E8761B08;
  v14 = v3;
  objc_msgSend(v10, "deleteAllSearchableItemsWithCompletionHandler:", v13);

LABEL_14:
}

void __82__BRCRecentsEnumerator_dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  CFStringRef *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      __82__BRCRecentsEnumerator_dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler___block_invoke_cold_3();
LABEL_4:

    goto LABEL_8;
  }
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __82__BRCRecentsEnumerator_dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler___block_invoke_cold_2();

  v8 = (CFStringRef *)MEMORY[0x1E0D10BE0];
  CFPreferencesSetAppValue(CFSTR("didDropCoreSpotlightIndex"), MEMORY[0x1E0C9AAB0], (CFStringRef)*MEMORY[0x1E0D10BE0]);
  if (!CFPreferencesAppSynchronize(*v8))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      __82__BRCRecentsEnumerator_dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler___block_invoke_cold_1((uint64_t)v4, v5, v10);
    goto LABEL_4;
  }
LABEL_8:
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);

}

- (char)computeTombstoneEntryType:(id)a3
{
  return objc_msgSend(a3, "isFolderOrAliasID") ^ 1;
}

- (void)_deleteAllRanks
{
  id v2;

  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "execute:", CFSTR("DELETE FROM tombstones"));

}

- (void)garbageCollectRanksPreceding:(unint64_t)a3
{
  id v4;

  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "execute:", CFSTR("DELETE FROM tombstones WHERE notif_rank < %lld"), a3);

}

- (void)_readyForIndexingWithAckedRank:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  unint64_t flushedNotifRank;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    flushedNotifRank = self->_flushedNotifRank;
    v10 = 134218498;
    v11 = a3;
    v12 = 2048;
    v13 = flushedNotifRank;
    v14 = 2112;
    v15 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Learning index acked rank %llu (flushed rank %llu)%@", (uint8_t *)&v10, 0x20u);
  }

  if (a3 + 1 > self->_flushedNotifRank)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCRecentsEnumerator _readyForIndexingWithAckedRank:].cold.1();

  }
  -[BRCRecentsEnumerator _signalActiveSetDidChange](self, "_signalActiveSetDidChange");
}

- (id)changeTokenForNotifRank:(unint64_t)a3
{
  BRCRecentsChangeToken *v5;
  void *v6;

  v5 = objc_alloc_init(BRCRecentsChangeToken);
  -[BRCRecentsChangeToken setDatabaseID:](v5, "setDatabaseID:", -[BRCAccountSession databaseIDHash](self->_session, "databaseIDHash"));
  -[BRCRecentsChangeToken setNotifRank:](v5, "setNotifRank:", a3);
  -[BRCRecentsChangeToken toData](v5, "toData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_handleResetForRowID:(int64_t)a3 notifRank:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BRCAccountSession *session;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  unint64_t v32;
  _QWORD v33[5];
  id v34;
  id v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  int64_t v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v43 = a3;
    v44 = 2048;
    v45 = a4;
    v46 = 2112;
    v47 = v9;
    _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] handling reset for rowID %lld, notif rank: %llu%@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CAAD28], "br_sharedProviderManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession serverZoneByRowID:](session, "serverZoneByRowID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clientZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "isPrivateZone"))
  {
    v31 = v11;
    v32 = a4;
    objc_msgSend(v15, "asPrivateClientZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appLibraries");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v17, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v15, "asPrivateClientZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appLibraries");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v38;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v38 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v24), "appLibraryID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v18, "addObject:", v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v22);
    }

    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v43 = (int64_t)v18;
      v44 = 2112;
      v45 = (unint64_t)v26;
      _os_log_impl(&dword_1CBD43000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Dropping spotlight index for %@ due to a reset%@", buf, 0x16u);
    }

    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __73__BRCRecentsEnumerator__handleResetForRowID_notifRank_completionHandler___block_invoke;
    v33[3] = &unk_1E875ED90;
    v33[4] = self;
    v34 = v18;
    v36 = v32;
    v35 = v8;
    v28 = v18;
    v11 = v31;
    objc_msgSend(v31, "deleteSearchableItemsWithSpotlightDomainIdentifiers:completionHandler:", v28, v33);

    goto LABEL_20;
  }
  brc_bread_crumbs();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = (int64_t)v29;
    _os_log_impl(&dword_1CBD43000, v30, OS_LOG_TYPE_DEFAULT, "[WARNING] reset zone is not a private zone, skipping%@", buf, 0xCu);
  }

  -[BRCRecentsEnumerator _readyForIndexingWithAckedRank:](self, "_readyForIndexingWithAckedRank:", a4);
  if (v8)
  {
    -[BRCRecentsEnumerator changeTokenForNotifRank:](self, "changeTokenForNotifRank:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v8 + 2))(v8, v17, 0);
LABEL_20:

  }
}

void __73__BRCRecentsEnumerator__handleResetForRowID_notifRank_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  v4 = (void *)a1[5];
  v5 = *(NSObject **)(a1[4] + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__BRCRecentsEnumerator__handleResetForRowID_notifRank_completionHandler___block_invoke_2;
  block[3] = &unk_1E8760138;
  v11 = v3;
  v6 = v4;
  v7 = (void *)a1[6];
  v15 = a1[7];
  v8 = a1[4];
  v12 = v6;
  v13 = v8;
  v14 = v7;
  v9 = v3;
  dispatch_async(v5, block);

}

void __73__BRCRecentsEnumerator__handleResetForRowID_notifRank_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_6;
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, (os_log_type_t)0x90u))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v2;
    _os_log_error_impl(&dword_1CBD43000, v3, (os_log_type_t)0x90u, "[ERROR] Failed to delete searchable items for mangledIDs %@: %@%@", (uint8_t *)&v8, 0x20u);
  }

  if (*(_QWORD *)(a1 + 32))
    v4 = *(_QWORD *)(a1 + 64) - 1;
  else
LABEL_6:
    v4 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "_readyForIndexingWithAckedRank:", v4);
  objc_msgSend(*(id *)(a1 + 48), "changeTokenForNotifRank:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)_deletedDocIdResultSetFromNotifRank:(unint64_t)a3 batchSize:(unint64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return -[BRCPQLConnection fetch:](self->_indexingDB, "fetch:", CFSTR("SELECT file_object_id, file_object_id_type, notif_rank FROM tombstones    WHERE notif_rank >= %lld ORDER BY notif_rank ASC LIMIT %lld"), a3, a4);
}

- (void)maxNotifRankWasFlushed
{
  void *v3;
  void *v4;
  uint64_t v5;
  brc_task_tracker *tracker;
  OS_dispatch_queue *queue;
  _QWORD v8[6];

  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertOnQueue");

  +[BRCPersistedState loadFromClientStateInSession:](BRCClientRanksPersistedState, "loadFromClientStateInSession:", self->_session);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "nextNotifRank") - 1;

  tracker = self->_tracker;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__BRCRecentsEnumerator_maxNotifRankWasFlushed__block_invoke;
  v8[3] = &unk_1E875F828;
  v8[4] = self;
  v8[5] = v5;
  brc_task_tracker_async_with_logs(tracker, queue, v8, &__block_literal_global_37);
}

uint64_t __46__BRCRecentsEnumerator_maxNotifRankWasFlushed__block_invoke(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(v1 + 40) < v2)
  {
    *(_QWORD *)(v1 + 40) = v2;
    return objc_msgSend(*(id *)(result + 32), "_signalActiveSetDidChange");
  }
  return result;
}

- (void)_enumerateChangesFromChangeToken:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t *p_flushedNotifRank;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t (**v18)(_QWORD, _QWORD);
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  BRCRecentsEnumeratorBatch *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  void *v32;
  BOOL v33;
  int v34;
  void *v35;
  NSObject *v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  int v40;
  void *v41;
  NSObject *v42;
  int v43;
  void *v44;
  unint64_t v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  BRCRecentsEnumeratorBatch *v50;
  BRCRecentsChangeToken *v51;
  unint64_t v52;
  unint64_t v53;
  __int128 v54;
  void *context;
  void *v56;
  BRCRecentsChangeToken *v57;
  void *v58;
  unint64_t v59;
  BRCRecentsEnumerator *v60;
  id v61;
  id obj;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[4];
  BRCRecentsEnumeratorBatch *v66;
  BRCRecentsEnumerator *v67;
  BRCRecentsChangeToken *v68;
  id v69;
  unint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[4];
  id v76;
  _QWORD block[6];
  _QWORD v78[7];
  _QWORD v79[5];
  id v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint8_t v93[128];
  uint8_t buf[4];
  unint64_t v95;
  __int16 v96;
  unint64_t v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v61 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v89 = 0;
  v90 = &v89;
  v91 = 0x2020000000;
  v92 = 0;
  v85 = 0;
  v86 = &v85;
  v87 = 0x2020000000;
  v88 = 0;
  v81 = 0;
  v82 = &v81;
  v83 = 0x2020000000;
  v84 = 0;
  v58 = v8;
  if (v8)
  {
    v9 = objc_msgSend(v8, "databaseID");
    if (v9 != -[BRCAccountSession databaseIDHash](self->_session, "databaseIDHash"))
    {
      brc_bread_crumbs();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, (os_log_type_t)0x90u))
        -[BRCRecentsEnumerator _enumerateChangesFromChangeToken:limit:completion:].cold.1();

      -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
      v48 = objc_claimAutoreleasedReturnValue();
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke;
      v79[3] = &unk_1E875EAA8;
      v79[4] = self;
      v80 = v61;
      dispatch_async(v48, v79);

      goto LABEL_60;
    }
    v10 = objc_msgSend(v8, "notifRank");
    v11 = objc_msgSend(v8, "notifRank") + 1;
    p_flushedNotifRank = &self->_flushedNotifRank;
    if (v11 > self->_flushedNotifRank)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v53 = *p_flushedNotifRank;
        *(_DWORD *)buf = 134218498;
        v95 = v11;
        v96 = 2048;
        v97 = v53;
        v98 = 2112;
        v99 = v13;
        _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] incoming rank is newer than what we know about: %lld > %lld, stopping here%@", buf, 0x20u);
      }

      if (v61)
      {
        -[BRCRecentsEnumerator changeTokenForNotifRank:](self, "changeTokenForNotifRank:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *, _QWORD))v61 + 2))(v61, 0, 0, v15, 0);

      }
      goto LABEL_60;
    }
  }
  else
  {
    v11 = 0;
    p_flushedNotifRank = &self->_flushedNotifRank;
  }
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  v60 = self;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v52 = *p_flushedNotifRank;
    *(_DWORD *)buf = 134218498;
    v95 = v11;
    v96 = 2048;
    v97 = v52;
    v98 = 2112;
    v99 = v16;
    _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] enumerating changes from notif rank %llu (max %llu)%@", buf, 0x20u);
  }
  v59 = v11;

  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_68;
  v78[3] = &unk_1E8763DA0;
  v78[4] = &v89;
  v78[5] = &v85;
  v78[6] = &v81;
  v18 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1D17A6DB0](v78);
  -[BRCAccountSession itemsNeedingIndexingEnumeratorFromNotifRank:batchSize:db:](self->_session, "itemsNeedingIndexingEnumeratorFromNotifRank:batchSize:db:", v59, a4, self->_indexingDB);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCRecentsEnumerator _deletedDocIdResultSetFromNotifRank:batchSize:](self, "_deletedDocIdResultSetFromNotifRank:batchSize:", v59, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_74;
  block[3] = &unk_1E875F828;
  block[4] = self;
  block[5] = v59;
  dispatch_async(v20, block);

  v21 = ((uint64_t (**)(_QWORD, void *))v18)[2](v18, v19);
  if (v82[3] == v59 && *((_BYTE *)v86 + 24) == 2)
  {
    v22 = v90[3];
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_2_75;
    v75[3] = &unk_1E8763DC8;
    v76 = v61;
    -[BRCRecentsEnumerator _handleResetForRowID:notifRank:completionHandler:](self, "_handleResetForRowID:notifRank:completionHandler:", v22, v59, v75);

    goto LABEL_59;
  }
  context = (void *)MEMORY[0x1D17A6BE8](v21);
  v57 = objc_alloc_init(BRCRecentsChangeToken);
  v23 = -[BRCRecentsEnumeratorBatch initWithBatchSize:]([BRCRecentsEnumeratorBatch alloc], "initWithBatchSize:", a4);
  -[BRCRecentsChangeToken setDatabaseID:](v57, "setDatabaseID:", -[BRCAccountSession databaseIDHash](self->_session, "databaseIDHash"));
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v56;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v93, 16);
  if (!v24)
    goto LABEL_37;
  v64 = *(_QWORD *)v72;
  *(_QWORD *)&v25 = 134218242;
  v54 = v25;
LABEL_16:
  v26 = 0;
  v63 = v24;
  while (1)
  {
    if (*(_QWORD *)v72 != v64)
      objc_enumerationMutation(obj);
    v27 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v26);
    v28 = (void *)MEMORY[0x1D17A6BE8]();
    while (1)
    {
      v29 = v82[3];
      v30 = objc_msgSend(v27, "notifsRank", v54);
      if (v29 >= v30)
        break;
      if (v82[3] > *p_flushedNotifRank)
        goto LABEL_33;
      v31 = *((unsigned __int8 *)v86 + 24);
      if (v31 == 2)
      {
        brc_bread_crumbs();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          v37 = v90[3];
          *(_DWORD *)buf = v54;
          v95 = v37;
          v96 = 2112;
          v97 = (unint64_t)v35;
          _os_log_debug_impl(&dword_1CBD43000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] found a tombstone entry of type client zone db rowid (%lld), sending current batch%@", buf, 0x16u);
        }

        -[BRCRecentsEnumeratorBatch setRank:](v23, "setRank:", v82[3] - 1);
        goto LABEL_33;
      }
      __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_2(v30, v90[3], (char)v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCRecentsEnumeratorBatch addDeletionOfFileObjectID:rank:](v23, "addDeletionOfFileObjectID:rank:", v32, v82[3]);
      v33 = -[BRCRecentsEnumeratorBatch batchCount](v23, "batchCount") < a4;

      if (!v33)
        goto LABEL_33;
      ((uint64_t (**)(_QWORD, void *))v18)[2](v18, v19);
    }
    if (objc_msgSend(v27, "notifsRank") > *p_flushedNotifRank
      || (-[BRCRecentsEnumeratorBatch addIndexOfItem:](v23, "addIndexOfItem:", v27),
          -[BRCRecentsEnumeratorBatch batchCount](v23, "batchCount") >= a4))
    {
LABEL_33:
      v34 = 12;
      goto LABEL_34;
    }
    v34 = -[BRCRecentsEnumeratorBatch rank](v23, "rank") >= *p_flushedNotifRank ? 12 : 0;
LABEL_34:
    objc_autoreleasePoolPop(v28);
    if (v34)
      break;
    if (++v26 == v63)
    {
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v93, 16);
      if (!v24)
      {
LABEL_37:

        while (1)
        {
          if (v82[3] == -1)
            goto LABEL_56;
          v38 = MEMORY[0x1D17A6BE8]();
          v39 = (void *)v38;
          if (v82[3] <= *p_flushedNotifRank)
          {
            v40 = *((unsigned __int8 *)v86 + 24);
            if (v40 != 2)
            {
              __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_2(v38, v90[3], (char)v40);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[BRCRecentsEnumeratorBatch addDeletionOfFileObjectID:rank:](v23, "addDeletionOfFileObjectID:rank:", v44, v82[3]);
              if (-[BRCRecentsEnumeratorBatch batchCount](v23, "batchCount") >= a4
                || -[BRCRecentsEnumeratorBatch rank](v23, "rank") >= *p_flushedNotifRank)
              {
                v43 = 12;
              }
              else
              {
                ((uint64_t (**)(_QWORD, void *))v18)[2](v18, v19);
                v43 = 0;
              }

              goto LABEL_50;
            }
            brc_bread_crumbs();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              v45 = v90[3];
              *(_DWORD *)buf = 134218242;
              v95 = v45;
              v96 = 2112;
              v97 = (unint64_t)v41;
              _os_log_debug_impl(&dword_1CBD43000, v42, OS_LOG_TYPE_DEBUG, "[DEBUG] found a tombstone entry of type client zone db rowid (%lld), sending current batch%@", buf, 0x16u);
            }

            -[BRCRecentsEnumeratorBatch setRank:](v23, "setRank:", v82[3] - 1);
          }
          v43 = 12;
LABEL_50:
          objc_autoreleasePoolPop(v39);
          if (v43)
            goto LABEL_56;
        }
      }
      goto LABEL_16;
    }
  }

LABEL_56:
  v49 = -[BRCRecentsEnumeratorBatch rank](v23, "rank");
  if (!v49)
    v49 = *p_flushedNotifRank;
  -[BRCRecentsChangeToken setNotifRank:](v57, "setNotifRank:", v49);
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_78;
  v65[3] = &unk_1E8763E18;
  v70 = v59;
  v50 = v23;
  v66 = v50;
  v67 = v60;
  v51 = v57;
  v68 = v51;
  v69 = v61;
  -[BRCRecentsEnumeratorBatch listItems:](v50, "listItems:", v65);

  objc_autoreleasePoolPop(context);
LABEL_59:

LABEL_60:
  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);

}

uint64_t __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_deleteAllRanks");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, 0, 0);
  return result;
}

void __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_68(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "next"))
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(v4, "unsignedLongLongAtIndex:", 0);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v4, "intAtIndex:", 1);
    v3 = objc_msgSend(v4, "longLongAtIndex:", 2);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    v3 = -1;
  }
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;

}

id __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  void *v5;
  NSObject *v6;

  if (a3 == 1)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E68]), "initWithDocID:", a2);
  }
  else if (a3)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_2_cold_1((uint64_t)v5, a3, v6);

    v4 = 0;
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E80]), "initWithFileID:", a2);
  }
  return v4;
}

uint64_t __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_74(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "garbageCollectRanksPreceding:", *(_QWORD *)(a1 + 40));
}

uint64_t __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_2_75(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(result + 16))(result, 0, 0, a2, a3);
  return result;
}

void __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v18 = *(_QWORD *)(a1 + 64);
    v19 = objc_msgSend(*(id *)(a1 + 32), "rank");
    *(_DWORD *)buf = 134219010;
    v31 = v18;
    v32 = 2048;
    v33 = v19;
    v34 = 2112;
    v35 = v5;
    v36 = 2112;
    v37 = v6;
    v38 = 2112;
    v39 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] sending batch from %llu to %llu\n updatedItems = %@\n deletedItems = %@%@", buf, 0x34u);
  }

  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v11 = *(void **)(v9 + 48);
  v12 = MEMORY[0x1E0C809B0];
  v13 = *(void **)(v9 + 16);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_79;
  v25[3] = &unk_1E8763DF0;
  v25[4] = v9;
  v26 = v10;
  v29 = *(id *)(a1 + 56);
  v27 = v5;
  v28 = v6;
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_2_80;
  v20[3] = &unk_1E8763DF0;
  v14 = *(void **)(a1 + 48);
  v20[4] = *(_QWORD *)(a1 + 40);
  v21 = v14;
  v15 = *(id *)(a1 + 56);
  v23 = v28;
  v24 = v15;
  v22 = v27;
  v16 = v28;
  v17 = v27;
  brc_task_tracker_async_with_logs(v11, v13, v25, v20);

}

void __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_79(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_readyForIndexingWithAckedRank:", objc_msgSend(*(id *)(a1 + 40), "notifRank"));
  v3 = *(_QWORD *)(a1 + 56);
  v2 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "toData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id, _QWORD))(v2 + 16))(v2, v4, v3, v5, 0);

}

void __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_2_80(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_readyForIndexingWithAckedRank:", objc_msgSend(*(id *)(a1 + 40), "notifRank"));
  v3 = *(_QWORD *)(a1 + 56);
  v2 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "toData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id, _QWORD))(v2 + 16))(v2, v4, v3, v5, 0);

}

- (void)enumerateChangesFromChangeToken:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  brc_task_tracker *tracker;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  unint64_t v24;

  v8 = a5;
  +[BRCRecentsChangeToken changeTokenFromData:](BRCRecentsChangeToken, "changeTokenFromData:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke;
  v21[3] = &unk_1E8760188;
  v21[4] = self;
  v11 = v9;
  v22 = v11;
  v24 = a4;
  v12 = v8;
  v23 = v12;
  v13 = MEMORY[0x1D17A6DB0](v21);
  v14 = (void *)v13;
  if (v11)
  {
    (*(void (**)(uint64_t))(v13 + 16))(v13);
  }
  else
  {
    tracker = self->_tracker;
    -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke_4;
    v19[3] = &unk_1E875EAA8;
    v19[4] = self;
    v20 = v14;
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke_5;
    v17[3] = &unk_1E875FD48;
    v18 = v12;
    brc_task_tracker_async_with_logs(tracker, v16, v19, v17);

  }
}

void __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 48);
  v5 = *(void **)(v2 + 16);
  v12[2] = __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke_2;
  v12[3] = &unk_1E8760188;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[4] = v2;
  v7 = v3;
  v9 = *(void **)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v13 = v7;
  v15 = v8;
  v14 = v9;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke_3;
  v10[3] = &unk_1E875FD48;
  v11 = *(id *)(a1 + 48);
  brc_task_tracker_async_with_logs(v4, v5, v12, v10);

}

uint64_t __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateChangesFromChangeToken:limit:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorOperationCancelled");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, 0, v2);

}

uint64_t __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_deleteAllRanks");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorOperationCancelled");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, 0, v2);

}

- (void)_activeSetDidChange
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] active set did change, notifying fileproviderd%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __43__BRCRecentsEnumerator__activeSetDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  if (v2)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
      __43__BRCRecentsEnumerator__activeSetDidChange__block_invoke_cold_1();

  }
}

- (void)_signalActiveSetDidChange
{
  br_pacer_signal();
}

- (BRCRecentsEnumerator)initWithAccountSession:(id)a3
{
  id v5;
  BRCRecentsEnumerator *v6;
  BRCRecentsEnumerator *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  BRCPQLConnection *indexingDB;
  uint64_t v16;
  br_pacer *pacer;
  uint64_t v18;
  brc_task_tracker *tracker;
  id v21;
  id location;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BRCRecentsEnumerator;
  v6 = -[BRCRecentsEnumerator init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recentsEnumeratorPacerInterval");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession clientTruthWorkloop](v7->_session, "clientTruthWorkloop");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v9, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create_with_target_V2("recents-enumerator", v11, v10);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;

    objc_msgSend(v5, "clientDB");
    v14 = objc_claimAutoreleasedReturnValue();
    indexingDB = v7->_indexingDB;
    v7->_indexingDB = (BRCPQLConnection *)v14;

    br_pacer_create();
    v16 = objc_claimAutoreleasedReturnValue();
    pacer = v7->_pacer;
    v7->_pacer = (br_pacer *)v16;

    objc_initWeak(&location, v7);
    objc_copyWeak(&v21, &location);
    br_pacer_set_event_handler();
    brc_task_tracker_create("recents-enumerator-tracker");
    v18 = objc_claimAutoreleasedReturnValue();
    tracker = v7->_tracker;
    v7->_tracker = (brc_task_tracker *)v18;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __47__BRCRecentsEnumerator_initWithAccountSession___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_activeSetDidChange");

}

- (void)resume
{
  br_pacer_resume();
  -[BRCRecentsEnumerator _signalActiveSetDidChange](self, "_signalActiveSetDidChange");
}

- (void)close
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__BRCRecentsEnumerator_close__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_sync(queue, block);
  brc_task_tracker_wait((uint64_t)self->_tracker);
}

uint64_t __29__BRCRecentsEnumerator_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)cancel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Canceling spotlight indexer.%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (BOOL)isCancelled
{
  return br_pacer_test_cancel() != 0;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BRCRecentsEnumerator;
  -[BRCRecentsEnumerator dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_pacer, 0);
  objc_storeStrong((id *)&self->_indexingDB, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v0, (uint64_t)v0, "[ERROR] failed to signal enumerator for root container: %@%@", v1);
  OUTLINED_FUNCTION_2();
}

void __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] deleted ranks from tombstones successfully%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_4_cold_2(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "lastError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_3(&dword_1CBD43000, a3, v6, "[ERROR] failed deleting ranks from tombstones: %@%@", (uint8_t *)&v7);

}

+ (void)dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] CoreSpotlight index has already been dropped%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: index%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] device does not support CoreSpotlight indexing, no need to drop any index%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __82__BRCRecentsEnumerator_dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D10BE0];
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a1;
  OUTLINED_FUNCTION_3(&dword_1CBD43000, a2, a3, "[ERROR] failed to synchronize user defaults for %@%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __82__BRCRecentsEnumerator_dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] dropped Spotlight index successfully%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __82__BRCRecentsEnumerator_dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v0, (uint64_t)v0, "[ERROR] failed dropping Spotlight index: %@%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_readyForIndexingWithAckedRank:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Finished indexing for now%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_enumerateChangesFromChangeToken:limit:completion:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] change token has expired, index should be dropped%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_2_cold_1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_fault_impl(&dword_1CBD43000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: bad tombstone entry type: %d%@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_2();
}

void __43__BRCRecentsEnumerator__activeSetDidChange__block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v0, (uint64_t)v0, "[ERROR] failed to signal enumerator for working set: %@%@", v1);
  OUTLINED_FUNCTION_2();
}

@end
