@implementation FMAlertManager

+ (id)sharedInstance
{
  if (sharedInstance_dispatch_predicate_0 != -1)
    dispatch_once(&sharedInstance_dispatch_predicate_0, &__block_literal_global_8);
  return (id)sharedInstance__instance_0;
}

void __32__FMAlertManager_sharedInstance__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  LogCategory_Unspecified();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __32__FMAlertManager_sharedInstance__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

  v8 = -[FMAlertManager initSingleton]([FMAlertManager alloc], "initSingleton");
  v9 = (void *)sharedInstance__instance_0;
  sharedInstance__instance_0 = (uint64_t)v8;

}

- (FMAlertManager)init
{
  NSObject *v3;

  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[FMAlertManager init].cold.1(v3);

  return 0;
}

- (id)initSingleton
{
  FMAlertManager *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FMAlertManager;
  v2 = -[FMAlertManager init](&v14, sel_init);
  if (v2)
  {
    LogCategory_Unspecified();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[FMAlertManager initSingleton].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAlertManager setActiveAlerts:](v2, "setActiveAlerts:", v11);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAlertManager setActiveCFNotificationsByCategory:](v2, "setActiveCFNotificationsByCategory:", v12);

  }
  return v2;
}

- (void)activateAlert:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFUserNotification *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const __CFAllocator *v34;
  CFTimeInterval v35;
  CFUserNotificationRef v36;
  CFUserNotificationRef v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  _QWORD block[5];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "alertId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v48 = v6;
    v49 = 2048;
    v50 = objc_msgSend(v4, "category");
    _os_log_impl(&dword_1C9967000, v5, OS_LOG_TYPE_INFO, "Will display %@:%ld", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "category");
  if (v8 != *MEMORY[0x1E0D201E0])
  {
    -[FMAlertManager activeCFNotificationsByCategory](self, "activeCFNotificationsByCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "category"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[FMAlertManager activeAlerts](self, "activeAlerts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[FMAlertManager activeCFNotificationsByCategory](self, "activeCFNotificationsByCategory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "category"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", v15);

      -[FMAlertManager activeAlerts](self, "activeAlerts");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObjectForKey:", v11);

      +[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMAlertManager _xpcTransactionNameFor:](self, "_xpcTransactionNameFor:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "endTransaction:", v18);

      v19 = (__CFUserNotification *)objc_msgSend(v11, "unsignedLongValue");
      CFUserNotificationCancel(v19);
      CFRelease(v19);

    }
  }
  v20 = *MEMORY[0x1E0C9B838];
  objc_msgSend(v4, "defaultButtonTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fm_safelyMapKey:toObject:", v20, v21);

  v22 = *MEMORY[0x1E0C9B830];
  objc_msgSend(v4, "alternateButtonTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fm_safelyMapKey:toObject:", v22, v23);

  v24 = *MEMORY[0x1E0C9B810];
  objc_msgSend(v4, "msgText");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fm_safelyMapKey:toObject:", v24, v25);

  v26 = *MEMORY[0x1E0C9B800];
  objc_msgSend(v4, "msgTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fm_safelyMapKey:toObject:", v26, v27);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "showMsgInLockScreen"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0C9B820]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "dismissMsgOnUnlock") ^ 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0DABBB0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "dismissMsgOnLock"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0DABB98]);

  v31 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DABB10]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0DABAF0]);
  objc_msgSend(v4, "additionalSettings");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v4, "additionalSettings");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v33);

  }
  *(_DWORD *)buf = 0;
  v34 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  objc_msgSend(v4, "timeout");
  v36 = CFUserNotificationCreate(v34, v35, 3uLL, (SInt32 *)buf, (CFDictionaryRef)v7);
  if (v36)
  {
    v37 = v36;
    -[FMAlertManager activeAlerts](self, "activeAlerts");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v4, v39);

    if (objc_msgSend(v4, "category"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v37);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMAlertManager activeCFNotificationsByCategory](self, "activeCFNotificationsByCategory");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "category"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, v42);

    }
    +[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAlertManager _xpcTransactionNameFor:](self, "_xpcTransactionNameFor:", v4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "beginTransaction:", v44);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__FMAlertManager_activateAlert___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v37;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    LogCategory_Unspecified();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      -[FMAlertManager activateAlert:].cold.1(v4, (int *)buf, v45);

  }
}

void __32__FMAlertManager_activateAlert___block_invoke(uint64_t a1)
{
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v2;
  __CFRunLoop *Current;

  RunLoopSource = CFUserNotificationCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFUserNotificationRef *)(a1 + 32), (CFUserNotificationCallBack)_fmAlertCFCallback, 0);
  if (RunLoopSource)
  {
    v2 = RunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v2, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(v2);
  }
}

- (id)_xpcTransactionNameFor:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Alert-%lX"), a3);
}

- (NSMutableDictionary)activeAlerts
{
  return self->_activeAlerts;
}

- (void)setActiveAlerts:(id)a3
{
  objc_storeStrong((id *)&self->_activeAlerts, a3);
}

- (NSMutableDictionary)activeCFNotificationsByCategory
{
  return self->_activeCFNotificationsByCategory;
}

- (void)setActiveCFNotificationsByCategory:(id)a3
{
  objc_storeStrong((id *)&self->_activeCFNotificationsByCategory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCFNotificationsByCategory, 0);
  objc_storeStrong((id *)&self->_activeAlerts, 0);
}

void __32__FMAlertManager_sharedInstance__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9967000, a1, a3, "Creating shared instance of FMAlertManager", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9967000, log, OS_LOG_TYPE_ERROR, "*** Trying to explicitly init FMAlertManager. Use 'sharedInstance'", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initSingleton
{
  OUTLINED_FUNCTION_0_0(&dword_1C9967000, a1, a3, "FMAlertManager: initialize", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)activateAlert:(NSObject *)a3 .cold.1(void *a1, int *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fm_logID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a2;
  v7 = 138412546;
  v8 = v5;
  v9 = 2048;
  v10 = v6;
  _os_log_error_impl(&dword_1C9967000, a3, OS_LOG_TYPE_ERROR, "Error while creating a CFUserNotification %@: %ld", (uint8_t *)&v7, 0x16u);

}

@end
