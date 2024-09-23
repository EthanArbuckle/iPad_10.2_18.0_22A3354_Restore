@implementation BRNotificationReceiver

- (BRNotificationReceiver)init
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  BRNotificationQueue *v12;
  void *v13;
  dispatch_source_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t *v22;
  NSObject *v23;
  uint64_t *v24;
  uint64_t *v25;
  void *v26;
  dispatch_block_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  id location;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)BRNotificationReceiver;
  v2 = -[BRNotificationReceiver init](&v40, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.br.notifs-receiver", v4);

    v6 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v5;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *((_QWORD *)v2 + 1);
    dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create_with_target_V2("com.apple.br.notifs-receiver.ipc", v9, v8);

    v11 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v10;

    v12 = objc_alloc_init(BRNotificationQueue);
    v13 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v12;

    v14 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, *((dispatch_queue_t *)v2 + 1));
    v15 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v14;

    if (!*((_QWORD *)v2 + 7))
    {
      brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver init]", 47);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        -[BRNotificationReceiver init].cold.1();

    }
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = (void *)*((_QWORD *)v2 + 13);
    *((_QWORD *)v2 + 13) = v16;

    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v19 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v18;

    objc_initWeak(&location, v2);
    v20 = (void *)*((_QWORD *)v2 + 7);
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __30__BRNotificationReceiver_init__block_invoke;
    v37 = &unk_1E3DA5870;
    objc_copyWeak(&v38, &location);
    v21 = v20;
    v22 = &v34;
    v23 = v21;
    v24 = v22;
    v25 = v24;
    v26 = v24;
    if (brc_block_remember_persona)
    {
      brc_block_remember_persona(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v27 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v26);
    dispatch_source_set_event_handler(v23, v27);

    *((_DWORD *)v2 + 31) = -1;
    atomic_store(1u, (unsigned int *)v2 + 30);
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager", v34, v35, v36, v37);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "br_currentPersonaID");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)*((_QWORD *)v2 + 18);
    *((_QWORD *)v2 + 18) = v29;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  return (BRNotificationReceiver *)v2;
}

void __30__BRNotificationReceiver_init__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  BOOL v6;
  void *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_msgSend(WeakRetained[3], "count");
    v2 = v8;
    if (v3)
    {
      dispatch_assert_queue_V2((dispatch_queue_t)v8[1]);
      v8[12] = (id)brc_monotonic_time_now();
      objc_msgSend(v8[6], "notificationsReceiverDidReceiveNotificationsBatch:", v8);
      v2 = v8;
      v4 = v8[9];
      v5 = v8[10];
      v6 = v4 >= v5;
      v7 = (void *)(v4 - v5);
      if (v6)
        v8[9] = v7;
    }
  }
  objc_msgSend(v2, "_signalSourceIfNeeded");

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
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: _timer == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (unint64_t)pendingCount
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__BRNotificationReceiver_pendingCount__block_invoke;
  v5[3] = &unk_1E3DA5708;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__BRNotificationReceiver_pendingCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)dequeue:(unint64_t)a3 block:(id)a4
{
  NSObject *queue;
  id v7;

  queue = self->_queue;
  v7 = a4;
  dispatch_assert_queue_V2(queue);
  -[BRNotificationQueue dequeue:block:](self->_notifs, "dequeue:block:", a3, v7);

}

- (id)_obtainNotificationSenderFromDaemon
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  NSObject *accountTokenDidChangeNotificationObserver;
  id v21;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  BRNotificationReceiver *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newSyncProxy");

  v5 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke;
  v24[3] = &unk_1E3DA58B8;
  v6 = v4;
  v25 = v6;
  v26 = self;
  objc_msgSend(v6, "getItemUpdateSenderWithReceiver:reply:", self, v24);
  objc_msgSend(v6, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_storeStrong((id *)&self->_sender, v7);
    objc_msgSend(v7, "boostPriority:", &__block_literal_global_18);
  }
  else
  {
    objc_msgSend(v6, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "br_isCloudDocsErrorCode:", 2);

      if (v10)
      {
        brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]", 151);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v11;
          _os_log_impl(&dword_19CBF0000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] cannot query iCloud Drive items because we are logged out%@", buf, 0xCu);
        }
      }
      else
      {
        brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]", 153);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
          -[BRNotificationReceiver _obtainNotificationSenderFromDaemon].cold.2(v6, (uint64_t)v11, v12);
      }

      objc_msgSend(v6, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("BRCloudDocsErrorDomain"));

      if (v17)
        -[BRNotificationReceiverDelegate notificationsReceiverDidFinishGathering:](self->_delegate, "notificationsReceiverDidFinishGathering:", self);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v5;
      v23[1] = 3221225472;
      v23[2] = __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_20;
      v23[3] = &unk_1E3DA5900;
      v23[4] = self;
      objc_msgSend(v18, "addObserverForName:object:queue:usingBlock:", CFSTR("BRAccountTokenDidChangeNotification"), 0, 0, v23);
      v19 = objc_claimAutoreleasedReturnValue();
      accountTokenDidChangeNotificationObserver = self->_accountTokenDidChangeNotificationObserver;
      self->_accountTokenDidChangeNotificationObserver = v19;

    }
    else
    {
      brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]", 176);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[BRNotificationReceiver _obtainNotificationSenderFromDaemon].cold.1();

    }
  }
  v21 = v7;

  return v21;
}

void __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v7 = a3;
  v8 = a4;
  v9 = a2;
  brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 113);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_cold_1();

  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_14);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_14;
  v14[3] = &unk_1E3DA47F0;
  v12 = *(void **)(a1 + 32);
  v14[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObjResult:error:", v13, v8);
}

void __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v6 = 0;
  }
  if (BRCurrentProcessIsOwningContainerWithID(v4))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[BRContainer versionOfBundle:changedFromVersion:](BRContainer, "versionOfBundle:changedFromVersion:", v7, v6);

    if (v8)
    {
      +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "newSyncProxy");

      objc_msgSend(v10, "updateContainerMetadataForID:", v4);
    }
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("extension"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_retainAutorelease(v11);
    objc_msgSend(v12, "bytes");
    if (sandbox_extension_consume() < 0)
    {
      v13 = *__error();
      brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 133);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        v16 = 138412802;
        v17 = v12;
        v18 = 1024;
        v19 = v13;
        v20 = 2112;
        v21 = v14;
        _os_log_error_impl(&dword_19CBF0000, v15, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", (uint8_t *)&v16, 0x1Cu);
      }

      *__error() = v13;
    }
  }

}

void __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[3];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  memset(v7, 0, sizeof(v7));
  __brc_create_section(0, (uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 139, v7);
  brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 139);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v7[0];
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_debug_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@ got error %@%@", buf, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  __brc_leave_section((uint64_t)v7);

}

void __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  uint8_t buf[24];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "isEqualToString:", CFSTR("__defaultPersonaID__")) & 1) != 0
    || (v4 = *(id *)(*(_QWORD *)(a1 + 32) + 144)) == 0)
  {
    if (_block_invoke___personaOnceToken_0 != -1)
      dispatch_once(&_block_invoke___personaOnceToken_0, &__block_literal_global_22);
    v5 = (id)_block_invoke___personalPersona_0;
    v6 = 1;
  }
  else
  {
    v5 = v4;
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPersona");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  objc_msgSend(v8, "userPersonaUniqueString");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 == v5 || (objc_msgSend(v9, "isEqualToString:", v5) & 1) != 0)
  {
    v11 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v24 = 0;
    v14 = (void *)objc_msgSend(v8, "copyCurrentPersonaContextWithError:", &v24);
    v15 = v24;
    v16 = v25;
    v25 = v14;

    if (v15)
    {
      brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 171);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
        -[BRAccount containerWithPendingChanges].cold.3();

    }
    objc_msgSend(v8, "generateAndRestorePersonaContextWithPersonaUniqueString:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 171);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      {
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2112;
        v27 = v19;
        _os_log_error_impl(&dword_19CBF0000, v20, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:

    }
  }
  else
  {
    if (v6 && (objc_msgSend(v8, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 171);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[BRAccount containerWithPendingChanges].cold.5();
      v11 = 0;
      goto LABEL_29;
    }
    brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 171);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[BRAccount containerWithPendingChanges].cold.4();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  memset(buf, 0, sizeof(buf));
  __brc_create_section(0, (uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 172, buf);
  brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _obtainNotificationSenderFromDaemon]_block_invoke", 172);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_20_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  __brc_leave_section((uint64_t)buf);

  _BRRestorePersona(&v25);
}

void __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke___personalPersona_0;
  _block_invoke___personalPersona_0 = v0;

}

- (void)_watchUbiquitousScopes:(id)a3 bundleID:(id)a4 predicate:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  __int16 v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  id *v29;
  uint64_t v30;
  void *v31;
  int active_platform;
  uint64_t v33;
  void *v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  unsigned int v42;
  uint64_t v43;
  void *v44;
  _QWORD *v45;
  int v46;
  int v47;
  int v48;
  unsigned int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  const char *v54;
  int *v55;
  OS_dispatch_queue *queue;
  id v57;
  NSObject *v58;
  _QWORD *v59;
  void *v60;
  void *v61;
  id v62;
  _QWORD *v63;
  NSObject *v64;
  id v65;
  void *v66;
  NSObject *v67;
  BRNotificationReceiver *v68;
  void *v69;
  id v70;
  id v71;
  __int16 v72;
  void *v73;
  os_log_t oslog;
  uint64_t v75;
  void *v76;
  int v77;
  _QWORD block[4];
  id v79;
  BRNotificationReceiver *v80;
  uint64_t *v81;
  _QWORD v82[4];
  id v83;
  BRNotificationReceiver *v84;
  uint64_t *v85;
  uint64_t v86;
  int *v87;
  uint64_t v88;
  int v89;
  _QWORD v90[5];
  id v91;
  _QWORD v92[5];
  id v93;
  _QWORD v94[4];
  void *v95[2];
  id v96;
  uint64_t *v97;
  __int16 v98;
  _QWORD v99[5];
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE handler[24];
  void *v112;
  id v113;
  id v114;
  const char *v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v70 = a4;
  v71 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v69 = v8;
  if (!self->_sender)
  {
    v68 = self;
    -[BRNotificationReceiver resume](self, "resume");
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v106, v110, 16);
    if (v10)
    {
      v72 = 0;
      v73 = 0;
      oslog = 0;
      v77 = 0;
      v11 = 0;
      v12 = 0;
      v13 = *(_QWORD *)v107;
      v14 = *MEMORY[0x1E0CB2E58];
      v15 = *MEMORY[0x1E0CB2E60];
      v16 = *MEMORY[0x1E0CB2E30];
      v75 = *MEMORY[0x1E0CB2E48];
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v107 != v13)
            objc_enumerationMutation(v9);
          v18 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v17);
          if ((objc_msgSend(v18, "isEqual:", v14) & 1) != 0)
          {
            v12 = 1;
          }
          else if ((objc_msgSend(v18, "isEqual:", v15) & 1) != 0)
          {
            v11 = 1;
          }
          else if ((objc_msgSend(v18, "isEqual:", v16) & 1) != 0 || (objc_msgSend(v18, "isEqual:", v75) & 1) != 0)
          {
            v77 = 1;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (oslog)
              {
                brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]", 233);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log(0);
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
                  -[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:].cold.1();
LABEL_41:

                goto LABEL_111;
              }
              oslog = v18;
              v72 = 10;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]", 247);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log(0);
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
                  -[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:].cold.4();
                goto LABEL_41;
              }
              v19 = v73;
              if (!v73)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v73 = v19;
              objc_msgSend(v19, "addObject:", v18);
            }
          }
          ++v17;
        }
        while (v10 != v17);
        v20 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v106, v110, 16);
        v10 = v20;
      }
      while (v20);
    }
    else
    {
      v72 = 0;
      v73 = 0;
      oslog = 0;
      v77 = 0;
      v11 = 0;
      v12 = 0;
    }

    if ((dyld_get_active_platform() & 0xFFFFFFFB) == 2
      && (dyld_program_sdk_at_least() & 1) == 0
      && !(v77 & 1 | (((v12 | v11) & 1) == 0)))
    {
      brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]", 258);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:].cold.2();

      v77 = 1;
    }
    v100 = 0;
    v101 = &v100;
    v102 = 0x3032000000;
    v103 = __Block_byref_object_copy__5;
    v104 = __Block_byref_object_dispose__5;
    v105 = 0;
    v99[0] = MEMORY[0x1E0C809B0];
    v99[1] = 3221225472;
    v99[2] = __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke;
    v99[3] = &unk_1E3DA47F0;
    v99[4] = v68;
    v76 = (void *)MEMORY[0x1A1AD85E4](v99);
    if ((v11 & v12 & 1) != 0)
    {
      objc_msgSend(v71, "br_watchedURL");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = 9;
      }
      else
      {
        objc_msgSend(v71, "br_urlWithWatchedChildren");
        v23 = objc_claimAutoreleasedReturnValue();
        if (!v23)
          goto LABEL_49;
        v24 = 10;
      }
      v72 = v24;
      if (oslog)
      {
        brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]", 294);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
          -[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:].cold.1();

        goto LABEL_110;
      }
      oslog = v23;
    }
LABEL_49:
    if ((v11 & 1) != 0)
    {
      objc_msgSend(v71, "extractSearchTermFromPredicate");
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    if (oslog)
    {
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_29;
      v94[3] = &unk_1E3DA5928;
      v97 = &v100;
      v95[0] = oslog;
      v95[1] = v68;
      v98 = v72;
      v96 = v76;
      BRPerformWithPersonaAndErrorForURLIfAble(v95[0], v94);

      v29 = v95;
LABEL_104:

LABEL_105:
      if (v68->_sender)
      {
        v86 = 0;
        v87 = (int *)&v86;
        v88 = 0x2020000000;
        v89 = 0;
        BRNotificationNameForServerAvailabilityChanges();
        v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v54 = (const char *)objc_msgSend(v53, "UTF8String");
        v55 = v87;
        queue = v68->_queue;
        v82[0] = MEMORY[0x1E0C809B0];
        v82[1] = 3221225472;
        v82[2] = __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_34;
        v82[3] = &unk_1E3DA5950;
        v85 = &v86;
        v57 = v53;
        v83 = v57;
        v84 = v68;
        v58 = queue;
        v59 = v82;
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "br_currentPersonaID");
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)handler = MEMORY[0x1E0C809B0];
        *(_QWORD *)&handler[8] = 3221225472;
        *(_QWORD *)&handler[16] = __br_notify_register_dispatch_block_invoke_2;
        v112 = &unk_1E3DA49A8;
        v62 = v61;
        v113 = v62;
        v115 = v54;
        v63 = v59;
        v114 = v63;
        notify_register_dispatch(v54, v55 + 6, v58, handler);

        v68->_networkReachabilityToken = v87[6];
        v64 = v68->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_2;
        block[3] = &unk_1E3DA5978;
        v80 = v68;
        v81 = &v86;
        v79 = v57;
        v65 = v57;
        dispatch_async(v64, block);

        _Block_object_dispose(&v86, 8);
      }
      else
      {
        brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]", 379);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)handler = 138412546;
          *(_QWORD *)&handler[4] = v9;
          *(_WORD *)&handler[12] = 2112;
          *(_QWORD *)&handler[14] = v66;
          _os_log_impl(&dword_19CBF0000, v67, OS_LOG_TYPE_DEFAULT, "[WARNING] This NSMetadataQuery did not watch anything (scopes: %@)%@", handler, 0x16u);
        }

      }
      goto LABEL_110;
    }
    if (-[NSObject length](v23, "length"))
    {
      -[BRNotificationReceiver _obtainNotificationSenderFromDaemon](v68, "_obtainNotificationSenderFromDaemon");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v101[5];
      v101[5] = v30;

      if (v101[5])
      {
        active_platform = dyld_get_active_platform();
        if ((active_platform & 0xFFFFFFFB) == 2 || active_platform == 1 || active_platform == 11)
        {
          if (!dyld_program_sdk_at_least())
          {
            v38 = 1;
            goto LABEL_75;
          }
        }
        else
        {
          syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
        }
        v38 = 9;
LABEL_75:
        v39 = dyld_get_active_platform();
        if ((v39 & 0xFFFFFFFB) == 2 || v39 == 1 || v39 == 11)
        {
          v40 = dyld_program_sdk_at_least();
        }
        else
        {
          syslog(5, "Unknown platform linking against CloudDocs framework %d", v39);
          v40 = 1;
        }
        v41 = objc_msgSend(v71, "isFolderOnlyPredicate");
        v42 = v38 | 0x10;
        if (!v40)
          v42 = v38;
        if (v41)
          v43 = v42 | 0x40;
        else
          v43 = v42;
        v44 = (void *)v101[5];
        v92[0] = MEMORY[0x1E0C809B0];
        v92[1] = 3221225472;
        v92[2] = __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_32;
        v92[3] = &unk_1E3DA51A0;
        v45 = v92;
        v92[4] = v9;
        v93 = v76;
        objc_msgSend(v44, "watchItemsNamesPrefixedBy:inScopes:appLibraryIDs:gatherReply:", v23, v43, v73, v92);

LABEL_103:
        v29 = (id *)(v45 + 4);
        goto LABEL_104;
      }
LABEL_110:

      _Block_object_dispose(&v100, 8);
      goto LABEL_111;
    }
    if (((v11 | v12 | v77) & 1) == 0)
      goto LABEL_105;
    -[BRNotificationReceiver _obtainNotificationSenderFromDaemon](v68, "_obtainNotificationSenderFromDaemon");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v101[5];
    v101[5] = v33;

    if (!v101[5])
      goto LABEL_110;
    v35 = v11;
    if ((v12 & 1) != 0)
      v35 = v11 & 1 | 2;
    if ((v77 & 1) != 0)
      v36 = v35 | 4;
    else
      v36 = v35;
    v37 = dyld_get_active_platform();
    if ((v37 & 0xFFFFFFFB) == 2 || v37 == 1 || v37 == 11)
    {
      if (!dyld_program_sdk_at_least())
      {
LABEL_90:
        v46 = dyld_get_active_platform();
        if ((v46 & 0xFFFFFFFB) == 2 || v46 == 1 || v46 == 11)
        {
          v47 = dyld_program_sdk_at_least();
        }
        else
        {
          syslog(5, "Unknown platform linking against CloudDocs framework %d", v46);
          v47 = 1;
        }
        v48 = objc_msgSend(v71, "isFolderOnlyPredicate");
        v49 = v36 | 0x10;
        if (!v47)
          v49 = v36;
        if (v48)
          v50 = v49 | 0x40;
        else
          v50 = v49;
        v90[0] = MEMORY[0x1E0C809B0];
        v90[1] = 3221225472;
        v90[2] = __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_33;
        v90[3] = &unk_1E3DA51A0;
        v45 = v90;
        v90[4] = v9;
        v91 = v76;
        v51 = (void *)MEMORY[0x1A1AD85E4](v90);
        v52 = (void *)v101[5];
        if (v73)
          objc_msgSend(v52, "watchScopes:appLibraryIDs:gatherReply:", v50, v73, v51);
        else
          objc_msgSend(v52, "watchScopes:gatherReply:", v50, v51);

        goto LABEL_103;
      }
    }
    else
    {
      syslog(5, "Unknown platform linking against CloudDocs framework %d", v37);
    }
    v36 |= 8u;
    goto LABEL_90;
  }
  brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]", 197);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    -[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:].cold.5();
LABEL_111:

}

void __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]_block_invoke", 268);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] gathering failed: %@%@", buf, 0x16u);
    }
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]_block_invoke", 270);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_cold_1();
  }

  v6 = objc_msgSend(v3, "br_isPOSIXErrorCode:", 4);
  v7 = *(_QWORD **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v7, "invalidate");
  }
  else
  {
    v8 = v7[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_28;
    block[3] = &unk_1E3DA4738;
    block[4] = v7;
    dispatch_async(v8, block);
  }

}

uint64_t __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_28(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "notificationsReceiverDidFinishGathering:");
}

void __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_29(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a2;
  v8 = a5;
  if (v8)
  {
    brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]_block_invoke", 307);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_29_cold_2();

  }
  if (objc_msgSend(*(id *)(a1 + 32), "br_isInSyncedLocation"))
  {
    if (v7)
    {
      brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]_block_invoke", 315);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_29_cold_1();

    }
    objc_msgSend(*(id *)(a1 + 40), "_obtainNotificationSenderFromDaemon");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v17 = *(void **)(a1 + 32);
    v18 = *(unsigned __int16 *)(a1 + 64);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_30;
    v19[3] = &unk_1E3DA51A0;
    v20 = v17;
    v21 = *(id *)(a1 + 48);
    objc_msgSend(v16, "watchItemAtURL:options:gatherReply:", v20, v18, v19);

  }
}

void __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "br_isPOSIXErrorCode:", 4))
  {
    brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]_block_invoke", 323);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] The gathering phase for children of '%@' failed: %@%@", (uint8_t *)&v7, 0x20u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "br_isPOSIXErrorCode:", 4))
  {
    brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]_block_invoke", 342);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] The gathering phase for scopes %@ failed: %@%@", (uint8_t *)&v7, 0x20u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "br_isPOSIXErrorCode:", 4))
  {
    brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _watchUbiquitousScopes:bundleID:predicate:]_block_invoke", 367);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] The gathering phase for scopes %@ failed: %@%@", (uint8_t *)&v7, 0x20u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_34(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) == a2)
  {
    v2 = result;
    v3 = 1;
    brc_notify_get_state(a2, &v3, objc_msgSend(objc_retainAutorelease(*(id *)(result + 32)), "UTF8String"));
    return objc_msgSend(*(id *)(v2 + 40), "networkDidChangeReachabilityStatusTo:", v3 != 0);
  }
  return result;
}

uint64_t __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_2(uint64_t a1)
{
  uint64_t v3;

  v3 = 1;
  brc_notify_get_state(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), &v3, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
  return objc_msgSend(*(id *)(a1 + 40), "networkDidChangeReachabilityStatusTo:", v3 != 0);
}

- (void)watchUbiquitousScopes:(id)a3 bundleID:(id)a4 predicate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__BRNotificationReceiver_watchUbiquitousScopes_bundleID_predicate___block_invoke;
  v15[3] = &unk_1E3DA59A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

uint64_t __67__BRNotificationReceiver_watchUbiquitousScopes_bundleID_predicate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_watchUbiquitousScopes:bundleID:predicate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)suspend
{
  int *p_suspendCount;
  unsigned int v4;
  void *v5;
  NSObject *v6;
  int v7;
  BRNotificationReceiver *v8;
  __int16 v9;
  unsigned int v10;
  __int16 v11;
  unsigned int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_suspendCount = &self->_suspendCount;
  do
    v4 = __ldaxr((unsigned int *)p_suspendCount);
  while (__stlxr(v4 + 1, (unsigned int *)p_suspendCount));
  if (!v4)
    dispatch_suspend((dispatch_object_t)self->_source);
  brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver suspend]", 419);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138413058;
    v8 = self;
    v9 = 1024;
    v10 = v4;
    v11 = 1024;
    v12 = v4 + 1;
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: suspended (%d->%d)%@", (uint8_t *)&v7, 0x22u);
  }

}

- (void)resume
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: suspendCount >= 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)flush
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__BRNotificationReceiver_flush__block_invoke;
  block[3] = &unk_1E3DA4738;
  block[4] = self;
  dispatch_sync(queue, block);
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_36);
}

void __31__BRNotificationReceiver_flush__block_invoke(uint64_t a1)
{
  dispatch_source_merge_data(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 56), 1uLL);
}

- (void)_invalidateAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *accountTokenDidChangeNotificationObserver;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int networkReachabilityToken;
  BRItemNotificationSending *sender;
  BRNotificationReceiverDelegate *v14;
  NSObject *ipcQueue;
  NSObject *timer;
  OS_dispatch_source *v17;
  _QWORD v18[4];
  BRNotificationReceiverDelegate *v19;
  BRNotificationReceiver *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_accountTokenDidChangeNotificationObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self->_accountTokenDidChangeNotificationObserver);

    accountTokenDidChangeNotificationObserver = self->_accountTokenDidChangeNotificationObserver;
    self->_accountTokenDidChangeNotificationObserver = 0;

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableDictionary allValues](self->_progressObserverByID, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "stop");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  -[NSMutableDictionary removeAllObjects](self->_progressObserverByID, "removeAllObjects");
  if (!self->_isInvalidated)
  {
    networkReachabilityToken = self->_networkReachabilityToken;
    if (networkReachabilityToken != -1)
      notify_cancel(networkReachabilityToken);
    -[BRItemNotificationSending invalidate](self->_sender, "invalidate");
    sender = self->_sender;
    self->_sender = 0;

    self->_isInvalidated = 1;
    v14 = self->_delegate;
    -[BRNotificationReceiver setDelegate:](self, "setDelegate:", 0);
    if (v3)
    {
      ipcQueue = self->_ipcQueue;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __47__BRNotificationReceiver__invalidateAndNotify___block_invoke;
      v18[3] = &unk_1E3DA4A70;
      v19 = v14;
      v20 = self;
      dispatch_async(ipcQueue, v18);

    }
    timer = self->_timer;
    if (timer)
    {
      dispatch_source_cancel(timer);
      v17 = self->_timer;
      self->_timer = 0;

    }
    dispatch_source_cancel((dispatch_source_t)self->_source);

  }
}

uint64_t __47__BRNotificationReceiver__invalidateAndNotify___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notificationsReceiverDidInvalidate:", *(_QWORD *)(a1 + 40));
}

- (void)invalidateAndNotify:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  NSObject *queue;
  _QWORD block[5];
  BOOL v9;
  _QWORD v10[3];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  BRNotificationReceiver *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_isInvalidated)
  {
    memset(v10, 0, sizeof(v10));
    __brc_create_section(0, (uint64_t)"-[BRNotificationReceiver invalidateAndNotify:]", 492, v10);
    brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver invalidateAndNotify:]", 492);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v12 = v10[0];
      v13 = 2112;
      v14 = self;
      v15 = 2112;
      v16 = v5;
      _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx invalidating notifications from %@%@", buf, 0x20u);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__BRNotificationReceiver_invalidateAndNotify___block_invoke;
    block[3] = &unk_1E3DA59E8;
    block[4] = self;
    v9 = a3;
    dispatch_sync(queue, block);
    __brc_leave_section((uint64_t)v10);
  }
}

uint64_t __46__BRNotificationReceiver_invalidateAndNotify___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAndNotify:", *(unsigned __int8 *)(a1 + 40));
}

- (void)invalidate
{
  -[BRNotificationReceiver invalidateAndNotify:](self, "invalidateAndNotify:", 1);
}

- (void)invalidateAndDontNotifyDelegate
{
  -[BRNotificationReceiver invalidateAndNotify:](self, "invalidateAndNotify:", 0);
}

- (void)_signalSourceIfNeeded
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] %@ notify delegate now%@");
  OUTLINED_FUNCTION_1();
}

void __47__BRNotificationReceiver__signalSourceIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[3];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(v9, 0, sizeof(v9));
  __brc_create_section(0, (uint64_t)"-[BRNotificationReceiver _signalSourceIfNeeded]_block_invoke", 544, v9);
  brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _signalSourceIfNeeded]_block_invoke", 544);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v11 = v9[0];
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v2;
    _os_log_debug_impl(&dword_19CBF0000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@ notification timer fired%@", buf, 0x20u);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 80);
  if (*(_QWORD *)(v4 + 72) < v5)
  {
    *(_QWORD *)(v4 + 72) = v5;
    v4 = *(_QWORD *)(a1 + 32);
  }
  if (objc_msgSend(*(id *)(v4 + 24), "count"))
    dispatch_source_merge_data(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 56), 1uLL);
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 64));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = 0;

  __brc_leave_section((uint64_t)v9);
}

- (void)_receiveUpdates:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSMutableDictionary *itemInTransferByID;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  BRQueryItemProgressObserver *v19;
  BRQueryItemProgressObserver *v20;
  void *v21;
  BRQueryItemProgressObserver *v22;
  id v23;
  _BOOL4 isNetworkReachable;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isInvalidated)
  {
    isNetworkReachable = self->_isNetworkReachable;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v23 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (!v6)
      goto LABEL_34;
    v7 = v6;
    v8 = *(_QWORD *)v27;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v10, "fileObjectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[NSMutableDictionary objectForKey:](self->_itemInTransferByID, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12 || !objc_msgSend(v10, "isDead") || objc_msgSend(v10, "canMerge:", v12))
          {
            if (objc_msgSend(v10, "isInTransfer"))
            {
              if (isNetworkReachable)
              {
                if (v12)
                  goto LABEL_14;
LABEL_20:
                itemInTransferByID = self->_itemInTransferByID;
                v15 = (void *)objc_msgSend(v10, "copy");
                -[NSMutableDictionary setObject:forKey:](itemInTransferByID, "setObject:forKey:", v15, v11);

              }
              else
              {
                objc_msgSend(v10, "setIsNetworkOffline:", 1);
                if (!v12)
                  goto LABEL_20;
LABEL_14:
                objc_msgSend(v12, "merge:", v10);
              }
            }
            else
            {
              objc_msgSend(v10, "setIsNetworkOffline:", 0);
              -[NSMutableDictionary removeObjectForKey:](self->_itemInTransferByID, "removeObjectForKey:", v11);
            }
            objc_msgSend(v10, "url");
            v16 = objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v17 = (void *)v16;
              if ((objc_msgSend(v10, "isUploadActive") & 1) != 0)
              {

LABEL_25:
                -[NSMutableDictionary objectForKey:](self->_progressObserverByID, "objectForKey:", v11);
                v19 = (BRQueryItemProgressObserver *)objc_claimAutoreleasedReturnValue();
                if (v19)
                {
                  v20 = v19;
                  -[BRQueryItemProgressObserver item](v19, "item");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "merge:", v10);

                }
                else
                {
                  v20 = -[BRQueryItemProgressObserver initWithItem:]([BRQueryItemProgressObserver alloc], "initWithItem:", v10);
                  -[BRQueryItemProgressObserver setQueue:](v20, "setQueue:", self->_queue);
                  v25[0] = MEMORY[0x1E0C809B0];
                  v25[1] = 3221225472;
                  v25[2] = __42__BRNotificationReceiver__receiveUpdates___block_invoke;
                  v25[3] = &unk_1E3DA5A10;
                  v25[4] = self;
                  -[BRQueryItemProgressObserver setProgressHandler:](v20, "setProgressHandler:", v25);
                  -[NSMutableDictionary setObject:forKey:](self->_progressObserverByID, "setObject:forKey:", v20, v11);
                  -[BRQueryItemProgressObserver start](v20, "start");
                }
LABEL_30:

                goto LABEL_31;
              }
              v18 = objc_msgSend(v10, "isDownloadActive");

              if ((v18 & 1) != 0)
                goto LABEL_25;
            }
            -[NSMutableDictionary objectForKey:](self->_progressObserverByID, "objectForKey:", v11);
            v22 = (BRQueryItemProgressObserver *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v20 = v22;
              -[BRQueryItemProgressObserver stop](v22, "stop");
              -[NSMutableDictionary removeObjectForKey:](self->_progressObserverByID, "removeObjectForKey:", v11);
              goto LABEL_30;
            }
LABEL_31:
            -[BRNotificationQueue addNotification:asDead:](self->_notifs, "addNotification:asDead:", v10, 0);
          }
        }
        else
        {
          brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver _receiveUpdates:]", 575);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(0);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v12;
            _os_log_fault_impl(&dword_19CBF0000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: we should always have a fileObjectID%@", buf, 0xCu);
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (!v7)
      {
LABEL_34:

        self->_receivedChanges += objc_msgSend(v5, "count");
        -[BRNotificationReceiver _signalSourceIfNeeded](self, "_signalSourceIfNeeded");
        v4 = v23;
        break;
      }
    }
  }

}

uint64_t __42__BRNotificationReceiver__receiveUpdates___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v2 + 129))
  {
    v3 = result;
    v4 = *(void **)(v2 + 24);
    v5 = (void *)objc_msgSend(a2, "copy");
    objc_msgSend(v4, "addNotification:asDead:", v5, 0);

    ++*(_QWORD *)(*(_QWORD *)(v3 + 32) + 72);
    return objc_msgSend(*(id *)(v3 + 32), "_signalSourceIfNeeded");
  }
  return result;
}

- (void)receiveUpdates:(id)a3 logicalExtensions:(id)a4 physicalExtensions:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  OS_dispatch_queue *ipcQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[3];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(0, (uint64_t)"-[BRNotificationReceiver receiveUpdates:logicalExtensions:physicalExtensions:reply:]", 644, v26);
  brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver receiveUpdates:logicalExtensions:physicalExtensions:reply:]", 644);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v28 = v26[0];
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = v14;
    _os_log_debug_impl(&dword_19CBF0000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx receiving %@%@", buf, 0x20u);
  }

  ipcQueue = self->_ipcQueue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __84__BRNotificationReceiver_receiveUpdates_logicalExtensions_physicalExtensions_reply___block_invoke;
  v21[3] = &unk_1E3DA5A38;
  v21[4] = self;
  v17 = v13;
  v25 = v17;
  v18 = v11;
  v22 = v18;
  v19 = v12;
  v23 = v19;
  v20 = v10;
  v24 = v20;
  dispatch_async_with_logs(ipcQueue, v21);

  __brc_leave_section((uint64_t)v26);
}

void __84__BRNotificationReceiver_receiveUpdates_logicalExtensions_physicalExtensions_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AD841C]();
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 129))
  {
    brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver receiveUpdates:logicalExtensions:physicalExtensions:reply:]_block_invoke", 648);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __84__BRNotificationReceiver_receiveUpdates_logicalExtensions_physicalExtensions_reply___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    objc_autoreleasePoolPop(v2);
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count") || objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver receiveUpdates:logicalExtensions:physicalExtensions:reply:]_block_invoke", 653);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v19 = *(_QWORD *)(a1 + 40);
        v20 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        v27 = v19;
        v28 = 2112;
        v29 = v20;
        v30 = 2112;
        v31 = v5;
        _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] received extensions\nlogical:%@\nphysical:%@%@", buf, 0x20u);
      }

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v7 = *(id *)(a1 + 56);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v22 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            v13 = *(void **)(a1 + 40);
            objc_msgSend(v12, "fileObjectID", (_QWORD)v21);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKey:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = *(void **)(a1 + 48);
            objc_msgSend(v12, "fileObjectID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKey:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "attachLogicalExtension:physicalExtension:", v15, v18);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_receiveUpdates:", *(_QWORD *)(a1 + 56), (_QWORD)v21);
    objc_autoreleasePoolPop(v2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

- (void)receiveProgressUpdates:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  OS_dispatch_queue *ipcQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[3];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  memset(v16, 0, sizeof(v16));
  __brc_create_section(0, (uint64_t)"-[BRNotificationReceiver receiveProgressUpdates:reply:]", 672, v16);
  brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver receiveProgressUpdates:reply:]", 672);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v18 = v16[0];
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v8;
    _os_log_debug_impl(&dword_19CBF0000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx receiving progress updates %@%@", buf, 0x20u);
  }

  ipcQueue = self->_ipcQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__BRNotificationReceiver_receiveProgressUpdates_reply___block_invoke;
  v13[3] = &unk_1E3DA5A60;
  v13[4] = self;
  v11 = v7;
  v15 = v11;
  v12 = v6;
  v14 = v12;
  dispatch_async_with_logs(ipcQueue, v13);

  __brc_leave_section((uint64_t)v16);
}

void __55__BRNotificationReceiver_receiveProgressUpdates_reply___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 129))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v3 = *(id *)(a1 + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          v9 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
          objc_msgSend(v8, "folderID", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v11, "mergeProgressUpdate:", v8);
            v12 = (void *)objc_msgSend(v11, "copy");
            objc_msgSend(v2, "addObject:", v12);

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }

    objc_msgSend(*(id *)(a1 + 32), "_receiveUpdates:", v2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

- (void)networkDidChangeReachabilityStatusTo:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[3];
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  memset(v22, 0, sizeof(v22));
  __brc_create_section(0, (uint64_t)"-[BRNotificationReceiver networkDidChangeReachabilityStatusTo:]", 700, v22);
  brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver networkDidChangeReachabilityStatusTo:]", 700);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v25 = v22[0];
    if (v3)
      v17 = "reachable";
    else
      v17 = "not reachable";
    v26 = 2080;
    v27 = v17;
    v28 = 2112;
    v29 = v5;
    _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx network is %s%@", buf, 0x20u);
  }

  self->_isNetworkReachable = v3;
  if (!self->_isInvalidated)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NSMutableDictionary allValues](self->_itemInTransferByID, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithArray:copyItems:", v8, 1);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      v13 = !v3;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14++), "setIsNetworkOffline:", v13, (_QWORD)v18);
        }
        while (v11 != v14);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v11);
    }

    brc_bread_crumbs((uint64_t)"-[BRNotificationReceiver networkDidChangeReachabilityStatusTo:]", 713);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[BRNotificationReceiver networkDidChangeReachabilityStatusTo:].cold.1();

    -[BRNotificationReceiver _receiveUpdates:](self, "_receiveUpdates:", v10);
  }
  __brc_leave_section((uint64_t)v22);
}

- (void)receiveStitchingUpdates:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__BRNotificationReceiver_receiveStitchingUpdates___block_invoke;
  v7[3] = &unk_1E3DA4A70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_with_logs(queue, v7);

}

uint64_t __50__BRNotificationReceiver_receiveStitchingUpdates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receiveUpdates:", *(_QWORD *)(a1 + 40));
}

- (void)disableUpdatesFromIPCBeforeStitching
{
  dispatch_suspend((dispatch_object_t)self->_ipcQueue);
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_42);
}

- (void)enableUpdatesFromIPCAfterStitching
{
  dispatch_resume((dispatch_object_t)self->_ipcQueue);
}

- (unint64_t)batchingChanges
{
  return self->_batchingChanges;
}

- (void)setBatchingChanges:(unint64_t)a3
{
  self->_batchingChanges = a3;
}

- (double)batchingDelay
{
  return self->_batchingDelay;
}

- (void)setBatchingDelay:(double)a3
{
  self->_batchingDelay = a3;
}

- (BRNotificationReceiverDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_accountTokenDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_itemInTransferByID, 0);
  objc_storeStrong((id *)&self->_progressObserverByID, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_notifs, 0);
  objc_storeStrong((id *)&self->_ipcQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: _source%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_obtainNotificationSenderFromDaemon
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_19CBF0000, a3, (os_log_type_t)0x90u, "[ERROR] cannot query iCloud Drive items: %@%@", (uint8_t *)&v6, 0x16u);

}

void __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] received %@%@");
  OUTLINED_FUNCTION_1();
}

void __61__BRNotificationReceiver__obtainNotificationSenderFromDaemon__block_invoke_20_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] ┏%llx received token change notification, reloading%@");
  OUTLINED_FUNCTION_1();
}

- (void)_watchUbiquitousScopes:bundleID:predicate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_0(&dword_19CBF0000, v0, v1, "[ERROR] cannot pass more than one URL in the scopes%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_watchUbiquitousScopes:bundleID:predicate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] forcing external documents even if not specified%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_watchUbiquitousScopes:bundleID:predicate:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v0, v1, "[ERROR] Unable to understand scope: %@%@");
  OUTLINED_FUNCTION_1();
}

- (void)_watchUbiquitousScopes:bundleID:predicate:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] API MISUSE: It's not allowed to call -watchUbiquitousScopes:predicate: twice%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] gathering completed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_29_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] Using persona ID for NSMDQ %@%@");
  OUTLINED_FUNCTION_1();
}

void __68__BRNotificationReceiver__watchUbiquitousScopes_bundleID_predicate___block_invoke_29_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: Couldn't adopt persona in NSMDQ but falling back to daemon%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __84__BRNotificationReceiver_receiveUpdates_logicalExtensions_physicalExtensions_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] skiping update process as we were invalidated%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)networkDidChangeReachabilityStatusTo:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] updating items: %@%@");
  OUTLINED_FUNCTION_1();
}

@end
