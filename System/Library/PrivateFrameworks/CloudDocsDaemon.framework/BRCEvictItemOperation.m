@implementation BRCEvictItemOperation

- (BRCEvictItemOperation)initWithSession:(id)a3 url:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  BRCEvictItemOperation *v11;
  uint64_t v12;
  brc_task_tracker *tracker;
  void *v14;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "syncContextProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultSyncContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_BRCOperation initWithName:syncContext:sessionContext:](self, "initWithName:syncContext:sessionContext:", CFSTR("evict-item-operation"), v10, v7);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_session, a3);
    brc_task_tracker_create("evict-item");
    v12 = objc_claimAutoreleasedReturnValue();
    tracker = v11->_tracker;
    v11->_tracker = (brc_task_tracker *)v12;

    objc_msgSend(MEMORY[0x1E0C94F88], "br_logout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v11, "setGroup:", v14);

    objc_storeStrong((id *)&v11->_url, a4);
  }

  return v11;
}

- (void)cancel
{
  BRCEvictItemOperation *v3;
  BRCNotificationPipe *pipe;
  BRCNotificationPipe *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRCEvictItemOperation;
  -[_BRCOperation cancel](&v6, sel_cancel);
  brc_task_tracker_cancel(self->_tracker);
  v3 = self;
  objc_sync_enter(v3);
  pipe = v3->_pipe;
  v3->_pipe = 0;
  v5 = pipe;

  objc_sync_exit(v3);
  -[BRCNotificationPipe close](v5, "close");

}

- (void)main
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 552);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] now wait for evictions to be applied under %@%@", (uint8_t *)&v4, 0x16u);
}

void __29__BRCEvictItemOperation_main__block_invoke(uint64_t a1)
{
  BRCURLToItemLookup *v2;
  uint64_t v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id obj;

  v2 = -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:]([BRCURLToItemLookup alloc], "initWithURL:allowAppLibraryRoot:session:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 552), 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  v4 = -[BRCURLToItemLookup resolveAndKeepOpenWithError:](v2, "resolveAndKeepOpenWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    -[BRCURLToItemLookup byIDLocalItem](v2, "byIDLocalItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[BRCURLToItemLookup faultedLocalItem](v2, "faultedLocalItem");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    objc_msgSend(v8, "evictInTask:options:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 560), 5, 0);
  }
  -[BRCURLToItemLookup closePaths](v2, "closePaths");

}

- (void)receiveUpdates:(id)a3 logicalExtensions:(id)a4 physicalExtensions:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSURL *url;
  id obj;
  id v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  NSURL *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v23 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  if (!-[_BRCOperation finishIfCancelled](self, "finishIfCancelled") && !self->_isFinished)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v10;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v27;
      v15 = *MEMORY[0x1E0D11128];
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "attributeForKey:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (!v17 || objc_msgSend(v17, "br_isEqualToNumber:", &unk_1E87D7178))
          {
            v24 = *(_OWORD *)&self->_section.sectionID;
            v25 = *(_QWORD *)&self->_section.line;
            brc_bread_crumbs();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              url = self->_url;
              *(_DWORD *)buf = 134218498;
              v31 = v24;
              v32 = 2112;
              v33 = url;
              v34 = 2112;
              v35 = v19;
              _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx no more items to evict under %@%@", buf, 0x20u);
            }

            v12[2](v12);
            self->_isFinished = 1;
            -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, 0);
            __brc_leave_section((uint64_t *)&v24);

            goto LABEL_16;
          }

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
        if (v13)
          continue;
        break;
      }
    }

    v12[2](v12);
  }
LABEL_16:

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  BRCEvictItemOperation *v6;
  id v7;
  id v8;
  BRCNotificationPipe *pipe;
  BRCNotificationPipe *v10;
  objc_super v11;

  v6 = self;
  v7 = a4;
  v8 = a3;
  objc_sync_enter(v6);
  pipe = v6->_pipe;
  v6->_pipe = 0;
  v10 = pipe;

  objc_sync_exit(v6);
  -[BRCNotificationPipe close](v10, "close");
  brc_task_tracker_cancel(v6->_tracker);
  v11.receiver = v6;
  v11.super_class = (Class)BRCEvictItemOperation;
  -[_BRCFrameworkOperation finishWithResult:error:](&v11, sel_finishWithResult_error_, v8, v7);

}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)receiveProgressUpdates:(id)a3 reply:(id)a4
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *v6;

  v4 = (void (**)(_QWORD))a4;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCEvictItemOperation receiveProgressUpdates:reply:].cold.1((uint64_t)v5, v6);

  v4[2](v4);
}

- (id)evictionCompletionBlock
{
  return objc_getProperty(self, a2, 584, 1);
}

- (void)setEvictionCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 584);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_evictionCompletionBlock, 0);
  objc_storeStrong((id *)&self->_pipe, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)receiveProgressUpdates:(uint64_t)a1 reply:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] receiveProgressUpdates in the evictItemOperation - just calling the reply.%@", (uint8_t *)&v2, 0xCu);
}

@end
