@implementation FPDDomainIndexer

- (BOOL)needsAuthentication
{
  void *v2;
  char v3;

  -[FPDDomainIndexer state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsAuth");

  return v3;
}

- (BOOL)isIndexed
{
  void *v3;
  char v4;
  void *v5;

  -[FPDDomainIndexer state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "droppedIndex") & 1) != 0 || !self->_isStarted)
  {
    -[FPDDomainIndexer state](self, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "needsIndexing");

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (FPDDomainIndexer)initWithExtension:(id)a3 domain:(id)a4 enabled:(BOOL)a5
{
  id v9;
  id v10;
  FPDDomainIndexer *v11;
  FPDDomainIndexer *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSString *spotlightDomainIdentifier;
  id v17;
  uint64_t v18;
  NSString *domainIdentifier;
  id v20;
  uint64_t v21;
  NSString *providerDomainID;
  FPDDomainIndexerState *v23;
  void *v24;
  uint64_t v25;
  FPDDomainIndexerState *state;
  NSObject *v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *queue;
  void *v30;
  void *v32;
  id WeakRetained;
  objc_super v34;

  v9 = a3;
  v10 = a4;
  v34.receiver = self;
  v34.super_class = (Class)FPDDomainIndexer;
  v11 = -[FPDDomainIndexer init](&v34, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_extension, v9);
    v13 = objc_storeWeak((id *)&v12->_domain, v10);
    objc_msgSend(v10, "nsDomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "spotlightDomainIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    spotlightDomainIdentifier = v12->_spotlightDomainIdentifier;
    v12->_spotlightDomainIdentifier = (NSString *)v15;

    if (!v12->_spotlightDomainIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&v12->_domain);
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("FPDDomainIndexer.m"), 171, CFSTR("Domain %@ has no spotlight domain identifier"), WeakRetained);

    }
    v17 = objc_loadWeakRetained((id *)&v12->_domain);
    objc_msgSend(v17, "identifier");
    v18 = objc_claimAutoreleasedReturnValue();
    domainIdentifier = v12->_domainIdentifier;
    v12->_domainIdentifier = (NSString *)v18;

    v20 = objc_loadWeakRetained((id *)&v12->_domain);
    objc_msgSend(v20, "providerDomainID");
    v21 = objc_claimAutoreleasedReturnValue();
    providerDomainID = v12->_providerDomainID;
    v12->_providerDomainID = (NSString *)v21;

    v23 = [FPDDomainIndexerState alloc];
    objc_msgSend(v10, "supportURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[FPDDomainIndexerState initWithSupportURL:](v23, "initWithSupportURL:", v24);
    state = v12->_state;
    v12->_state = (FPDDomainIndexerState *)v25;

    v12->_enabled = a5;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_queue_create("indexer", v27);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v28;

    v12->_maxRetryDelayInSec = 60;
    -[FPDDomainIndexerState setNeedsIndexing:](v12->_state, "setNeedsIndexing:", objc_msgSend(v10, "shouldIndexWhenStart"));
    indexingScheduler();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "ping");

  }
  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  BOOL v7;
  __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_extension);
  objc_msgSend(WeakRetained, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSString isEqualToString:](self->_domainIdentifier, "isEqualToString:", *MEMORY[0x1E0CAAB38]);
  if (v7)
  {
    v8 = CFSTR("(default)");
  }
  else
  {
    -[NSString fp_obfuscatedFilename](self->_domainIdentifier, "fp_obfuscatedFilename");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@:%@ e:%d>"), v4, self, v6, v8, self->_enabled);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  return v9;
}

- (void)start
{
  NSObject *queue;
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ can't resume an invalidated indexer"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDDomainIndexer start]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainIndexer/FPDDomainIndexer.m", 195, (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__FPDDomainIndexer_start__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_async(queue, block);
}

void __25__FPDDomainIndexer_start__block_invoke(uint64_t a1)
{
  id v1;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  char v11;
  void *v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;

  objc_msgSend(*(id *)(a1 + 32), "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "log");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 43))
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __25__FPDDomainIndexer_start__block_invoke_cold_3();

  }
  else
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __25__FPDDomainIndexer_start__block_invoke_cold_2();

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 43) = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadPersistedState");

  objc_msgSend(*(id *)(a1 + 32), "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "needsIndexing") && (v9 = *(_QWORD *)(a1 + 32), !*(_BYTE *)(v9 + 40)))
  {
    v15 = *(_QWORD *)(v9 + 24);

    if (!v15)
      objc_msgSend(*(id *)(a1 + 32), "_indexOneBatchIfPossibleClearingNeedsIndexing:", 1);
  }
  else
  {

  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  v11 = objc_msgSend(WeakRetained, "isHidden");
  if ((v11 & 1) != 0
    || (v1 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128)), (objc_msgSend(v1, "isHiddenByUser") & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "droppedIndex");

    if ((v11 & 1) == 0)
    if ((v13 & 1) == 0)
    {
      fp_current_or_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __25__FPDDomainIndexer_start__block_invoke_cold_1();

      objc_msgSend(*(id *)(a1 + 32), "dropIndexForReason:completion:", 2, &__block_literal_global_25);
    }
  }
  else
  {

  }
  __fp_pop_log();

}

- (void)_cancelTimer
{
  NSObject *timerSource;
  OS_dispatch_source *v4;

  timerSource = self->_timerSource;
  if (timerSource)
  {
    dispatch_source_cancel(timerSource);
    v4 = self->_timerSource;
    self->_timerSource = 0;

  }
}

- (void)_unregisterFromScheduler
{
  void *v3;

  if (self->_registeredWithScheduler)
  {
    indexingScheduler();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeWatcher:", self);

    self->_registeredWithScheduler = 0;
  }
}

- (void)invalidate
{
  void *v3;
  NSObject *v4;

  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ invalidated twice"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDDomainIndexer invalidate]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainIndexer/FPDDomainIndexer.m", 234, (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
  }
  self->_invalidated = 1;
  -[FPDDomainIndexer _unregisterFromScheduler](self, "_unregisterFromScheduler");
  -[FPDDomainIndexer _cancelTimer](self, "_cancelTimer");
}

- (void)clearNeedsAuth
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__FPDDomainIndexer_clearNeedsAuth__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __34__FPDDomainIndexer_clearNeedsAuth__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BYTE *v8;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsAuth");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsAuth:", 0);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensionIndexer:didChangeNeedsAuthentification:", v6, objc_msgSend(v7, "needsAuth"));

    v8 = *(_BYTE **)(a1 + 32);
    if (v8[41])
      objc_msgSend(v8, "_signalChangesWithCompletionHandler:", &__block_literal_global_86);
  }
}

- (void)setNeedsAuth
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__FPDDomainIndexer_setNeedsAuth__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __32__FPDDomainIndexer_setNeedsAuth__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsAuth");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsAuth:", 1);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extensionIndexer:didChangeNeedsAuthentification:", v5, objc_msgSend(v6, "needsAuth"));

  }
}

- (BOOL)learnNeedsAuthenticationFromBatchError
{
  return 1;
}

- (void)_handleOneBatchCompletionWithError:(id)a3 hasMoreChanges:(BOOL)a4
{
  int v4;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  NSObject *v11;
  NSError *lastError;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  id v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSDate *lastIndexingStartDate;
  NSObject *v30;
  void *v31;
  unint64_t consecutiveBatchErrorCount;
  BOOL v33;
  char v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  const __CFString *v40;
  unint64_t v41;
  unint64_t v42;
  NSObject *v43;
  OS_dispatch_source *v44;
  OS_dispatch_source *timerSource;
  OS_dispatch_source *v46;
  NSObject *v47;
  dispatch_block_t v48;
  dispatch_time_t v49;
  void *v50;
  unint64_t v51;
  _QWORD v52[4];
  id v53;
  uint64_t section;
  _BYTE buf[12];
  __int16 v56;
  unint64_t v57;
  __int16 v58;
  unint64_t v59;
  __int16 v60;
  const __CFString *v61;
  uint64_t v62;

  v4 = a4;
  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "extensionIndexerDidIndexOneBatch:", self);

  }
  section = __fp_create_section();
  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "fp_prettyDescription");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v37;
    v39 = CFSTR("success");
    if (v37)
      v39 = (const __CFString *)v37;
    v40 = CFSTR("no");
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = section;
    v56 = 2112;
    v57 = (unint64_t)self;
    v58 = 2112;
    if (v4)
      v40 = CFSTR("yes");
    v59 = (unint64_t)v39;
    v60 = 2112;
    v61 = v40;
    _os_log_debug_impl(&dword_1CF55F000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: handling batch index completion: %@ more-changes:%@", buf, 0x2Au);

  }
  self->_isIndexing = 0;
  *(int64x2_t *)&self->_batchIndexedCount = vaddq_s64(*(int64x2_t *)&self->_batchIndexedCount, vdupq_n_s64(1uLL));
  if (v7)
  {
    ++self->_consecutiveBatchErrorCount;
    objc_storeStrong((id *)&self->_lastError, a3);
    if ((objc_msgSend(v7, "fp_isFileProviderError:", -1000) & 1) != 0)
      v4 = 0;
    else
      v4 = objc_msgSend(v7, "fp_isFeatureUnsupportedError") ^ 1;
  }
  else
  {
    if ((-[NSError fp_isSyncAnchorExpiredError](self->_lastError, "fp_isSyncAnchorExpiredError") & 1) == 0)
    {
      self->_consecutiveBatchErrorCount = 0;
      lastError = self->_lastError;
      self->_lastError = 0;

    }
    -[FPDDomainIndexer _cancelTimer](self, "_cancelTimer");
  }
  if (-[FPDDomainIndexer learnNeedsAuthenticationFromBatchError](self, "learnNeedsAuthenticationFromBatchError"))
  {
    -[FPDDomainIndexer state](self, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "needsAuth");

    if (v14)
    {
      if (v7)
        goto LABEL_18;
      -[FPDDomainIndexer state](self, "state");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setNeedsAuth:", 0);
    }
    else
    {
      if (!objc_msgSend(v7, "fp_isFileProviderError:", -1000))
        goto LABEL_18;
      -[FPDDomainIndexer state](self, "state");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setNeedsAuth:", 1);
    }

  }
LABEL_18:
  -[FPDDomainIndexer state](self, "state");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "droppedIndex");
  if (v7)
    v18 = 0;
  else
    v18 = v17;

  if (v18)
  {
    v19 = objc_loadWeakRetained((id *)&self->_domain);
    if ((objc_msgSend(v19, "isHidden") & 1) != 0)
    {
LABEL_25:

      goto LABEL_26;
    }
    v20 = objc_loadWeakRetained((id *)&self->_domain);
    v21 = objc_msgSend(v20, "isHiddenByUser");

    if ((v21 & 1) == 0)
    {
      -[FPDDomainIndexer state](self, "state");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDroppedIndex:", 0);
      goto LABEL_25;
    }
  }
LABEL_26:
  if ((v4 & 1) == 0)
  {
    -[FPDDomainIndexer state](self, "state");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "needsIndexing");

    if ((v23 & 1) == 0)
    {
      -[FPDDomainIndexer state](self, "state");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setNeedsIndexing:", 0);

      lastIndexingStartDate = self->_lastIndexingStartDate;
      self->_lastIndexingStartDate = 0;

      self->_batchIndexedCountSinceLastIndexing = 0;
      -[FPDDomainIndexer _unregisterFromScheduler](self, "_unregisterFromScheduler");
      fp_current_or_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[FPDDomainIndexer _handleOneBatchCompletionWithError:hasMoreChanges:].cold.5();
      goto LABEL_36;
    }
  }
  -[FPDDomainIndexer state](self, "state");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "needsIndexing");

  if (((v25 ^ 1 | v4) & 1) == 0)
  {
    fp_current_or_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[FPDDomainIndexer _handleOneBatchCompletionWithError:hasMoreChanges:].cold.4();

  }
  if (!v7)
  {
LABEL_48:
    -[FPDDomainIndexer _indexOneBatchIfPossibleClearingNeedsIndexing:](self, "_indexOneBatchIfPossibleClearingNeedsIndexing:", v4 ^ 1u);
    goto LABEL_49;
  }
  -[FPDDomainIndexer _unregisterFromScheduler](self, "_unregisterFromScheduler");
  if (objc_msgSend(v7, "fp_isFeatureUnsupportedError"))
  {
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[FPDDomainIndexer _handleOneBatchCompletionWithError:hasMoreChanges:].cold.1();
LABEL_36:

    goto LABEL_49;
  }
  if (self->_timerSource)
  {
    fp_current_or_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "fp_prettyDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDDomainIndexer _handleOneBatchCompletionWithError:hasMoreChanges:].cold.3(v31, (uint64_t)self, buf, v30);
    }

    goto LABEL_49;
  }
  consecutiveBatchErrorCount = self->_consecutiveBatchErrorCount;
  v33 = consecutiveBatchErrorCount > 2;
  v34 = consecutiveBatchErrorCount - 2;
  if (!v33)
  {
    fp_current_or_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "fp_prettyDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDDomainIndexer _handleOneBatchCompletionWithError:hasMoreChanges:].cold.2(v36, (uint64_t *)&self->_consecutiveBatchErrorCount, (uint64_t)buf, v35);
    }

    goto LABEL_48;
  }
  v41 = 100000000 << v34;
  if (1000000000 * self->_maxRetryDelayInSec >= v41)
    v42 = v41;
  else
    v42 = 1000000000 * self->_maxRetryDelayInSec;
  fp_current_or_default_log();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "fp_prettyDescription");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = self->_consecutiveBatchErrorCount;
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v50;
    v56 = 2048;
    v57 = v42 / 0xF4240;
    v58 = 2048;
    v59 = v51;
    _os_log_error_impl(&dword_1CF55F000, v43, OS_LOG_TYPE_ERROR, "[ERROR] we received an error %@, retry in %llums (count:%lu)...", buf, 0x20u);

  }
  v44 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  timerSource = self->_timerSource;
  self->_timerSource = v44;

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v46 = self->_timerSource;
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __70__FPDDomainIndexer__handleOneBatchCompletionWithError_hasMoreChanges___block_invoke;
  v52[3] = &unk_1E8C75E70;
  objc_copyWeak(&v53, (id *)buf);
  v47 = v46;
  v48 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v52);
  dispatch_source_set_event_handler(v47, v48);

  v49 = dispatch_time(0, v42);
  dispatch_source_set_timer((dispatch_source_t)self->_timerSource, v49, 0xFFFFFFFFFFFFFFFFLL, v42);
  dispatch_resume((dispatch_object_t)self->_timerSource);
  objc_destroyWeak(&v53);
  objc_destroyWeak((id *)buf);
LABEL_49:
  __fp_leave_section_Debug();

}

void __70__FPDDomainIndexer__handleOneBatchCompletionWithError_hasMoreChanges___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __70__FPDDomainIndexer__handleOneBatchCompletionWithError_hasMoreChanges___block_invoke_cold_1();

    objc_msgSend(WeakRetained, "_cancelTimer");
    objc_msgSend(WeakRetained, "_indexOneBatchIfPossibleClearingNeedsIndexing:", 0);
  }

}

- (NSString)watcherLabel
{
  return self->_providerDomainID;
}

- (void)sharedSchedulerCanRun:(id)a3
{
  id v4;
  id v5;
  NSObject *queue;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];

  v4 = a3;
  indexingScheduler();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("[ASSERT] ‼️ unexpected scheduler called the indexer: %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDDomainIndexer sharedSchedulerCanRun:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainIndexer/FPDDomainIndexer.m", 400, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__FPDDomainIndexer_sharedSchedulerCanRun___block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_async(queue, block);

}

uint64_t __42__FPDDomainIndexer_sharedSchedulerCanRun___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BYTE *v3;
  NSObject *v4;

  __fp_create_section();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __42__FPDDomainIndexer_sharedSchedulerCanRun___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_unregisterFromScheduler");
  v3 = *(_BYTE **)(a1 + 32);
  if (v3[40])
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __42__FPDDomainIndexer_sharedSchedulerCanRun___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(v3, "__indexOneBatchIfPossibleClearingNeedsIndexing:", v3[44]);
  }
  return __fp_leave_section_Debug();
}

- (void)sharedSchedulerIsDeferred:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;

  v8 = a3;
  indexingScheduler();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 != v8)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[ASSERT] ‼️ unexpected scheduler called the indexer: %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDDomainIndexer sharedSchedulerIsDeferred:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainIndexer/FPDDomainIndexer.m", 423, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
  }

}

- (void)_indexOneBatchIfPossibleClearingNeedsIndexing:(BOOL)a3
{
  void *v5;
  id WeakRetained;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_timerSource)
    -[FPDDomainIndexer _indexOneBatchIfPossibleClearingNeedsIndexing:].cold.3();
  -[FPDDomainIndexer state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "droppedIndex") & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
    if (objc_msgSend(WeakRetained, "isHidden"))
    {

LABEL_7:
      fp_current_or_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[FPDDomainIndexer _indexOneBatchIfPossibleClearingNeedsIndexing:].cold.1();

      return;
    }
    v7 = objc_loadWeakRetained((id *)&self->_domain);
    v8 = objc_msgSend(v7, "isHiddenByUser");

    if (v8)
      goto LABEL_7;
  }
  else
  {

  }
  self->_clearNeedsIndexing = a3;
  location = 0;
  objc_initWeak(&location, self);
  if (self->_registeredWithScheduler)
  {
    indexingScheduler();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __66__FPDDomainIndexer__indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke;
    v14[3] = &unk_1E8C75E48;
    v14[4] = self;
    v11 = objc_msgSend(v10, "runIfPossible:", v14);

    if ((v11 & 1) == 0)
    {
      fp_current_or_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[FPDDomainIndexer _indexOneBatchIfPossibleClearingNeedsIndexing:].cold.2();

    }
  }
  else
  {
    self->_registeredWithScheduler = 1;
    indexingScheduler();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addWatcher:", self);

  }
  objc_destroyWeak(&location);
}

void __66__FPDDomainIndexer__indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  indexingScheduler();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sharedSchedulerCanRun:", v2);

}

- (void)__indexOneBatchIfPossibleClearingNeedsIndexing:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  _QWORD v16[6];

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_timerSource)
    -[FPDDomainIndexer __indexOneBatchIfPossibleClearingNeedsIndexing:].cold.6();
  v16[5] = __fp_create_section();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPDDomainIndexer __indexOneBatchIfPossibleClearingNeedsIndexing:].cold.5();

  if (self->_invalidated)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[FPDDomainIndexer __indexOneBatchIfPossibleClearingNeedsIndexing:].cold.4();

  }
  else
  {
    if (self->_isIndexing)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ we are already indexing"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

      __assert_rtn("-[FPDDomainIndexer __indexOneBatchIfPossibleClearingNeedsIndexing:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainIndexer/FPDDomainIndexer.m", 465, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
    }
    if (!self->_isStarted)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ we try to index before starting"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

      __assert_rtn("-[FPDDomainIndexer __indexOneBatchIfPossibleClearingNeedsIndexing:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainIndexer/FPDDomainIndexer.m", 466, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
    }
    self->_isIndexing = 1;
    if (v3)
    {
      -[FPDDomainIndexer state](self, "state");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNeedsIndexing:", 0);

    }
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__FPDDomainIndexer___indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke;
    v16[3] = &unk_1E8C753A8;
    v16[4] = self;
    v9 = (void *)MEMORY[0x1D17D1C84](v16);
    if (self->_enabled)
    {
      v15[0] = v8;
      v15[1] = 3221225472;
      v15[2] = __67__FPDDomainIndexer___indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke_103;
      v15[3] = &unk_1E8C79168;
      v15[4] = self;
      -[FPDDomainIndexer indexOneBatchWithCompletionHandler:](self, "indexOneBatchWithCompletionHandler:", v15);
    }
    else
    {
      fp_current_or_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[FPDDomainIndexer __indexOneBatchIfPossibleClearingNeedsIndexing:].cold.2();

      -[FPDDomainIndexer dropIndexForReason:completion:](self, "dropIndexForReason:completion:", 3, v9);
    }

  }
  __fp_leave_section_Debug();
}

void __67__FPDDomainIndexer___indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 120);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__FPDDomainIndexer___indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke_2;
  v7[3] = &unk_1E8C75850;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __67__FPDDomainIndexer___indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "log");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_handleOneBatchCompletionWithError:hasMoreChanges:");
  __fp_pop_log();

}

void __67__FPDDomainIndexer___indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke_103(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  char v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 120);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__FPDDomainIndexer___indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke_2_104;
  block[3] = &unk_1E8C77628;
  block[4] = v6;
  v10 = v5;
  v11 = a2;
  v8 = v5;
  dispatch_async(v7, block);

}

void __67__FPDDomainIndexer___indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke_2_104(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "log");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_handleOneBatchCompletionWithError:hasMoreChanges:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  __fp_pop_log();

}

- (void)indexOneBatchWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing implementation of %s in %@"), "-[FPDDomainIndexer indexOneBatchWithCompletionHandler:]", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_fault_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
  }

  __assert_rtn("-[FPDDomainIndexer indexOneBatchWithCompletionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainIndexer/FPDDomainIndexer.m", 497, (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
}

- (void)signalNeedsReindexFromScratchWithDropReason:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSString *domainIdentifier;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(WeakRetained, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "newFileProviderProxyWithTimeout:pid:", 0, 180.0);

  domainIdentifier = self->_domainIdentifier;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__FPDDomainIndexer_signalNeedsReindexFromScratchWithDropReason_completionHandler___block_invoke;
  v12[3] = &unk_1E8C75530;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "dropIndexForDomain:dropReason:completionHandler:", domainIdentifier, a3, v12);

}

void __82__FPDDomainIndexer_signalNeedsReindexFromScratchWithDropReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__FPDDomainIndexer_signalNeedsReindexFromScratchWithDropReason_completionHandler___block_invoke_2;
  v7[3] = &unk_1E8C79190;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "signalChangesWithCompletionHandler:", v7);

}

uint64_t __82__FPDDomainIndexer_signalNeedsReindexFromScratchWithDropReason_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)signalNeedsReindexItemsWithIdentifiers:(id)a3 indexReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  NSString *domainIdentifier;
  id v14;
  _QWORD v15[5];
  id v16;

  v8 = a5;
  objc_msgSend(a3, "fp_map:", &__block_literal_global_109);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(WeakRetained, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "newFileProviderProxyWithTimeout:pid:", 0, 180.0);

  domainIdentifier = self->_domainIdentifier;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__FPDDomainIndexer_signalNeedsReindexItemsWithIdentifiers_indexReason_completionHandler___block_invoke_2;
  v15[3] = &unk_1E8C75530;
  v15[4] = self;
  v16 = v8;
  v14 = v8;
  objc_msgSend(v12, "signalNeedsReindexItemsWithIdentifiers:domainIdentifier:indexReason:completionHandler:", v9, domainIdentifier, a4, v15);

}

id __89__FPDDomainIndexer_signalNeedsReindexItemsWithIdentifiers_indexReason_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = 0;
  objc_msgSend(MEMORY[0x1E0CAAC70], "getDomainIdentifier:andIdentifier:fromCoreSpotlightIdentifier:", 0, &v3, a2);
  return v3;
}

void __89__FPDDomainIndexer_signalNeedsReindexItemsWithIdentifiers_indexReason_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__FPDDomainIndexer_signalNeedsReindexItemsWithIdentifiers_indexReason_completionHandler___block_invoke_3;
  v7[3] = &unk_1E8C79190;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "signalChangesWithCompletionHandler:", v7);

}

uint64_t __89__FPDDomainIndexer_signalNeedsReindexItemsWithIdentifiers_indexReason_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)localSpotlightIndexer
{
  void *v3;
  FPDExtension **p_extension;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  p_extension = &self->_extension;
  WeakRetained = objc_loadWeakRetained((id *)&self->_extension);
  objc_msgSend(WeakRetained, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.FileProvider/%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathComponent:", self->_spotlightDomainIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0CA6B38]);
  v10 = objc_loadWeakRetained((id *)p_extension);
  objc_msgSend(v10, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topLevelBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "_initWithName:protectionClass:bundleIdentifier:options:", v8, 0, v12, 0);

  return v13;
}

- (void)dropIndexForReason:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  NSString *v19;
  void (**v20)(id, _QWORD);
  unint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  -[FPDDomainIndexer state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "droppedIndex");

  if (v8)
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[FPDDomainIndexer dropIndexForReason:completion:].cold.1();

    v6[2](v6, 0);
  }
  else
  {
    -[FPDDomainIndexer state](self, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordIndexDropReason:", a3);

    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[FPDDomainIndexer dropIndexForReason:completion:].cold.2();

    -[FPDDomainIndexer localSpotlightIndexer](self, "localSpotlightIndexer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_domainIdentifier;
    v22[0] = self->_spotlightDomainIdentifier;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke;
    v17[3] = &unk_1E8C79228;
    v17[4] = self;
    v18 = v12;
    v19 = v13;
    v20 = v6;
    v21 = a3;
    v15 = v13;
    v16 = v12;
    objc_msgSend(v16, "deleteSearchableItemsWithDomainIdentifiers:reason:completionHandler:", v14, 0, v17);

  }
}

void __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "log");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log();
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "beginIndexBatch");
    v7 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_2;
    v10[3] = &unk_1E8C79200;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v7, "endIndexBatchWithClientState:completionHandler:", v8, v10);

    if (*(_QWORD *)(a1 + 64) != 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "state");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDroppedIndex:", 1);

    }
  }
  __fp_pop_log();

}

void __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "log");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log();
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_2_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_116;
    v9[3] = &unk_1E8C791D8;
    v7 = *(void **)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v7;
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v8, "fetchLastClientStateWithCompletionHandler:", v9);

  }
  __fp_pop_log();

}

void __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_116(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "log");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_116_cold_2();
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v5, "length"))
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_116_cold_1(a1, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_7;
  }
LABEL_8:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log();

}

- (void)_signalChangesWithCompletionHandler:(id)a3
{
  void (**v4)(id, _BOOL8);
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 isIndexing;

  v4 = (void (**)(id, _BOOL8))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_timerSource)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[FPDDomainIndexer _signalChangesWithCompletionHandler:].cold.3((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);

    -[FPDDomainIndexer _cancelTimer](self, "_cancelTimer");
  }
  -[FPDDomainIndexer state](self, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsIndexing:", 1);

  if (self->_isIndexing)
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[FPDDomainIndexer _signalChangesWithCompletionHandler:].cold.2((uint64_t)self, v13, v14, v15, v16, v17, v18, v19);
  }
  else
  {
    if (self->_isStarted)
    {
      -[FPDDomainIndexer _indexOneBatchIfPossibleClearingNeedsIndexing:](self, "_indexOneBatchIfPossibleClearingNeedsIndexing:", 1);
      isIndexing = 0;
      goto LABEL_11;
    }
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[FPDDomainIndexer _signalChangesWithCompletionHandler:].cold.1();
  }

  isIndexing = self->_isIndexing;
LABEL_11:
  v4[2](v4, isIndexing);

}

- (void)signalChangesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__FPDDomainIndexer_signalChangesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E8C75698;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __55__FPDDomainIndexer_signalChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t section;
  void *v8;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "log");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  section = __fp_create_section();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __55__FPDDomainIndexer_signalChangesWithCompletionHandler___block_invoke_cold_2();

  if (*((_BYTE *)*v2 + 41))
  {
    objc_msgSend(*v2, "_signalChangesWithCompletionHandler:", *(_QWORD *)(a1 + 40), section, v8);
  }
  else
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __55__FPDDomainIndexer_signalChangesWithCompletionHandler___block_invoke_cold_1();

    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  __fp_leave_section_Debug();
  __fp_pop_log();

}

- (void)setIndexingEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__FPDDomainIndexer_setIndexingEnabled_completionHandler___block_invoke;
  block[3] = &unk_1E8C755D0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

void __57__FPDDomainIndexer_setIndexingEnabled_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  _QWORD v12[4];
  id v13;
  uint64_t section;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "log");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log();
  v15 = (id)objc_claimAutoreleasedReturnValue();

  section = __fp_create_section();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = CFSTR("user-enabled");
    if (!*(_BYTE *)(a1 + 48))
      v11 = CFSTR("user-disabled");
    *(_DWORD *)buf = 134218498;
    v17 = section;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: setting indexing to %@", buf, 0x20u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(v5 + 41))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    *(_QWORD *)(v5 + 48) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 72);
    *(_QWORD *)(v6 + 72) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = *(_BYTE *)(a1 + 48);
    v8 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __57__FPDDomainIndexer_setIndexingEnabled_completionHandler___block_invoke_122;
      v12[3] = &unk_1E8C75CF0;
      v13 = *(id *)(a1 + 40);
      objc_msgSend(v8, "_signalChangesWithCompletionHandler:", v12);
      v9 = v13;
    }
    else
    {
      objc_msgSend(v8, "dropIndexForReason:completion:", 3, *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "state");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNeedsIndexing:", 0);
    }

  }
  __fp_leave_section_Debug();
  __fp_pop_log();

}

uint64_t __57__FPDDomainIndexer_setIndexingEnabled_completionHandler___block_invoke_122(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dumpStateTo:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *queue;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *domainIdentifier;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD block[4];
  id v27;
  FPDDomainIndexer *v28;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
    objc_msgSend(WeakRetained, "nsDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fp_obfuscatedFilename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
    objc_msgSend(v6, "write:", CFSTR("domain: %@ %@\n"), v7, v11);

  }
  queue = self->_queue;
  v14 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__FPDDomainIndexer_dumpStateTo_withName___block_invoke;
  block[3] = &unk_1E8C75850;
  v15 = v6;
  v27 = v15;
  v28 = self;
  dispatch_sync(queue, block);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", objc_msgSend(v15, "fd"), 0);
  -[FPDDomainIndexer extension](self, "extension");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "domainForIdentifier:reason:", self->_domainIdentifier, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "session");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "existingFileProviderProxyWithTimeout:onlyAlreadyLifetimeExtended:pid:", 0, 0, -1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "synchronousRemoteObjectProxy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  domainIdentifier = self->_domainIdentifier;
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __41__FPDDomainIndexer_dumpStateTo_withName___block_invoke_2;
  v24[3] = &unk_1E8C753A8;
  v25 = v15;
  v23 = v15;
  objc_msgSend(v21, "dumpIndexStateForDomain:toFileHandler:completionHandler:", domainIdentifier, v16, v24);

}

void __41__FPDDomainIndexer_dumpStateTo_withName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  const char *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("      spDomainID:     %@\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  v2 = *(void **)(a1 + 32);
  indexingScheduler();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "write:", CFSTR("      scheduler:      %@\n"), v3);

  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 41))
    v4 = "yes";
  else
    v4 = "no";
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("      enabled:        %s\n"), v4);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 40))
    v5 = "yes";
  else
    v5 = "no";
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("      indexing:       %s\n"), v5);
  objc_msgSend(*(id *)(a1 + 40), "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dumpStateTo:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("      errors:         %ld\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64));
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("      batch-indexed (since last startup): %lu\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
  v7 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v7 + 72))
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
    objc_msgSend(v8, "write:", CFSTR("      on-going index started:     %.3fs ago\n"), v10);

    objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("      on-going index batch count: %lu\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
    v7 = *(_QWORD *)(a1 + 40);
  }
  v11 = *(void **)(v7 + 80);
  if (v11)
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v11, "description");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "write:", CFSTR("      last error: %s\n"), objc_msgSend(v13, "UTF8String"));

  }
}

void __41__FPDDomainIndexer_dumpStateTo_withName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v7 = v3;
    v4 = objc_msgSend(v3, "fp_isCocoaErrorCode:", 3072);
    v5 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v5, "write:", CFSTR("      not dumping extension: not running\n"));
    }
    else
    {
      objc_msgSend(v7, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "write:", CFSTR("      can't dump the extension: %@\n"), v6);

    }
    v3 = v7;
  }

}

- (void)dumpStateTo:(id)a3
{
  -[FPDDomainIndexer dumpStateTo:withName:](self, "dumpStateTo:withName:", a3, &stru_1E8C795D8);
}

- (BOOL)needsIndexing
{
  void *v2;
  char v3;

  -[FPDDomainIndexer state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsIndexing");

  return v3;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_domainIdentifier, a3);
}

- (FPDDomainIndexerDelegate)delegate
{
  return (FPDDomainIndexerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)maxRetryDelayInSec
{
  return self->_maxRetryDelayInSec;
}

- (void)setMaxRetryDelayInSec:(unint64_t)a3
{
  self->_maxRetryDelayInSec = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (FPDDomain)domain
{
  return (FPDDomain *)objc_loadWeakRetained((id *)&self->_domain);
}

- (FPDDomainIndexerState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (FPDExtension)extension
{
  return (FPDExtension *)objc_loadWeakRetained((id *)&self->_extension);
}

- (void)setExtension:(id)a3
{
  objc_storeWeak((id *)&self->_extension, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extension);
  objc_storeStrong((id *)&self->_state, 0);
  objc_destroyWeak((id *)&self->_domain);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spotlightDomainIdentifier, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_lastIndexingStartDate, 0);
  objc_storeStrong((id *)&self->_stableGroup, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_providerDomainID, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

void __25__FPDDomainIndexer_start__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] Domain is hidden, dropping index", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __25__FPDDomainIndexer_start__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] 🧲  starting indexation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __25__FPDDomainIndexer_start__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] 🧲  re-starting indexation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_handleOneBatchCompletionWithError:hasMoreChanges:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1CF55F000, v0, OS_LOG_TYPE_ERROR, "[ERROR] indexing is not supported for this provider, don't retry", v1, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)_handleOneBatchCompletionWithError:(uint64_t)a3 hasMoreChanges:(NSObject *)a4 .cold.2(void *a1, uint64_t *a2, uint64_t a3, NSObject *a4)
{
  uint64_t v5;

  v5 = *a2;
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2048;
  *(_QWORD *)(a3 + 14) = v5;
  OUTLINED_FUNCTION_10(&dword_1CF55F000, a4, a3, "[ERROR] we received an error %@, trying again (count:%lu)...", (uint8_t *)a3);

}

- (void)_handleOneBatchCompletionWithError:(uint8_t *)buf hasMoreChanges:(os_log_t)log .cold.3(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5;

  v5 = *(_QWORD *)(a2 + 64);
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v5;
  _os_log_error_impl(&dword_1CF55F000, log, OS_LOG_TYPE_ERROR, "[ERROR] we received an error %@, retry is already scheduled (count:%u)...", buf, 0x12u);

}

- (void)_handleOneBatchCompletionWithError:hasMoreChanges:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] we were signaled while fetching changes, indexing again", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_handleOneBatchCompletionWithError:hasMoreChanges:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] we're done!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __70__FPDDomainIndexer__handleOneBatchCompletionWithError_hasMoreChanges___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] scheduling timer expired", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __42__FPDDomainIndexer_sharedSchedulerCanRun___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] already indexing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __42__FPDDomainIndexer_sharedSchedulerCanRun___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_7(&dword_1CF55F000, v0, v1, "[DEBUG] ┏%llx %@: XPC activity granted us some CPU time");
  OUTLINED_FUNCTION_8_0();
}

- (void)_indexOneBatchIfPossibleClearingNeedsIndexing:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] Not indexing - hidden domain", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_indexOneBatchIfPossibleClearingNeedsIndexing:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] waiting for XPC activity before indexing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_indexOneBatchIfPossibleClearingNeedsIndexing:.cold.3()
{
  __assert_rtn("-[FPDDomainIndexer _indexOneBatchIfPossibleClearingNeedsIndexing:]", "FPDDomainIndexer.m", 429, "!_timerSource");
}

- (void)__indexOneBatchIfPossibleClearingNeedsIndexing:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] dropping index", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)__indexOneBatchIfPossibleClearingNeedsIndexing:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] can't index anymore", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)__indexOneBatchIfPossibleClearingNeedsIndexing:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_7(&dword_1CF55F000, v0, v1, "[DEBUG] ┏%llx %@: indexing one batch");
  OUTLINED_FUNCTION_8_0();
}

- (void)__indexOneBatchIfPossibleClearingNeedsIndexing:.cold.6()
{
  __assert_rtn("-[FPDDomainIndexer __indexOneBatchIfPossibleClearingNeedsIndexing:]", "FPDDomainIndexer.m", 455, "!_timerSource");
}

- (void)dropIndexForReason:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] Index was already dropped, reason: %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)dropIndexForReason:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] Dropping index, reason: %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, (uint64_t)v0, "[ERROR] Failed to drop index for domain %@; %@", v1);
  OUTLINED_FUNCTION_8_0();
}

void __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_9_5(&dword_1CF55F000, v0, v1, "[CRIT] Failed to erase client state %@; %@");
  OUTLINED_FUNCTION_8_0();
}

void __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_116_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_19(&dword_1CF55F000, a2, a3, "[CRIT] Failed to erase client state %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_116_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_9_5(&dword_1CF55F000, v0, v1, "[CRIT] Failed verify client state %@; %@");
  OUTLINED_FUNCTION_8_0();
}

- (void)_signalChangesWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] not yet started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_signalChangesWithCompletionHandler:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] we're already indexing in %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

- (void)_signalChangesWithCompletionHandler:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] bypassing throttling after being signaled on %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __55__FPDDomainIndexer_signalChangesWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] indexing is disabled because domain is disabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __55__FPDDomainIndexer_signalChangesWithCompletionHandler___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_7(&dword_1CF55F000, v0, v1, "[DEBUG] ┏%llx %@: a change was signaled");
  OUTLINED_FUNCTION_8_0();
}

@end
