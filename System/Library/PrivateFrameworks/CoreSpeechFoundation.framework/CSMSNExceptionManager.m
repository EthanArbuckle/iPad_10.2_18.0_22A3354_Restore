@implementation CSMSNExceptionManager

- (CSMSNExceptionManager)init
{
  CSMSNExceptionManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableDictionary *announceMessageExceptions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSMSNExceptionManager;
  v2 = -[CSMSNExceptionManager init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSMSNExceptionManager Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    announceMessageExceptions = v2->_announceMessageExceptions;
    v2->_announceMessageExceptions = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)beginAnnounceMessageException:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("announcemessage")) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__CSMSNExceptionManager_beginAnnounceMessageException_reason___block_invoke;
    block[3] = &unk_1E6880F00;
    block[4] = self;
    v13 = v6;
    v14 = v8;
    v15 = v7;
    v10 = v8;
    dispatch_async(queue, block);

  }
  else
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[CSMSNExceptionManager beginAnnounceMessageException:reason:]";
      v18 = 2114;
      v19 = v6;
      _os_log_error_impl(&dword_1B502E000, v11, OS_LOG_TYPE_ERROR, "%s Unexpected exception request : %{public}@", buf, 0x16u);
    }
  }

}

- (void)endAnnounceMessageException:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("announcemessage")) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__CSMSNExceptionManager_endAnnounceMessageException_reason___block_invoke;
    block[3] = &unk_1E6880F00;
    block[4] = self;
    v13 = v8;
    v14 = v6;
    v15 = v7;
    v10 = v8;
    dispatch_async(queue, block);

  }
  else
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[CSMSNExceptionManager endAnnounceMessageException:reason:]";
      v18 = 2114;
      v19 = v6;
      _os_log_error_impl(&dword_1B502E000, v11, OS_LOG_TYPE_ERROR, "%s Unexpected exception request : %{public}@", buf, 0x16u);
    }
  }

}

- (NSMutableDictionary)announceMessageExceptions
{
  return self->_announceMessageExceptions;
}

- (void)setAnnounceMessageExceptions:(id)a3
{
  objc_storeStrong((id *)&self->_announceMessageExceptions, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_announceMessageExceptions, 0);
}

void __60__CSMSNExceptionManager_endAnnounceMessageException_reason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BYTE buf[24];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2
    || (objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "intValue"),
        v4,
        v3,
        v5 <= 0))
  {
    v8 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      return;
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSMSNExceptionManager endAnnounceMessageException:reason:]_block_invoke";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v9;
    v10 = "%s There is no cached exception for %{public}@";
    v11 = v8;
    v12 = 22;
    goto LABEL_19;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  if (v7 > 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v7 - 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v13, *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v14 || !objc_msgSend(v14, "count"))
  {
    v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CSMSNExceptionManager endAnnounceMessageException:reason:]_block_invoke";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEFAULT, "%s Calling MSN end announce message exception for %{public}@", buf, 0x16u);
    }
    v17 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String");
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v18 = getMSNMonitorEndExceptionSymbolLoc_ptr;
    v24 = getMSNMonitorEndExceptionSymbolLoc_ptr;
    if (!getMSNMonitorEndExceptionSymbolLoc_ptr)
    {
      v19 = (void *)MediaSafetyNetLibrary();
      v18 = dlsym(v19, "MSNMonitorEndException");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v18;
      getMSNMonitorEndExceptionSymbolLoc_ptr = v18;
    }
    _Block_object_dispose(buf, 8);
    if (!v18)
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
    ((void (*)(uint64_t))v18)(v17);
  }
  v20 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v22 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[CSMSNExceptionManager endAnnounceMessageException:reason:]_block_invoke";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 2114;
    v24 = v22;
    v10 = "%s Updated announce message exception table : %{public}@, reason : %{public}@";
    v11 = v20;
    v12 = 32;
LABEL_19:
    _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
  }
}

void __62__CSMSNExceptionManager_beginAnnounceMessageException_reason___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  _BYTE buf[24];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2 || !objc_msgSend(v2, "count"))
  {
    v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CSMSNExceptionManager beginAnnounceMessageException:reason:]_block_invoke";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Calling MSN begin announce message exception for %{public}@", buf, 0x16u);
    }
    v5 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v6 = getMSNMonitorBeginExceptionSymbolLoc_ptr;
    v19 = getMSNMonitorBeginExceptionSymbolLoc_ptr;
    if (!getMSNMonitorBeginExceptionSymbolLoc_ptr)
    {
      v7 = (void *)MediaSafetyNetLibrary();
      v6 = dlsym(v7, "MSNMonitorBeginException");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v6;
      getMSNMonitorBeginExceptionSymbolLoc_ptr = v6;
    }
    _Block_object_dispose(buf, 8);
    if (!v6)
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
    ((void (*)(uint64_t))v6)(v5);
  }
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v8
    || (objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48)),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = v9 == 0,
        v9,
        v10))
  {
    v13 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");

    v13 = (v12 + 1);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v14, *(_QWORD *)(a1 + 48));

  v15 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v17 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[CSMSNExceptionManager beginAnnounceMessageException:reason:]_block_invoke";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2114;
    v19 = v17;
    _os_log_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEFAULT, "%s Updated announce message exception table : %{public}@, reason : %{public}@", buf, 0x20u);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11373 != -1)
    dispatch_once(&sharedInstance_onceToken_11373, &__block_literal_global_11374);
  return (id)sharedInstance_sharedInstance_11375;
}

void __39__CSMSNExceptionManager_sharedInstance__block_invoke()
{
  CSMSNExceptionManager *v0;
  void *v1;

  v0 = objc_alloc_init(CSMSNExceptionManager);
  v1 = (void *)sharedInstance_sharedInstance_11375;
  sharedInstance_sharedInstance_11375 = (uint64_t)v0;

}

@end
