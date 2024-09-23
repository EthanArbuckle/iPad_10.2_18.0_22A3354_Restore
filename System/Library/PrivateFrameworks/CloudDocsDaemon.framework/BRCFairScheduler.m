@implementation BRCFairScheduler

- (BRCFairScheduler)initWithWorkloop:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  BRCFairScheduler *v9;
  BRCFairScheduler *v10;
  dispatch_source_t v11;
  OS_dispatch_source *source;
  uint64_t v13;
  NSMutableDictionary *sourceForBitIndex;
  OS_dispatch_source *v15;
  OS_dispatch_source *v16;
  _QWORD *v17;
  NSObject *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  dispatch_block_t v22;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)BRCFairScheduler;
  v9 = -[BRCFairScheduler init](&v27, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workloop, a3);
    objc_storeStrong((id *)&v10->_name, a4);
    v11 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, (dispatch_queue_t)v10->_workloop);
    source = v10->_source;
    v10->_source = (OS_dispatch_source *)v11;

    v13 = objc_opt_new();
    sourceForBitIndex = v10->_sourceForBitIndex;
    v10->_sourceForBitIndex = (NSMutableDictionary *)v13;

    objc_initWeak(&location, v10);
    v15 = v10->_source;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __42__BRCFairScheduler_initWithWorkloop_name___block_invoke;
    v24[3] = &unk_1E875DC98;
    objc_copyWeak(&v25, &location);
    v16 = v15;
    v17 = v24;
    v18 = v16;
    v19 = v17;
    v20 = v19;
    v21 = v19;
    if (*MEMORY[0x1E0D11070])
    {
      ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v21);
    dispatch_source_set_event_handler(v18, v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __42__BRCFairScheduler_initWithWorkloop_name___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "schedule");

}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (void)addSource:(id)a3
{
  BRCFairScheduler *v4;
  NSMutableDictionary *sourceForBitIndex;
  void *v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  _QWORD *v12;
  uint8_t buf[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  sourceForBitIndex = v4->_sourceForBitIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v4->_maxRegistedSourceBit);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](sourceForBitIndex, "setObject:forKeyedSubscript:", v12, v6);

  v12[1] = v4->_maxRegistedSourceBit;
  v7 = v4->_maxRegistedSourceBit + 1;
  v4->_maxRegistedSourceBit = v7;
  if (v7 >= 0x41)
  {
    abc_report_panic_with_signature();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("too many registered source"));
    objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      brc_append_system_info_to_message();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCFairScheduler addSource:].cold.1(v10, (uint64_t)v8, buf, v9);
    }

    brc_append_system_info_to_message();
    v11 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    __assert_rtn("-[BRCFairScheduler addSource:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/foundation/BRCFairScheduler.m", 61, v11);
  }
  objc_sync_exit(v4);

}

- (void)unregisterSources
{
  NSMutableDictionary *sourceForBitIndex;
  BRCFairScheduler *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_maxRegistedSourceBit = 0;
  sourceForBitIndex = obj->_sourceForBitIndex;
  obj->_sourceForBitIndex = 0;

  objc_sync_exit(obj);
}

- (id)sourceForBitIndex:(unint64_t)a3
{
  BRCFairScheduler *v4;
  NSMutableDictionary *sourceForBitIndex;
  void *v6;
  void *v7;

  v4 = self;
  objc_sync_enter(v4);
  sourceForBitIndex = v4->_sourceForBitIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sourceForBitIndex, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  return v7;
}

- (void)signalSourceForBitIndex:(unint64_t)a3
{
  dispatch_source_merge_data((dispatch_source_t)self->_source, 1 << a3);
}

- (void)schedule
{
  NSObject *source;
  uintptr_t data;
  uintptr_t v5;
  unint64_t v6;
  int i;
  void *v8;
  uintptr_t v9;
  OS_dispatch_workloop *v10;
  OS_dispatch_workloop *workloop;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  BRCFairScheduler *v15;
  uintptr_t v16;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workloop);
  source = self->_source;
  data = dispatch_source_get_data(source);
  if (data)
  {
    v5 = data;
    dispatch_suspend(source);
    v6 = self->_lastVisitedBit + 1;
    for (i = 1 << v6; (v5 & (1 << v6)) == 0; i = 1 << v6)
      v6 = (v6 + 1) % self->_maxRegistedSourceBit;
    self->_lastVisitedBit = v6;
    -[BRCFairScheduler sourceForBitIndex:](self, "sourceForBitIndex:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5 & ~i;
    objc_msgSend(v8, "workloop");
    v10 = (OS_dispatch_workloop *)objc_claimAutoreleasedReturnValue();
    workloop = self->_workloop;

    if (v10 == workloop)
    {
      objc_msgSend(v8, "_runEventHandler");
      dispatch_resume((dispatch_object_t)self->_source);
      if (v9)
        dispatch_source_merge_data((dispatch_source_t)self->_source, v9);
    }
    else
    {
      objc_msgSend(v8, "workloop");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __28__BRCFairScheduler_schedule__block_invoke;
      block[3] = &unk_1E875E038;
      v14 = v8;
      v15 = self;
      v16 = v9;
      dispatch_async(v12, block);

    }
  }
}

void __28__BRCFairScheduler_schedule__block_invoke(uint64_t a1)
{
  uintptr_t v2;

  objc_msgSend(*(id *)(a1 + 32), "_runEventHandler");
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 40) + 8));
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    dispatch_source_merge_data(*(dispatch_source_t *)(*(_QWORD *)(a1 + 40) + 8), v2);
}

- (void)resume
{
  dispatch_resume((dispatch_object_t)self->_source);
  self->_resumed = 1;
}

- (void)suspend
{
  dispatch_suspend((dispatch_object_t)self->_source);
  self->_resumed = 0;
}

- (void)cancel
{
  dispatch_source_cancel((dispatch_source_t)self->_source);
  dispatch_activate((dispatch_object_t)self->_source);
  -[BRCFairScheduler unregisterSources](self, "unregisterSources");
}

- (void)close
{
  NSObject *workloop;
  _QWORD block[5];

  workloop = self->_workloop;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__BRCFairScheduler_close__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_async_and_wait(workloop, block);
}

uint64_t __25__BRCFairScheduler_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_resumed)
    dispatch_activate((dispatch_object_t)self->_source);
  v3.receiver = self;
  v3.super_class = (Class)BRCFairScheduler;
  -[BRCFairScheduler dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceForBitIndex, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)addSource:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1CBD43000, log, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", buf, 0x16u);

}

@end
