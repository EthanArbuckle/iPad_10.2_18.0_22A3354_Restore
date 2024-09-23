@implementation BRQueryItemProgressObserver

- (BRQueryItemProgressObserver)initWithItem:(id)a3
{
  id v4;
  BRQueryItemProgressObserver *v5;
  uint64_t v6;
  BRQueryItem *item;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRQueryItemProgressObserver;
  v5 = -[BRQueryItemProgressObserver init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    item = v5->_item;
    v5->_item = (BRQueryItem *)v6;

  }
  return v5;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: _subscriber == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (id)description
{
  BRQueryItem *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = self->_item;
  objc_sync_enter(v3);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  -[BRQueryItem fileObjectID](self->_item, "fileObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rawID");
  -[BRQueryItem logicalName](self->_item, "logicalName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p %lld \"%@\">"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v3);
  return v9;
}

- (void)setQueue:(id)a3
{
  OS_dispatch_queue *v5;
  OS_dispatch_queue **p_queue;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v8;

  v5 = (OS_dispatch_queue *)a3;
  queue = self->_queue;
  p_queue = &self->_queue;
  if (queue != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_queue, a3);
    v5 = v8;
  }

}

- (void)_stopObserving
{
  NSProgress *progress;

  -[NSProgress removeObserver:forKeyPath:context:](self->_progress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), self->_item);
  progress = self->_progress;
  self->_progress = 0;

}

- (void)_subscribe
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];

  v3 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __41__BRQueryItemProgressObserver__subscribe__block_invoke;
  v15[3] = &unk_1E3DA4738;
  v15[4] = self;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__BRQueryItemProgressObserver__subscribe__block_invoke_6;
  v13[3] = &unk_1E3DA6BA0;
  v13[4] = self;
  v14 = (id)MEMORY[0x1A1AD85E4](v15, a2);
  v4 = v14;
  v5 = (void *)MEMORY[0x1A1AD85E4](v13);
  -[BRQueryItem url](self->_item, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  fileProgressSubscribeQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __41__BRQueryItemProgressObserver__subscribe__block_invoke_9;
  v10[3] = &unk_1E3DA6BC8;
  v10[4] = self;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

}

void __41__BRQueryItemProgressObserver__subscribe__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__BRQueryItemProgressObserver__subscribe__block_invoke_2;
  block[3] = &unk_1E3DA4738;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __41__BRQueryItemProgressObserver__subscribe__block_invoke_2(uint64_t result)
{
  id *v1;
  void *v2;
  NSObject *v3;

  v1 = (id *)(result + 32);
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 40))
  {
    brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver _subscribe]_block_invoke_2", 84);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __41__BRQueryItemProgressObserver__subscribe__block_invoke_2_cold_1();

    return objc_msgSend(*v1, "_stopObserving");
  }
  return result;
}

id __41__BRQueryItemProgressObserver__subscribe__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver _subscribe]_block_invoke", 89);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v15 = v11;
    v16 = 2112;
    v17 = v3;
    v18 = 2112;
    v19 = v4;
    _os_log_debug_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: received %@%@", buf, 0x20u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 16);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__BRQueryItemProgressObserver__subscribe__block_invoke_7;
  v12[3] = &unk_1E3DA4A70;
  v12[4] = v6;
  v13 = v3;
  v8 = v3;
  dispatch_async(v7, v12);
  v9 = (void *)MEMORY[0x1A1AD85E4](*(_QWORD *)(a1 + 40));

  return v9;
}

void __41__BRQueryItemProgressObserver__subscribe__block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 40))
  {
    v4 = *(void **)(v1 + 32);
    if (v4)
    {
      if ((objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 40)) & 1) != 0)
        return;
      brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver _subscribe]_block_invoke", 100);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __41__BRQueryItemProgressObserver__subscribe__block_invoke_7_cold_1();

      objc_msgSend(*v2, "_stopObserving");
    }
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("fractionCompleted"), 5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CB30C8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *((_BYTE *)*v2 + 41) = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB30E0]);
      }
      else
      {
        brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver _subscribe]_block_invoke", 115);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 138412802;
          v13 = (id)objc_opt_class();
          v14 = 2112;
          v15 = v8;
          v16 = 2112;
          v17 = v9;
          v11 = v13;
          _os_log_impl(&dword_19CBF0000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] can't determine kind of operation (expected: NSString, actual: %@); %@%@",
            (uint8_t *)&v12,
            0x20u);

        }
      }
    }

  }
}

void __41__BRQueryItemProgressObserver__subscribe__block_invoke_9(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v2 = a1[4];
  v3 = *(NSObject **)(v2 + 16);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__BRQueryItemProgressObserver__subscribe__block_invoke_2_10;
  v9[3] = &unk_1E3DA5708;
  v9[4] = v2;
  v9[5] = &v10;
  dispatch_sync(v3, v9);
  if (*((_BYTE *)v11 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "addSubscriberForFileURL:usingBlock:", a1[5], a1[6]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = a1[4];
    if (*(_QWORD *)(v5 + 24))
    {
      brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver _subscribe]_block_invoke", 133);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        __41__BRQueryItemProgressObserver__subscribe__block_invoke_9_cold_1();

      v5 = a1[4];
    }
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v4;

  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __41__BRQueryItemProgressObserver__subscribe__block_invoke_2_10(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

- (void)stop
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] %@: stopping%@");
  OUTLINED_FUNCTION_1();
}

void __35__BRQueryItemProgressObserver_stop__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "_removeSubscriber:");
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 24);
    *(_QWORD *)(v2 + 24) = 0;

  }
}

- (void)start
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: started twice%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSProgress *v13;
  NSObject *queue;
  uint64_t v15;
  NSProgress *v16;
  void *v17;
  NSObject *v18;
  _QWORD block[5];
  NSProgress *v20;
  uint64_t v21;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (self->_item == a6)
  {
    v13 = (NSProgress *)v11;
    if (self->_progress != v13)
    {
      brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver observeValueForKeyPath:ofObject:change:context:]", 180);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[BRQueryItemProgressObserver observeValueForKeyPath:ofObject:change:context:].cold.1();

    }
    -[NSProgress fractionCompleted](v13, "fractionCompleted");
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__BRQueryItemProgressObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E3DA6BF0;
    v21 = v15;
    block[4] = self;
    v20 = v13;
    v16 = v13;
    dispatch_async(queue, block);

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)BRQueryItemProgressObserver;
    -[BRQueryItemProgressObserver observeValueForKeyPath:ofObject:change:context:](&v22, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

uint64_t __78__BRQueryItemProgressObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  __CFString **v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 40))
  {
    v2 = result;
    v3 = *(void **)(v1 + 8);
    if (*(_BYTE *)(v1 + 41))
      v4 = (_QWORD *)MEMORY[0x1E0CB2EF8];
    else
      v4 = (_QWORD *)MEMORY[0x1E0CB2EF0];
    objc_msgSend(v3, "attributeForName:", *v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6 / 100.0;

    v8 = *(double *)(v2 + 48);
    if (round(v8 * 1000.0) != round(v7 * 1000.0))
    {
      brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver observeValueForKeyPath:ofObject:change:context:]_block_invoke", 190);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v14 = *(_QWORD *)(v2 + 32);
        objc_msgSend(*(id *)(v2 + 40), "localizedAdditionalDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412802;
        v21 = v14;
        v22 = 2112;
        v23 = v15;
        v24 = 2112;
        v25 = v9;
        _os_log_debug_impl(&dword_19CBF0000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: changed to %@%@", (uint8_t *)&v20, 0x20u);

      }
      v8 = *(double *)(v2 + 48);
    }
    if (v8 > 1.0)
    {
      brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver observeValueForKeyPath:ofObject:change:context:]_block_invoke", 192);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        __78__BRQueryItemProgressObserver_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_2();

      v8 = *(double *)(v2 + 48);
    }
    if (v8 < 0.0)
    {
      brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver observeValueForKeyPath:ofObject:change:context:]_block_invoke", 193);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        __78__BRQueryItemProgressObserver_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_1();

      v8 = *(double *)(v2 + 48);
    }
    v11 = *(void **)(*(_QWORD *)(v2 + 32) + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8 * 100.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(*(_QWORD *)(v2 + 32) + 41))
      v13 = kBRQueryItemULPercentKey;
    else
      v13 = kBRQueryItemDLPercentKey;
    objc_msgSend(v11, "setAttribute:forKey:", v12, *v13);

    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 48) + 16))();
  }
  return result;
}

- (BRQueryItem)item
{
  return self->_item;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_subscriber, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

void __41__BRQueryItemProgressObserver__subscribe__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] %@: remove observer from unpublished progress%@");
  OUTLINED_FUNCTION_1();
}

void __41__BRQueryItemProgressObserver__subscribe__block_invoke_7_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] %@: remove observer from stale progress%@");
  OUTLINED_FUNCTION_1();
}

void __41__BRQueryItemProgressObserver__subscribe__block_invoke_9_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: self->_subscriber == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: progress == _progress%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__BRQueryItemProgressObserver_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: fractionCompleted >= 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__BRQueryItemProgressObserver_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: fractionCompleted <= 1%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
