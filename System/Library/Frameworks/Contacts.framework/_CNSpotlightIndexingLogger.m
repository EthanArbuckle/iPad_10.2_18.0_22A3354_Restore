@implementation _CNSpotlightIndexingLogger

- (_CNSpotlightIndexingLogger)init
{
  _CNSpotlightIndexingLogger *v2;
  os_log_t v3;
  OS_os_log *log;
  os_log_t v5;
  OS_os_log *summaryLog;
  _CNSpotlightIndexingLogger *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_CNSpotlightIndexingLogger;
  v2 = -[_CNSpotlightIndexingLogger init](&v9, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.contacts", "SpotlightIndexing");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = os_log_create("com.apple.contacts", "SpotlightIndexingSummary");
    summaryLog = v2->_summaryLog;
    v2->_summaryLog = (OS_os_log *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)indexingContacts:(id)a3
{
  id v4;
  os_signpost_id_t v5;
  OS_os_log *v6;
  NSObject *v7;
  os_activity_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  OS_os_log *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD aBlock[4];
  os_activity_t v20;
  uint8_t buf[16];

  v4 = a3;
  v5 = os_signpost_id_generate((os_log_t)self->_log);
  v6 = self->_log;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Indexing Contacts", ", buf, 2u);
  }

  v8 = _os_activity_create(&dword_18F8BD000, "IndexingContacts", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47___CNSpotlightIndexingLogger_indexingContacts___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v20 = v8;
  v10 = v8;
  v11 = _Block_copy(aBlock);
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __47___CNSpotlightIndexingLogger_indexingContacts___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v12 = v4;
  v17 = v12;
  v18 = v11;
  v13 = v11;
  os_activity_apply(v10, block);

  v14 = self->_log;
  v15 = v14;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v15, OS_SIGNPOST_INTERVAL_END, v5, "Indexing Contacts", ", buf, 2u);
  }

}

- (void)reindexingAllSearchableItems:(id)a3
{
  id v4;
  os_signpost_id_t v5;
  OS_os_log *v6;
  NSObject *v7;
  os_activity_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  OS_os_log *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD aBlock[4];
  os_activity_t v20;
  uint8_t buf[16];

  v4 = a3;
  v5 = os_signpost_id_generate((os_log_t)self->_log);
  v6 = self->_log;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Reindexing All Searchable Items", ", buf, 2u);
  }

  v8 = _os_activity_create(&dword_18F8BD000, "ReindexingAllSearchableItems", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59___CNSpotlightIndexingLogger_reindexingAllSearchableItems___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v20 = v8;
  v10 = v8;
  v11 = _Block_copy(aBlock);
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __59___CNSpotlightIndexingLogger_reindexingAllSearchableItems___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v12 = v4;
  v17 = v12;
  v18 = v11;
  v13 = v11;
  os_activity_apply(v10, block);

  v14 = self->_log;
  v15 = v14;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v15, OS_SIGNPOST_INTERVAL_END, v5, "Reindexing All Searchable Items", ", buf, 2u);
  }

}

- (void)reindexingSearchableItemsWithIdentifiers:(id)a3
{
  id v4;
  os_signpost_id_t v5;
  OS_os_log *v6;
  NSObject *v7;
  os_activity_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  OS_os_log *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD aBlock[4];
  os_activity_t v20;
  uint8_t buf[16];

  v4 = a3;
  v5 = os_signpost_id_generate((os_log_t)self->_log);
  v6 = self->_log;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Reindexing Searchable Items with Identifiers", ", buf, 2u);
  }

  v8 = _os_activity_create(&dword_18F8BD000, "ReindexingSearchableItemsWithIdentifiers", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71___CNSpotlightIndexingLogger_reindexingSearchableItemsWithIdentifiers___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v20 = v8;
  v10 = v8;
  v11 = _Block_copy(aBlock);
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __71___CNSpotlightIndexingLogger_reindexingSearchableItemsWithIdentifiers___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v12 = v4;
  v17 = v12;
  v18 = v11;
  v13 = v11;
  os_activity_apply(v10, block);

  v14 = self->_log;
  v15 = v14;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v15, OS_SIGNPOST_INTERVAL_END, v5, "Reindexing Searchable Items with Identifiers", ", buf, 2u);
  }

}

- (void)verifyingIndex:(id)a3
{
  id v4;
  os_signpost_id_t v5;
  OS_os_log *v6;
  NSObject *v7;
  os_activity_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  OS_os_log *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD aBlock[4];
  os_activity_t v20;
  uint8_t buf[16];

  v4 = a3;
  v5 = os_signpost_id_generate((os_log_t)self->_log);
  v6 = self->_log;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Verifying Index", ", buf, 2u);
  }

  v8 = _os_activity_create(&dword_18F8BD000, "VerifyingIndex", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45___CNSpotlightIndexingLogger_verifyingIndex___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v20 = v8;
  v10 = v8;
  v11 = _Block_copy(aBlock);
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __45___CNSpotlightIndexingLogger_verifyingIndex___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v12 = v4;
  v17 = v12;
  v18 = v11;
  v13 = v11;
  os_activity_apply(v10, block);

  v14 = self->_log;
  v15 = v14;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v15, OS_SIGNPOST_INTERVAL_END, v5, "Verifying Index", ", buf, 2u);
  }

}

- (void)noContactChangesToIndex
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNSpotlightIndexingLogger log](self, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18F8BD000, v2, OS_LOG_TYPE_DEFAULT, "No contact changes to index", v3, 2u);
  }

}

- (void)willReindexItemsWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218242;
    v7 = objc_msgSend(v4, "count");
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_DEFAULT, "Will reindex items with identifiers(%ld): %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)deferringReindexAsFailedToPrepareForReindexing
{
  OUTLINED_FUNCTION_2(&dword_18F8BD000, a1, a3, "Deferring the reindex as failed to prepare for reindexing", a5, a6, a7, a8, 0);
}

- (void)willStartIndexingWithClientState:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_DEFAULT, "Will start indexing with client state: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)willBatchIndexForFullSyncWithCount:(unint64_t)a3 lastOffset:(int64_t)a4 doneFullSync:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *v8;
  const __CFString *v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  int64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v5 = a5;
  v16 = *MEMORY[0x1E0C80C00];
  -[_CNSpotlightIndexingLogger log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = &stru_1E29FF900;
    v10 = 134218498;
    v11 = a3;
    if (v5)
      v9 = CFSTR(", final batch!");
    v12 = 2048;
    v13 = a4;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_18F8BD000, v8, OS_LOG_TYPE_DEFAULT, "Will full sync batch index %li items with last offset %li%@", (uint8_t *)&v10, 0x20u);
  }

}

- (void)willBatchIndexForDeltaSyncWithUpdateCount:(unint64_t)a3 deleteCount:(unint64_t)a4
{
  NSObject *v6;
  int v7;
  unint64_t v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[_CNSpotlightIndexingLogger log](self, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218240;
    v8 = a3;
    v9 = 2048;
    v10 = a4;
    _os_log_impl(&dword_18F8BD000, v6, OS_LOG_TYPE_DEFAULT, "Will delta sync batch index %li update items and %li delete items", (uint8_t *)&v7, 0x16u);
  }

}

- (void)willClearChangeHistory:(id)a3 toChangeAnchor:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_18F8BD000, v8, OS_LOG_TYPE_DEFAULT, "Will clear change history for %{public}@ to change anchor %@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)willReindexAsFailedToRegisterForChangeHistory:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[_CNSpotlightIndexingLogger willReindexAsFailedToRegisterForChangeHistory:error:].cold.1();

}

- (void)willReindexAsFailedToFetchChangeHistory:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[_CNSpotlightIndexingLogger willReindexAsFailedToFetchChangeHistory:error:].cold.1();

}

- (void)willReindexAsChangeHistoryIsTruncated:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNSpotlightIndexingLogger willReindexAsChangeHistoryIsTruncated:].cold.1();

}

- (void)willReindexAsFailedToFetchClientState
{
  OUTLINED_FUNCTION_2(&dword_18F8BD000, a1, a3, "Will reindex as failed to fetch client state", a5, a6, a7, a8, 0);
}

- (void)willResumeReindexingAsNotFinished
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNSpotlightIndexingLogger log](self, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18F8BD000, v2, OS_LOG_TYPE_DEFAULT, "Will resume reindexing as previous attempt did not finish", v3, 2u);
  }

}

- (void)willReindexAsIndexVersionChangedFrom:(int64_t)a3 to:(int64_t)a4
{
  NSObject *v6;
  int v7;
  int64_t v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[_CNSpotlightIndexingLogger log](self, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218240;
    v8 = a3;
    v9 = 2048;
    v10 = a4;
    _os_log_impl(&dword_18F8BD000, v6, OS_LOG_TYPE_DEFAULT, "Will reindex as index version has changed from %li to %li", (uint8_t *)&v7, 0x16u);
  }

}

- (void)willReindexAsSnapshotAnchorChangedFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_18F8BD000, v8, OS_LOG_TYPE_DEFAULT, "Will reindex as the snapshot anchor has changed from %@ to %@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)willResumeIndexingAfterOffset:(int64_t)a3
{
  NSObject *v4;
  int v5;
  int64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[_CNSpotlightIndexingLogger log](self, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = a3;
    _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_DEFAULT, "Will resume the reindex after offset %li", (uint8_t *)&v5, 0xCu);
  }

}

- (void)failedToCreateSearchableItemForContactIdentifier:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNSpotlightIndexingLogger failedToCreateSearchableItemForContactIdentifier:].cold.1();

}

- (void)failedToFetchContactForChange:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNSpotlightIndexingLogger failedToFetchContactForChange:].cold.1();

}

- (void)failedToClearChangeHistory:(id)a3 toChangeAnchor:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = 138543874;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_error_impl(&dword_18F8BD000, v11, OS_LOG_TYPE_ERROR, "Failed to clear change history for %{public}@ to change anchor %@, error: %@", (uint8_t *)&v12, 0x20u);
  }

}

- (void)failedToFetchSearchableForContactIdentifiers:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[_CNSpotlightIndexingLogger failedToFetchSearchableForContactIdentifiers:error:].cold.1(v6, (uint64_t)v7, v8);

}

- (id)_stringForSpotlightError:(id)a3 willRetry:(BOOL)a4
{
  const __CFString *v4;

  v4 = CFSTR("%@");
  if (a4)
    v4 = CFSTR("will retry, %@");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, a3);
}

- (void)failedToFetchClientStateFromSpotlight:(id)a3 willRetry:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[_CNSpotlightIndexingLogger _stringForSpotlightError:willRetry:](self, "_stringForSpotlightError:willRetry:", v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_error_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch client state from CoreSpotlight, %{public}@", (uint8_t *)&v9, 0xCu);

  }
}

- (void)failedToBeginIndexBatchWithSpotlight:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNSpotlightIndexingLogger failedToBeginIndexBatchWithSpotlight:].cold.1();

}

- (void)failedToEndIndexBatchWithSpotlight:(id)a3 willRetry:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[_CNSpotlightIndexingLogger _stringForSpotlightError:willRetry:](self, "_stringForSpotlightError:willRetry:", v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_error_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_ERROR, "Failed to end index batch with CoreSpotlight, %{public}@", (uint8_t *)&v9, 0xCu);

  }
}

- (void)failedToJournalSearchableItemsForIndexingWithSpotlight:(id)a3 identifiers:(id)a4 willRetry:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v5 = a5;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[_CNSpotlightIndexingLogger _stringForSpotlightError:willRetry:](self, "_stringForSpotlightError:willRetry:", v8, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v11;
    v14 = 2048;
    v15 = objc_msgSend(v9, "count");
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_18F8BD000, v10, OS_LOG_TYPE_ERROR, "Failed to journal searchable items for indexing with CoreSpotlight, %@ \nidentifiers(%ld) %{public}@", (uint8_t *)&v12, 0x20u);

  }
}

- (void)failedToJournalItemIdentifiersForDeletionWithSpotlight:(id)a3 identifiers:(id)a4 willRetry:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v5 = a5;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[_CNSpotlightIndexingLogger _stringForSpotlightError:willRetry:](self, "_stringForSpotlightError:willRetry:", v8, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v11;
    v14 = 2048;
    v15 = objc_msgSend(v9, "count");
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_18F8BD000, v10, OS_LOG_TYPE_ERROR, "Failed to journal searchable item identifiers for deletion with CoreSpotlight,%{public}@ \nidentifiers(%ld) %{public}@", (uint8_t *)&v12, 0x20u);

  }
}

- (void)failedToDeleteAllSearchableItemsWithSpotlight:(id)a3 willRetry:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[_CNSpotlightIndexingLogger _stringForSpotlightError:willRetry:](self, "_stringForSpotlightError:willRetry:", v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_error_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_ERROR, "Failed to delete all searchable items with CoreSpotlight, %{public}@", (uint8_t *)&v9, 0xCu);

  }
}

- (void)failedToUnarchiveClientStateData:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNSpotlightIndexingLogger failedToUnarchiveClientStateData:].cold.1();

}

- (void)failedToCreateUnarchiverForClientStateWithError:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNSpotlightIndexingLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNSpotlightIndexingLogger failedToCreateUnarchiverForClientStateWithError:].cold.1();

}

- (void)finishedIndexingForFullSyncWithCount:(unint64_t)a3
{
  NSObject *v4;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[_CNSpotlightIndexingLogger summaryLog](self, "summaryLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = a3;
    _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_DEFAULT, "Finished indexing for full sync with %ld contacts", (uint8_t *)&v5, 0xCu);
  }

}

- (void)finishedIndexingForDeltaSyncWithUpdateCount:(unint64_t)a3 deleteCount:(unint64_t)a4
{
  NSObject *v6;
  int v7;
  unint64_t v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[_CNSpotlightIndexingLogger summaryLog](self, "summaryLog");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218240;
    v8 = a3;
    v9 = 2048;
    v10 = a4;
    _os_log_impl(&dword_18F8BD000, v6, OS_LOG_TYPE_DEFAULT, "Finished indexing for delta sync with %li updates and %li deletes", (uint8_t *)&v7, 0x16u);
  }

}

- (void)finishedBatchIndexWithUpdateIdentifiers:(id)a3 deleteIdentifiers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_CNSpotlightIndexingLogger summaryLog](self, "summaryLog");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218754;
    v10 = objc_msgSend(v6, "count");
    v11 = 2114;
    v12 = v6;
    v13 = 2048;
    v14 = objc_msgSend(v7, "count");
    v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_18F8BD000, v8, OS_LOG_TYPE_DEFAULT, "Finished batch index \nupdateIdentifiers(%ld) \n%{public}@ \ndeleteIdentifiers(%ld) \n%{public}@", (uint8_t *)&v9, 0x2Au);
  }

}

- (void)didNotFinishIndexingForFullSyncWithError:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNSpotlightIndexingLogger summaryLog](self, "summaryLog");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNSpotlightIndexingLogger didNotFinishIndexingForFullSyncWithError:].cold.1();

}

- (void)didNotFinishIndexingForDeltaSyncWithError:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNSpotlightIndexingLogger summaryLog](self, "summaryLog");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNSpotlightIndexingLogger didNotFinishIndexingForDeltaSyncWithError:].cold.1();

}

- (void)verifiedIndexWithSummmary:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CNSpotlightIndexingLogger summaryLog](self, "summaryLog");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_DEFAULT, "Verified index, summary: \n%{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (OS_os_log)log
{
  return self->_log;
}

- (OS_os_log)summaryLog
{
  return self->_summaryLog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryLog, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)willReindexAsFailedToRegisterForChangeHistory:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_18F8BD000, v0, v1, "Will reindex as failed to register for change history as %{public}@, error: %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)willReindexAsFailedToFetchChangeHistory:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_18F8BD000, v0, v1, "Will reindex as failed to fetch change history for %{public}@, error: %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)willReindexAsChangeHistoryIsTruncated:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Will reindex as change history is truncated for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)failedToCreateSearchableItemForContactIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Failed to create searchable item for contact identifier: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)failedToFetchContactForChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Failed to fetch contact for change: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)failedToFetchSearchableForContactIdentifiers:(NSObject *)a3 error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint8_t v6[12];
  __int16 v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_3();
  v7 = 2114;
  v8 = a1;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_18F8BD000, a3, OS_LOG_TYPE_ERROR, "Failed to fetch searchable items for contact identifiers(%ld) %{public}@, error: %@", v6, 0x20u);
}

- (void)failedToBeginIndexBatchWithSpotlight:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Failed to begin index batch with CoreSpotlight, exception: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)failedToUnarchiveClientStateData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Failed to unarchive client state data from CoreSpotlight, exception: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)failedToCreateUnarchiverForClientStateWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Failed to create unarchiver for client state data from CoreSpotlight, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)didNotFinishIndexingForFullSyncWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Did not finish indexing for full sync, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)didNotFinishIndexingForDeltaSyncWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Did not finish indexing for delta sync, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
