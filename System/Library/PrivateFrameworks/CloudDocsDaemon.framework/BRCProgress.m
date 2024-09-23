@implementation BRCProgress

- (void)setCompletedUnitCount:(int64_t)a3
{
  BRCProgress *v5;
  NSMutableDictionary *progressByAliasContainerID;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BRCProgress;
  -[BRCProgress setCompletedUnitCount:](&v8, sel_setCompletedUnitCount_);
  v5 = self;
  objc_sync_enter(v5);
  progressByAliasContainerID = v5->_progressByAliasContainerID;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__BRCProgress_setCompletedUnitCount___block_invoke;
  v7[3] = &__block_descriptor_40_e27_v32__0_8__NSProgress_16_B24l;
  v7[4] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](progressByAliasContainerID, "enumerateKeysAndObjectsUsingBlock:", v7);
  objc_sync_exit(v5);

}

uint64_t __37__BRCProgress_setCompletedUnitCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setCompletedUnitCount:", *(_QWORD *)(a1 + 32));
}

- (void)brc_publish
{
  BRCProgress *v3;
  objc_super v4;

  if (!self->_ignorePublish)
  {
    v4.receiver = self;
    v4.super_class = (Class)BRCProgress;
    -[NSProgress brc_publish](&v4, sel_brc_publish);
    v3 = self;
    objc_sync_enter(v3);
    v3->_published = 1;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v3->_progressByAliasContainerID, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_4);
    objc_sync_exit(v3);

  }
}

uint64_t __26__BRCProgress_brc_publish__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "brc_publish");
}

- (void)brc_unpublish
{
  BRCProgress *v3;
  objc_super v4;

  if (!self->_ignorePublish)
  {
    v4.receiver = self;
    v4.super_class = (Class)BRCProgress;
    -[NSProgress brc_unpublish](&v4, sel_brc_unpublish);
    v3 = self;
    objc_sync_enter(v3);
    v3->_published = 0;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v3->_progressByAliasContainerID, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_28_0);
    objc_sync_exit(v3);

  }
}

uint64_t __28__BRCProgress_brc_unpublish__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "brc_unpublish");
}

+ (id)downloadProgressForDocument:(id)a3 sizeInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_progressForDocument:group:sizeInfo:", v6, 2, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "globalProgress");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject addProgress:forDocument:inGroup:](v9, "addProgress:forDocument:inGroup:", v7, v6, 2);
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] failed getting download progress for %@%@", (uint8_t *)&v11, 0x16u);
    }
  }

  return v7;
}

+ (id)uploadProgressForDocument:(id)a3 sizeInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_progressForDocument:group:sizeInfo:", v6, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "globalProgress");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject addProgress:forDocument:inGroup:](v9, "addProgress:forDocument:inGroup:", v7, v6, 1);
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] failed getting upload progress for %@%@", (uint8_t *)&v11, 0x16u);
    }
  }

  return v7;
}

- (BRCProgress)initWithGroup:(char)a3 parentFileIDs:(id)a4 session:(id)a5
{
  id v9;
  id v10;
  BRCProgress *v11;
  BRCProgress *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BRCProgress;
  v11 = -[BRCProgress initWithParent:userInfo:](&v14, sel_initWithParent_userInfo_, 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_session, v10);
    objc_storeStrong((id *)&v12->_parentFileIDs, a4);
    v12->_group = a3;
  }

  return v12;
}

- (BRCProgress)initWithIgnorePublish:(BOOL)a3
{
  BRCProgress *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCProgress;
  result = -[BRCProgress init](&v5, sel_init);
  if (result)
    result->_ignorePublish = a3;
  return result;
}

- (void)setSession:(id)a3 parentFileIDs:(id)a4 group:(char)a5
{
  NSArray *v8;
  NSArray *parentFileIDs;

  v8 = (NSArray *)a4;
  objc_storeWeak((id *)&self->_session, a3);
  parentFileIDs = self->_parentFileIDs;
  self->_parentFileIDs = v8;

  self->_group = a5;
}

- (void)_setupProgressForDocument:(id)a3 group:(char)a4 sizeInfo:(id)a5
{
  int v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  id *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  BRCItemToPathLookup *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60[2];
  id v61;
  uint8_t v62[128];
  uint8_t buf[4];
  BRCProgress *v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v6 = a4;
  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v50 = a5;
  v49 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v8);
  -[BRCItemToPathLookup coordinatedWriteURL](v49, "coordinatedWriteURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    brc_bread_crumbs();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      -[BRCProgress _setupProgressForDocument:group:sizeInfo:].cold.1((uint64_t)v46, v47);

  }
  -[BRCProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", v9, *MEMORY[0x1E0CB30F0]);
  if (objc_msgSend(v8, "isFault"))
  {
    objc_msgSend(v9, "URLByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "st");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filename");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[BRCProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", v13, *MEMORY[0x1E0CB3108]);
  }
  v61 = 0;
  v14 = objc_msgSend(v9, "getPromisedItemResourceValue:forKey:error:", &v61, *MEMORY[0x1E0C99A70], 0);
  v15 = v61;
  if ((v14 & 1) == 0)
  {
    objc_msgSend(v9, "lastPathComponent");
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v16;
  }
  objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("BRCSizeInfoCompletedUnitCountKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCProgress setCompletedUnitCount:](self, "setCompletedUnitCount:", objc_msgSend(v17, "longLongValue"));

  objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("BRCSizeInfoTotalUnitCountKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCProgress setTotalUnitCount:](self, "setTotalUnitCount:", objc_msgSend(v18, "longLongValue"));

  if (-[BRCProgress completedUnitCount](self, "completedUnitCount") < 0
    || -[BRCProgress totalUnitCount](self, "totalUnitCount") < 0)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = -[BRCProgress totalUnitCount](self, "totalUnitCount");
      v22 = -[BRCProgress completedUnitCount](self, "completedUnitCount");
      *(_DWORD *)buf = 134218498;
      v64 = (BRCProgress *)v21;
      v65 = 2048;
      v66 = v22;
      v67 = 2112;
      v68 = v19;
      _os_log_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress initialized with negative values. total [%lld] completed [%lld]%@", buf, 0x20u);
    }

  }
  -[BRCProgress setKind:](self, "setKind:", *MEMORY[0x1E0CB30F8]);
  -[BRCProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D10D28]);
  -[BRCProgress setCancellable:](self, "setCancellable:", 0);
  v23 = (id *)MEMORY[0x1E0CB30B8];
  if (v15)
  {
    -[BRCProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", v15, *MEMORY[0x1E0CB3088]);
    if (v6 == 1)
      v24 = (id)*MEMORY[0x1E0CB30E0];
    else
      v24 = *v23;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _BRLocalizedStringWithFormat();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCProgress setLocalizedDescription:](self, "setLocalizedDescription:", v26, v15);

  }
  else
  {
    if (v6 == 1)
      v27 = (void *)*MEMORY[0x1E0CB30E0];
    else
      v27 = (void *)*MEMORY[0x1E0CB30B8];
    v24 = v27;
  }
  -[BRCProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", v24, *MEMORY[0x1E0CB30C8]);
  if (objc_msgSend(v24, "isEqualToString:", *v23) && objc_msgSend(v8, "isFault"))
  {
    -[BRCProgress setCancellable:](self, "setCancellable:", 1);
    objc_msgSend(v8, "clientZone");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v8, "dbRowID");
    objc_initWeak((id *)buf, self);
    objc_msgSend(v8, "st");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "filename");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "clientZone");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "taskTracker");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "db");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "serialQueue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __56__BRCProgress__setupProgressForDocument_group_sizeInfo___block_invoke;
    v55[3] = &unk_1E875E060;
    v35 = v30;
    v56 = v35;
    v36 = v32;
    v57 = v36;
    v37 = v34;
    v58 = v37;
    v38 = v28;
    v59 = v38;
    v60[1] = v48;
    objc_copyWeak(v60, (id *)buf);
    -[BRCProgress setCancellationHandler:](self, "setCancellationHandler:", v55);
    objc_destroyWeak(v60);

    objc_destroyWeak((id *)buf);
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v8, "reverseAliasEnumerator");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v52 != v41)
          objc_enumerationMutation(v39);
        -[BRCProgress addAliasItem:](self, "addAliasItem:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
      }
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    }
    while (v40);
  }

  brc_bread_crumbs();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "path");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v64 = self;
    v65 = 2112;
    v66 = (uint64_t)v45;
    v67 = 2112;
    v68 = v43;
    _os_log_debug_impl(&dword_1CBD43000, v44, OS_LOG_TYPE_DEBUG, "[NOTIF] Added progress %@ for %@%@", buf, 0x20u);

  }
}

void __56__BRCProgress__setupProgressForDocument_group_sizeInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18[3];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17A6BE8]();
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCProgress _setupProgressForDocument:group:sizeInfo:]_block_invoke", 290, v18);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v20 = v18[0];
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx User requested to cancel download for %@%@", buf, 0x20u);
  }

  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __56__BRCProgress__setupProgressForDocument_group_sizeInfo___block_invoke_42;
  v14 = &unk_1E875E038;
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 72);
  v15 = v7;
  v17 = v8;
  v16 = *(id *)(a1 + 40);
  brc_task_tracker_async_with_logs(v5, v6, &v11, 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "brc_unpublish", v11, v12, v13, v14);

  __brc_leave_section(v18);
  objc_autoreleasePoolPop(v2);
}

void __56__BRCProgress__setupProgressForDocument_group_sizeInfo___block_invoke_42(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "itemByRowID:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asDocument");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(v4, "evictInTask:options:error:", *(_QWORD *)(a1 + 40), 1, 0);
    v3 = v4;
  }

}

- (void)_updateToBeProgressForDocument:(id)a3 group:(char)a4 sizeinfo:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  v8 = a5;
  if (objc_msgSend(v10, "isOnDisk"))
  {
    objc_msgSend(v10, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCProgress setSession:parentFileIDs:group:](self, "setSession:parentFileIDs:group:", v9, 0, v6);

    -[BRCProgress _setupProgressForDocument:group:sizeInfo:](self, "_setupProgressForDocument:group:sizeInfo:", v10, v6, v8);
  }

}

+ (id)_progressForDocument:(id)a3 group:(char)a4 sizeInfo:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  BRCItemToPathLookup *v9;
  void *v10;
  BRCProgress *v11;
  void *v12;
  BRCProgress *v13;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "isOnDisk"))
  {
    v9 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v7);
    -[BRCItemToPathLookup coordinatedWriteURL](v9, "coordinatedWriteURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = [BRCProgress alloc];
      objc_msgSend(v7, "session");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[BRCProgress initWithGroup:parentFileIDs:session:](v11, "initWithGroup:parentFileIDs:session:", v6, 0, v12);

      if (v13)
        -[BRCProgress _setupProgressForDocument:group:sizeInfo:](v13, "_setupProgressForDocument:group:sizeInfo:", v7, v6, v8);
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)addAliasItem:(id)a3
{
  id v4;
  BRCProgress *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *progressByAliasContainerID;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  BRCItemToPathLookup *v13;
  NSObject *v14;
  void *v15;
  BRCProgress *v16;
  NSObject *p_super;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  int v37;
  uint8_t buf[4];
  NSObject *v39;
  __int16 v40;
  _BYTE v41[18];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "clientZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mangledID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aliasTargetContainerString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  progressByAliasContainerID = v5->_progressByAliasContainerID;
  if (!progressByAliasContainerID)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = v5->_progressByAliasContainerID;
    v5->_progressByAliasContainerID = v10;

    progressByAliasContainerID = v5->_progressByAliasContainerID;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](progressByAliasContainerID, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v37 = 0;
    v13 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v4);
    -[BRCItemToPathLookup byFileSystemID](v13, "byFileSystemID");
    v14 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject resolveMustExist:error:](v14, "resolveMustExist:error:", 1, &v37) & 1) != 0)
    {
      -[NSObject physicalURL](v14, "physicalURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[BRCProgress initWithParent:userInfo:]([BRCProgress alloc], "initWithParent:userInfo:", 0, 0);
      p_super = &v16->super.super;
      if (!v15)
      {
        brc_bread_crumbs();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
          -[BRCProgress addAliasItem:].cold.1();

        goto LABEL_25;
      }
      if (v16)
      {
        -[BRCProgress setTotalUnitCount:](v16, "setTotalUnitCount:", -[BRCProgress totalUnitCount](v5, "totalUnitCount"));
        -[NSObject setCompletedUnitCount:](p_super, "setCompletedUnitCount:", -[BRCProgress completedUnitCount](v5, "completedUnitCount"));
        -[NSObject setKind:](p_super, "setKind:", *MEMORY[0x1E0CB30F8]);
        -[NSObject setCancellable:](p_super, "setCancellable:", 0);
        v18 = *MEMORY[0x1E0CB30F0];
        -[NSObject setUserInfoObject:forKey:](p_super, "setUserInfoObject:forKey:", v15, *MEMORY[0x1E0CB30F0]);
        -[NSObject setUserInfoObject:forKey:](p_super, "setUserInfoObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D10D28]);
        -[BRCProgress userInfo](v5, "userInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", v18);
        v33 = objc_claimAutoreleasedReturnValue();

        v36 = 0;
        v20 = *MEMORY[0x1E0C99A70];
        v35 = 0;
        LOBYTE(v18) = -[NSObject getResourceValue:forKey:error:](v33, "getResourceValue:forKey:error:", &v36, v20, &v35);
        v32 = v36;
        v31 = v35;
        if ((v18 & 1) == 0)
        {
          brc_bread_crumbs();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v39 = v33;
            v40 = 2112;
            *(_QWORD *)v41 = v31;
            *(_WORD *)&v41[8] = 2112;
            *(_QWORD *)&v41[10] = v21;
            _os_log_debug_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_DEBUG, "[NOTIF] can't get the filename of %@: %@%@", buf, 0x20u);
          }

        }
        if (v32)
          -[NSObject setUserInfoObject:forKey:](p_super, "setUserInfoObject:forKey:", v32, *MEMORY[0x1E0CB3088]);
        -[BRCProgress userInfo](v5, "userInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *MEMORY[0x1E0CB30C8];
        objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0CB30C8]);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
          -[NSObject setUserInfoObject:forKey:](p_super, "setUserInfoObject:forKey:", v34, v24);
        if (-[BRCProgress isCancellable](v5, "isCancellable"))
        {
          -[NSObject setCancellable:](p_super, "setCancellable:", 1);
          -[BRCProgress cancellationHandler](v5, "cancellationHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setCancellationHandler:](p_super, "setCancellationHandler:", v25);

        }
        if (v5->_published)
          -[NSObject brc_publish](p_super, "brc_publish");
        -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_progressByAliasContainerID, "setObject:forKeyedSubscript:", p_super, v8);
        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v15, "path");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v39 = p_super;
          v40 = 2112;
          *(_QWORD *)v41 = v30;
          *(_WORD *)&v41[8] = 2112;
          *(_QWORD *)&v41[10] = v26;
          _os_log_debug_impl(&dword_1CBD43000, v27, OS_LOG_TYPE_DEBUG, "[NOTIF] Added progress %@ for %@%@", buf, 0x20u);

        }
      }
    }
    else
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v39 = v14;
        v40 = 1024;
        *(_DWORD *)v41 = v37;
        *(_WORD *)&v41[4] = 2112;
        *(_QWORD *)&v41[6] = v15;
        _os_log_error_impl(&dword_1CBD43000, p_super, (os_log_type_t)0x90u, "[ERROR] can't resolve %@ %{errno}d%@", buf, 0x1Cu);
      }
    }

    -[BRCItemToPathLookup closePaths](v13, "closePaths");
LABEL_25:

  }
  objc_sync_exit(v5);

}

- (BOOL)isPublished
{
  return self->_published;
}

- (NSArray)parentFileIDs
{
  return self->_parentFileIDs;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_parentFileIDs, 0);
  objc_storeStrong((id *)&self->_progressByAliasContainerID, 0);
}

- (void)_setupProgressForDocument:(uint64_t)a1 group:(NSObject *)a2 sizeInfo:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: url%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)addAliasItem:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] can't get URL for %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
