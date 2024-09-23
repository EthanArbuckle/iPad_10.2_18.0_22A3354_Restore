@implementation BRCFetchRecentAndFavoriteDocumentsOperation

- (BRCFetchRecentAndFavoriteDocumentsOperation)initWithServerZone:(id)a3 sessionContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BRCFetchRecentAndFavoriteDocumentsOperation *v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "mangledID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("fetch-recent-documents"), "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "metadataSyncContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)BRCFetchRecentAndFavoriteDocumentsOperation;
  v13 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v16, sel_initWithName_syncContext_sessionContext_, v11, v12, v8);

  if (v13)
  {
    -[_BRCOperation setNonDiscretionary:](v13, "setNonDiscretionary:", 1);
    objc_msgSend(MEMORY[0x1E0C94F88], "br_fetchRecents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v13, "setGroup:", v14);

    objc_storeStrong((id *)&v13->_serverZone, a3);
  }

  return v13;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "sync/fetch-recents", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_performQueryOperationForBit:(unsigned int)a3 index:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, BRCFetchRecentAndFavoriteDocumentsOperation *, _QWORD);
  void *v10;
  id v11;
  BRCServerZone *v12;
  uint64_t v13;
  BRCServerZone *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  BRCServerZone *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  BRCFetchRecentAndFavoriteDocumentsOperation *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  BRCServerZone *v40;
  id v41;
  id v42;
  unsigned int v43;
  _QWORD v44[4];
  BRCServerZone *v45;
  unsigned int v46;

  v8 = a4;
  v9 = (void (**)(id, BRCFetchRecentAndFavoriteDocumentsOperation *, _QWORD))a5;
  if ((-[BRCServerZone state](self->_serverZone, "state") & a3) != 0)
  {
    v9[2](v9, self, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("indexName"), v8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95010]), "initWithRecordType:predicate:", CFSTR("SearchIndexes"), v30);
    v11 = -[BRCFetchRecordSubResourcesOperation initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:]([BRCFetchRecordSubResourcesOperation alloc], "initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:", self->_serverZone, self, 0, 0, self->super._sessionContext);
    v12 = self->_serverZone;
    v44[0] = MEMORY[0x1E0C809B0];
    v13 = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke;
    v44[3] = &unk_1E8764BF8;
    v14 = v12;
    v45 = v14;
    v46 = a3;
    objc_msgSend(v11, "setQueryFinishedServerTruthCallback:", v44);
    v38[0] = v13;
    v38[1] = 3221225472;
    v38[2] = __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_2;
    v38[3] = &unk_1E8764F48;
    v15 = v8;
    v39 = v15;
    v40 = v14;
    v43 = a3;
    v16 = v11;
    v41 = v16;
    v42 = v9;
    v29 = v14;
    v17 = (void *)MEMORY[0x1D17A6DB0](v38);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95038]), "initWithQuery:", v10);
    -[BRCServerZone zoneID](self->_serverZone, "zoneID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setZoneID:", v19);

    -[BRCServerZone mangledID](self->_serverZone, "mangledID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "numberOfGreedyRecentlyUsedItems");

    if (v22 >= 0x96)
      v23 = 150;
    else
      v23 = v22;
    objc_msgSend(v18, "setResultsLimit:", v23);
    objc_msgSend(v18, "setFetchAllResults:", 0);
    objc_msgSend(v18, "setShouldFetchAssetContent:", 0);
    objc_msgSend(MEMORY[0x1E0C95048], "desiredKeysWithMask:", 185);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDesiredKeys:", v24);

    objc_msgSend(v16, "callbackQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCallbackQueue:", v25);

    v26 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_3;
    v36[3] = &unk_1E87637C8;
    v27 = v16;
    v37 = v27;
    objc_msgSend(v18, "setRecordFetchedBlock:", v36);
    v31[0] = v26;
    v31[1] = 3221225472;
    v31[2] = __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_4;
    v31[3] = &unk_1E8764F98;
    v32 = v27;
    v9 = v17;
    v35 = v9;
    v33 = self;
    v34 = v15;
    v28 = v27;
    objc_msgSend(v18, "setQueryCompletionBlock:", v31);
    -[_BRCOperation addSubOperation:](self, "addSubOperation:", v18);

  }
}

uint64_t __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStateBits:", *(unsigned int *)(a1 + 40));
}

void __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  int v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "brc_isRetriable") & 1) == 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v20 = v10;
      v21 = 2112;
      v22 = v7;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] We seem to be unable to fetch %@. Setting the bit anyway to allow the sync engine to progress (error %@)%@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "db");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serialQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_11;
    block[3] = &unk_1E8764F20;
    v14 = *(id *)(a1 + 40);
    v18 = *(_DWORD *)(a1 + 64);
    v15 = *(id *)(a1 + 48);
    v17 = *(id *)(a1 + 56);
    v16 = v5;
    dispatch_async(v12, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_11(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setStateBits:", *(unsigned int *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "callbackQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_2_12;
  v3[3] = &unk_1E875F7C0;
  v5 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 48);
  dispatch_async(v2, v3);

}

uint64_t __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_2_12(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addRecord:", a2);
}

void __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "cancel");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_5;
    v9[3] = &unk_1E8764F70;
    v10 = v5;
    v6 = *(id *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v13 = v6;
    v11 = v7;
    v12 = v8;
    objc_msgSend(v10, "notifyWhenRecordsAreFetchedAndFinish:", v9);

  }
}

void __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 56);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, v4, v11);

  }
  else
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "saveRecordsWithQueryCursor:", 0);
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v6 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0);
    }
    else
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_5_cold_1(a1, (uint64_t)v8, v9);

      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: Couldn't allocate ranks when fetching query %@"), *(_QWORD *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v10);

    }
  }
}

- (void)main
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__BRCFetchRecentAndFavoriteDocumentsOperation_main__block_invoke;
  v2[3] = &unk_1E8764FC0;
  v2[4] = self;
  -[BRCFetchRecentAndFavoriteDocumentsOperation _performQueryOperationForBit:index:completion:](self, "_performQueryOperationForBit:index:completion:", 8, CFSTR("recent_documents"), v2);
}

uint64_t __51__BRCFetchRecentAndFavoriteDocumentsOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _QWORD v5[5];

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "completedWithResult:error:", 0, a3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__BRCFetchRecentAndFavoriteDocumentsOperation_main__block_invoke_2;
  v5[3] = &unk_1E8764FC0;
  v5[4] = v3;
  return objc_msgSend(v3, "_performQueryOperationForBit:index:completion:", 16, CFSTR("favorite_documents"), v5);
}

uint64_t __51__BRCFetchRecentAndFavoriteDocumentsOperation_main__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverZone, 0);
}

void __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_5_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_fault_impl(&dword_1CBD43000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't allocate ranks when fetching query %@%@", (uint8_t *)&v4, 0x16u);
}

@end
