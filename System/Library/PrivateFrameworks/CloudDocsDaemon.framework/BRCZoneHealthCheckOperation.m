@implementation BRCZoneHealthCheckOperation

- (BRCZoneHealthCheckOperation)initWithSession:(id)a3 changeToken:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  BRCZoneHealthCheckOperation *v11;
  uint64_t v12;
  NSMutableDictionary *recordsByID;
  uint64_t v14;
  NSMutableArray *deletedRecordIds;
  objc_super v17;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "syncContextProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoneHealthSyncContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)BRCZoneHealthCheckOperation;
  v11 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v17, sel_initWithName_syncContext_sessionContext_, CFSTR("zone-health-check"), v10, v8);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_changeToken, a4);
    v12 = objc_opt_new();
    recordsByID = v11->_recordsByID;
    v11->_recordsByID = (NSMutableDictionary *)v12;

    v14 = objc_opt_new();
    deletedRecordIds = v11->_deletedRecordIds;
    v11->_deletedRecordIds = (NSMutableArray *)v14;

  }
  return v11;
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
    v7.super_class = (Class)BRCZoneHealthCheckOperation;
    v5 = -[_BRCOperation shouldRetryForError:](&v7, sel_shouldRetryForError_, v4);
  }

  return v5;
}

- (void)receivedUpdatedServerChangeToken:(id)a3 requestID:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[BRCSyncContext session](self->super._syncContext, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[NSMutableDictionary keyEnumerator](self->_recordsByID, "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
        v13 = objc_alloc(MEMORY[0x1E0D10E88]);
        objc_msgSend(v12, "recordName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithAppLibraryName:", v14);

        v16 = (id)objc_msgSend(v6, "getOrCreateAppLibraryAndPrivateZonesIfNecessary:", v15);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "clientDB");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __74__BRCZoneHealthCheckOperation_receivedUpdatedServerChangeToken_requestID___block_invoke;
  v21[3] = &unk_1E875EF68;
  v21[4] = self;
  v22 = v6;
  v23 = v5;
  v24 = a4;
  v18 = v5;
  v19 = v6;
  objc_msgSend(v17, "performWithFlags:action:", 9, v21);

}

uint64_t __74__BRCZoneHealthCheckOperation_receivedUpdatedServerChangeToken_requestID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BRCServerZoneHealthState *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BRCServerZoneHealthState *v15;
  BRFieldCKInfo *v16;
  void *v17;
  BRCServerZoneHealthState *v18;
  NSObject *p_super;
  const char *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  __int128 v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  BRCServerZoneHealthState *v43;
  __int16 v44;
  BRCServerZoneHealthState *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "objectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v38;
    *(_QWORD *)&v3 = 138412546;
    v31 = v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v38 != v5)
          objc_enumerationMutation(obj);
        v7 = *(BRCServerZoneHealthState **)(*((_QWORD *)&v37 + 1) + 8 * i);
        -[BRCServerZoneHealthState objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("state"), v31);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          brc_bread_crumbs();
          v15 = (BRCServerZoneHealthState *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v16 = (BRFieldCKInfo *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(&v16->super.super, OS_LOG_TYPE_FAULT))
            goto LABEL_19;
          *(_DWORD *)buf = v31;
          v43 = v7;
          v44 = 2112;
          v45 = v15;
          p_super = &v16->super.super;
          v20 = "[CRIT] UNREACHABLE: state is of unexpected class %@%@";
LABEL_14:
          _os_log_fault_impl(&dword_1CBD43000, p_super, OS_LOG_TYPE_FAULT, v20, buf, 0x16u);
          goto LABEL_19;
        }
        -[BRCServerZoneHealthState objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("updateTime"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v11 = objc_opt_isKindOfClass();

        if ((v11 & 1) == 0)
        {
          brc_bread_crumbs();
          v15 = (BRCServerZoneHealthState *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v16 = (BRFieldCKInfo *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(&v16->super.super, OS_LOG_TYPE_FAULT))
            goto LABEL_19;
          *(_DWORD *)buf = v31;
          v43 = v7;
          v44 = 2112;
          v45 = v15;
          p_super = &v16->super.super;
          v20 = "[CRIT] UNREACHABLE: update time is of unexpected class %@%@";
          goto LABEL_14;
        }
        -[BRCServerZoneHealthState objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("state"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "intValue");

        -[BRCServerZoneHealthState recordID](v7, "recordID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "recordName");
        v15 = (BRCServerZoneHealthState *)objc_claimAutoreleasedReturnValue();

        v16 = -[BRFieldCKInfo initWithRecord:]([BRFieldCKInfo alloc], "initWithRecord:", v7);
        objc_msgSend(*(id *)(a1 + 40), "privateClientZoneByID:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = -[BRCServerZoneHealthState initWithCKInfo:state:]([BRCServerZoneHealthState alloc], "initWithCKInfo:state:", v16, v13);
          objc_msgSend(v17, "syncedDownZoneHealthState:", v18);
        }
        else
        {
          brc_bread_crumbs();
          v18 = (BRCServerZoneHealthState *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v31;
            v43 = v15;
            v44 = 2112;
            v45 = v18;
            _os_log_debug_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] We don't have a container for %@%@", buf, 0x16u);
          }

        }
LABEL_19:

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v4);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = *(id *)(*(_QWORD *)(a1 + 32) + 520);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "recordName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "privateClientZoneByID:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "zoneHealthWasReset");

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v24);
  }

  objc_msgSend(*(id *)(a1 + 40), "containerScheduler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "receivedUpdatedZoneHealthServerChangeToken:requestID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  return 1;
}

- (void)completedZoneHealthSyncDownWithRequestID:(unint64_t)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  unint64_t v14;

  v6 = a4;
  -[BRCSyncContext session](self->super._syncContext, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__BRCZoneHealthCheckOperation_completedZoneHealthSyncDownWithRequestID_error___block_invoke;
  v11[3] = &unk_1E875EF90;
  v13 = v6;
  v14 = a3;
  v12 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "performWithFlags:action:", 9, v11);

  -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, v9);
}

uint64_t __78__BRCZoneHealthCheckOperation_completedZoneHealthSyncDownWithRequestID_error___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "containerScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishedZoneHealthSyncDownWithRequestID:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  return 1;
}

- (void)main
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┣%llx starting a fetch-record-changes operation for health zone%@");
  OUTLINED_FUNCTION_2();
}

void __35__BRCZoneHealthCheckOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  __int128 v26;
  uint64_t v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v26 = *(_OWORD *)(a1 + 48);
  v27 = *(_QWORD *)(a1 + 64);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(WeakRetained, "operationID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v29 = (id)v26;
    v30 = 2112;
    v31 = v3;
    v32 = 2112;
    v33 = v21;
    v34 = 2112;
    v35 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx got a changed record %@ in operation %@%@", buf, 0x2Au);

  }
  objc_msgSend(v3, "recordType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("zoneState"));

  if (v8)
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 520);
    objc_msgSend(v3, "recordID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v9, "containsObject:", v10);

    if ((_DWORD)v9)
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        __35__BRCZoneHealthCheckOperation_main__block_invoke_cold_2();

    }
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 512);
    objc_msgSend(v3, "recordID", v26, v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = v13 == 0;

    if ((v11 & 1) == 0)
    {
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        __35__BRCZoneHealthCheckOperation_main__block_invoke_cold_1();

    }
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 512);
    objc_msgSend(v3, "recordID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v3, v15);
  }
  else
  {
    objc_msgSend(v3, "recordType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("zoneDetails"));

    if (v17)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(WeakRetained, "operationID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v29 = v3;
        v30 = 2112;
        v31 = v19;
        v32 = 2112;
        v33 = v15;
        _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring zone details record %@ in operation %@%@", buf, 0x20u);

      }
    }
    else
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "operationID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v29 = v3;
        v30 = 2112;
        v31 = v20;
        v32 = 2112;
        v33 = v15;
        _os_log_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring record of unexpected type %@ in operation %@%@", buf, 0x20u);

      }
    }

  }
  __brc_leave_section((uint64_t *)&v26);

}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v17 = *(_OWORD *)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 64);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(WeakRetained, "operationID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v20 = v17;
    v21 = 2112;
    v22 = v5;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx recordID was deleted %@ in operation %@%@", buf, 0x2Au);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "containsObject:", v5))
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __35__BRCZoneHealthCheckOperation_main__block_invoke_17_cold_2();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "objectForKeyedSubscript:", v5, v17, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (!v11)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      __35__BRCZoneHealthCheckOperation_main__block_invoke_17_cold_1();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "addObject:", v5);
  __brc_leave_section((uint64_t *)&v17);

}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_19(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = objc_retainAutorelease(a4);
  v10 = (uint64_t *)objc_msgSend(v9, "bytes");
  if (v10)
    v11 = *v10;
  else
    v11 = 0;
  v15 = *(_OWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 56);
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "descriptionWithContext:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v18 = v15;
    v19 = 2112;
    v20 = v14;
    v21 = 2048;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Received token update %@, requestID %llu%@", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "receivedUpdatedServerChangeToken:requestID:", v8, v11);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "removeAllObjects");
  __brc_leave_section((uint64_t *)&v15);

}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_21(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  id v15;
  void **v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  __int128 v23;
  uint64_t v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v15 = objc_retainAutorelease(v12);
  v16 = (void **)objc_msgSend(v15, "bytes");
  if (v16)
    v17 = *v16;
  else
    v17 = 0;
  v23 = *(_OWORD *)(a1 + 56);
  v24 = *(_QWORD *)(a1 + 72);
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v11, "descriptionWithContext:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v26 = (id)v23;
    v27 = 2112;
    v28 = WeakRetained;
    v29 = 2048;
    v30 = v17;
    v31 = 2112;
    v32 = v22;
    v33 = 2112;
    v34 = v18;
    _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx finished sync down of zone-health %@ with requestID %llu changeToken %@%@", buf, 0x34u);

  }
  if (objc_msgSend(v13, "brc_isCloudKitErrorImplyingZoneNeedsCreation"))
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v26 = WeakRetained;
      v27 = 2112;
      v28 = v13;
      v29 = 2112;
      v30 = v20;
      _os_log_debug_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] No zone-health zone %@: %@%@", buf, 0x20u);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v13)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v26 = WeakRetained;
      v27 = 2112;
      v28 = v13;
      v29 = 2112;
      v30 = v20;
      _os_log_error_impl(&dword_1CBD43000, v21, (os_log_type_t)0x90u, "[ERROR] Failed syncing down zone-health op %@: %@%@", buf, 0x20u);
    }
    goto LABEL_12;
  }
LABEL_13:
  objc_msgSend(*(id *)(a1 + 32), "receivedUpdatedServerChangeToken:requestID:", v11, v17);
  objc_msgSend(*(id *)(a1 + 32), "completedZoneHealthSyncDownWithRequestID:error:", v17, v13);
  __brc_leave_section((uint64_t *)&v23);

}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  __int128 v6;
  uint64_t v7;

  v3 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v6 = *(_OWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 64);
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __35__BRCZoneHealthCheckOperation_main__block_invoke_23_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "completedZoneHealthSyncDownWithRequestID:error:", 0, v3, v6, v7);
    __brc_leave_section((uint64_t *)&v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedRecordIds, 0);
  objc_storeStrong((id *)&self->_recordsByID, 0);
  objc_storeStrong((id *)&self->_changeToken, 0);
}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self->_recordsByID[record.recordID] == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: ![self->_deletedRecordIds containsObject:record.recordID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_17_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self->_recordsByID[recordID] == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_17_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: ![self->_deletedRecordIds containsObject:recordID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __35__BRCZoneHealthCheckOperation_main__block_invoke_23_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┳%llx sync down of zone-health-check was cancelled?%@");
  OUTLINED_FUNCTION_2();
}

@end
