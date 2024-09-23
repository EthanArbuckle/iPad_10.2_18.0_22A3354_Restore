@implementation FPProviderDomainChangesReceiver

+ (id)_sharedChangesReceiverInitIfNeeded:(BOOL)a3
{
  if (a3 && _sharedChangesReceiverInitIfNeeded__onceToken != -1)
    dispatch_once(&_sharedChangesReceiverInitIfNeeded__onceToken, &__block_literal_global);
  return (id)_sharedChangesReceiverInitIfNeeded__sharedChangesReceiver;
}

- (NSDictionary)cachedProviderDomainsByID
{
  FPProviderDomainChangesReceiver *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSDictionary copy](v2->_providerDomainsByID, "copy");
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

+ (id)sharedChangesReceiverIfAvailable
{
  return (id)objc_msgSend(a1, "_sharedChangesReceiverInitIfNeeded:", 0);
}

void __40__FPProviderDomainChangesReceiver__init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A0A34000, v2, OS_LOG_TYPE_INFO, "[INFO] received notification that provider info has changed; scheduling a fetch",
      v4,
      2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "signalChange");

}

- (void)signalChange
{
  -[FPPacer signal](self->_pacer, "signal");
}

- (void)updateProviderDomainsWithAttemptCount:(unint64_t)a3
{
  void *v5;
  _QWORD v6[6];

  -[FPPacer suspend](self->_pacer, "suspend");
  +[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke;
  v6[3] = &unk_1E4449A10;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "providerDomainsCompletionHandler:", v6);

}

void __70__FPProviderDomainChangesReceiver__sharedChangesReceiverInitIfNeeded___block_invoke()
{
  id v0;
  void *v1;

  v0 = -[FPProviderDomainChangesReceiver _init]([FPProviderDomainChangesReceiver alloc], "_init");
  v1 = (void *)_sharedChangesReceiverInitIfNeeded__sharedChangesReceiver;
  _sharedChangesReceiverInitIfNeeded__sharedChangesReceiver = (uint64_t)v0;

}

+ (id)sharedChangesReceiver
{
  return (id)objc_msgSend(a1, "_sharedChangesReceiverInitIfNeeded:", 1);
}

- (id)_init
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  FPPacer *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)FPProviderDomainChangesReceiver;
  v2 = -[FPProviderDomainChangesReceiver init](&v23, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.FileProvider.provider-changes-receiver.notify", v5);
    v7 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v6;

    objc_msgSend(CFSTR("com.apple.fileprovider.providers-changed"), "fp_libnotifyPerUserNotificationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    location = 0;
    objc_initWeak(&location, v2);
    v9 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __40__FPProviderDomainChangesReceiver__init__block_invoke;
    v20[3] = &unk_1E4449998;
    objc_copyWeak(&v21, &location);
    v10 = (void *)MEMORY[0x1A1B00850](v20);
    v11 = objc_retainAutorelease(v8);
    notify_register_dispatch((const char *)objc_msgSend(v11, "UTF8String"), (int *)v2 + 8, *((dispatch_queue_t *)v2 + 3), v10);
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0A34000, v12, OS_LOG_TYPE_INFO, "[INFO] start monitoring provider info", buf, 2u);
    }

    v13 = -[FPPacer initWithName:queue:minFireInterval:]([FPPacer alloc], "initWithName:queue:minFireInterval:", CFSTR("domain-changes"), *((_QWORD *)v2 + 3), 1.0);
    v14 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v13;

    v15 = (void *)*((_QWORD *)v2 + 5);
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __40__FPProviderDomainChangesReceiver__init__block_invoke_26;
    v17[3] = &unk_1E44499C0;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v15, "setEventBlock:", v17);
    objc_msgSend(*((id *)v2 + 5), "resume");
    objc_destroyWeak(&v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[6];

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke_cold_1(v6, v8);
    goto LABEL_10;
  }
  v7 = *(_QWORD *)(a1 + 40);
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (!v7)
  {
    if (v9)
      __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke_cold_2(v5, v8);
LABEL_10:

    objc_msgSend(*(id *)(a1 + 32), "providerDomainsHaveChanged:error:", v6, v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "resume");
    goto LABEL_11;
  }
  if (v9)
    __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke_cold_3((uint64_t)v5, (uint64_t *)(a1 + 40), v8);

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(NSObject **)(v10 + 24);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke_29;
  v13[3] = &unk_1E44499E8;
  v13[4] = v10;
  v13[5] = v11;
  dispatch_async(v12, v13);
LABEL_11:

}

- (void)providerDomainsHaveChanged:(id)a3 error:(id)a4
{
  id v6;
  FPProviderDomainChangesReceiver *v7;
  uint64_t v8;
  NSDictionary *providerDomainsByID;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = objc_msgSend(v10, "copy");
  providerDomainsByID = v7->_providerDomainsByID;
  v7->_providerDomainsByID = (NSDictionary *)v8;

  objc_sync_exit(v7);
  -[FPProviderDomainChangesReceiver callChangesHandlersWithProviderDomains:error:](v7, "callChangesHandlersWithProviderDomains:error:", v10, v6);

}

- (void)callChangesHandlersWithProviderDomains:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  FPProviderDomainChangesReceiver *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)-[NSMutableSet copy](v8->_changesHandlers, "copy");
  objc_sync_exit(v8);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "callHandlerWithProvidersByID:error:", v6, v7, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (id)addChangesHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  FPProviderDomainChangesReceiver *v14;
  NSDictionary *providerDomainsByID;
  void *v16;

  v4 = a3;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPProviderDomainChangesReceiver addChangesHandler:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  +[_FPProviderDomainChangesHandlerWrapper wrapperWithHandler:](_FPProviderDomainChangesHandlerWrapper, "wrapperWithHandler:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self;
  objc_sync_enter(v14);
  -[NSMutableSet addObject:](v14->_changesHandlers, "addObject:", v13);
  providerDomainsByID = v14->_providerDomainsByID;
  if (providerDomainsByID)
    v16 = (void *)-[NSDictionary copy](providerDomainsByID, "copy");
  else
    v16 = 0;
  objc_sync_exit(v14);

  if (v16)
  {
    objc_msgSend(v13, "callHandlerWithProvidersByID:error:", v16, 0);
  }
  else if (-[FPPacer isSuspended](v14->_pacer, "isSuspended"))
  {
    -[FPProviderDomainChangesReceiver signalChange](v14, "signalChange");
  }
  else
  {
    -[FPProviderDomainChangesReceiver updateProviderDomainsWithAttemptCount:](v14, "updateProviderDomainsWithAttemptCount:", 3);
  }

  return v13;
}

- (void)removeChangesHandlerToken:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  FPProviderDomainChangesReceiver *v14;

  v4 = a3;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPProviderDomainChangesReceiver removeChangesHandlerToken:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  v13 = v4;
  objc_sync_enter(v13);
  objc_msgSend(v13, "setUnregistered:", 1);
  objc_sync_exit(v13);

  v14 = self;
  objc_sync_enter(v14);
  -[NSMutableSet removeObject:](v14->_changesHandlers, "removeObject:", v13);
  objc_sync_exit(v14);

}

void __40__FPProviderDomainChangesReceiver__init__block_invoke_26(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A0A34000, v2, OS_LOG_TYPE_INFO, "[INFO] received notification that provider info has changed; querying for new info",
      v4,
      2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateProviderDomainsWithAttemptCount:", 3);

}

- (void)_t_discardCache
{
  NSDictionary *providerDomainsByID;
  FPProviderDomainChangesReceiver *obj;

  obj = self;
  objc_sync_enter(obj);
  providerDomainsByID = obj->_providerDomainsByID;
  obj->_providerDomainsByID = 0;

  objc_sync_exit(obj);
}

uint64_t __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke_29(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateProviderDomainsWithAttemptCount:", *(_QWORD *)(a1 + 40) - 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "resume");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pacer, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_providerDomainsByID, 0);
  objc_storeStrong((id *)&self->_changesHandlers, 0);
}

- (void)addChangesHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A0A34000, a1, a3, "[DEBUG] add provider info change handler", a5, a6, a7, a8, 0);
}

- (void)removeChangesHandlerToken:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A0A34000, a1, a3, "[DEBUG] remove provide info change handler", a5, a6, a7, a8, 0);
}

void __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, "count");
  objc_msgSend(a1, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] received %lu updated providers: %@", (uint8_t *)&v6, 0x16u);

}

void __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_ERROR, "[ERROR] can't get the list of providers: %@", (uint8_t *)&v4, 0xCu);

}

void __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke_cold_3(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = v3;
  _os_log_error_impl(&dword_1A0A34000, log, OS_LOG_TYPE_ERROR, "[ERROR] received an error when listing providers, attempting again: %@ (count: %ld)", (uint8_t *)&v4, 0x16u);
}

@end
