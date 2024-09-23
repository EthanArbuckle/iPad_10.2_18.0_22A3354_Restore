@implementation BRContainersMonitor

void __50__BRContainersMonitor_addObserver_forContainerID___block_invoke(uint64_t a1, int a2)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_sync_exit(v4);
  brc_notify_get_state(a2, &v22, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"));
  v7 = v22;
  brc_bread_crumbs((uint64_t)"-[BRContainersMonitor addObserver:forContainerID:]_block_invoke", 181);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v16 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    v25 = v16;
    if (v7)
      v17 = "foreground";
    else
      v17 = "background";
    v26 = 2080;
    v27 = v17;
    v28 = 1024;
    v29 = a2;
    v30 = 2112;
    v31 = v8;
    _os_log_debug_impl(&dword_19CBF0000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ is now %s for token %d%@", buf, 0x26u);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
        v15 = *(_QWORD *)(a1 + 40);
        if (v7)
          objc_msgSend(v14, "containerDidEnterForeground:", v15);
        else
          objc_msgSend(v14, "containerDidEnterBackground:", v15, (_QWORD)v18);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v11);
  }

}

- (BRContainersMonitor)init
{
  BRContainersMonitor *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *observersByContainerID;
  NSMutableDictionary *v5;
  NSMutableDictionary *notifyTokenByContainerID;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BRContainersMonitor;
  v2 = -[BRContainersMonitor init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observersByContainerID = v2->_observersByContainerID;
    v2->_observersByContainerID = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    notifyTokenByContainerID = v2->_notifyTokenByContainerID;
    v2->_notifyTokenByContainerID = v5;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.clouddocs.containers.monitor", v8);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

  }
  return v2;
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
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] API MISUSE: There were observers remaining at dealloc time. Call -removeObserver:forContainerID: first.%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (BOOL)isContainerID:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("com.apple.clouddocs."));
}

+ (id)containerIDFromPrimaryIdentifier:(id)a3 secondaryIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[3];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  memset(v13, 0, sizeof(v13));
  __brc_create_section(0, (uint64_t)"+[BRContainersMonitor containerIDFromPrimaryIdentifier:secondaryIdentifier:]", 81, v13);
  brc_bread_crumbs((uint64_t)"+[BRContainersMonitor containerIDFromPrimaryIdentifier:secondaryIdentifier:]", 81);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v15 = v13[0];
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_debug_impl(&dword_19CBF0000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx asking container ID for %@, %@%@", buf, 0x2Au);
  }

  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.bird")) & 1) != 0)
  {
    objc_msgSend(CFSTR("com.apple.clouddocs."), "stringByAppendingString:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs((uint64_t)"+[BRContainersMonitor containerIDFromPrimaryIdentifier:secondaryIdentifier:]", 87);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[BRContainersMonitor containerIDFromPrimaryIdentifier:secondaryIdentifier:].cold.1();

  }
  else
  {
    v9 = 0;
  }
  __brc_leave_section((uint64_t)v13);

  return v9;
}

+ (id)bundleIDFromPrimaryIdentifier:(id)a3 secondaryIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  NSObject *v13;
  _QWORD v15[3];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"+[BRContainersMonitor bundleIDFromPrimaryIdentifier:secondaryIdentifier:]", 94, v15);
  brc_bread_crumbs((uint64_t)"+[BRContainersMonitor bundleIDFromPrimaryIdentifier:secondaryIdentifier:]", 94);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v17 = (id)v15[0];
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    _os_log_debug_impl(&dword_19CBF0000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx asking bundle ID for %@, %@%@", buf, 0x2Au);
  }

  objc_msgSend(a1, "containerIDFromPrimaryIdentifier:secondaryIdentifier:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = CFSTR("com.apple.bird");
    brc_bread_crumbs((uint64_t)"+[BRContainersMonitor bundleIDFromPrimaryIdentifier:secondaryIdentifier:]", 144);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      +[BRContainersMonitor containerIDFromPrimaryIdentifier:secondaryIdentifier:].cold.1();
  }
  else
  {
    brc_bread_crumbs((uint64_t)"+[BRContainersMonitor bundleIDFromPrimaryIdentifier:secondaryIdentifier:]", 99);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v12;
      _os_log_fault_impl(&dword_19CBF0000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: not a CloudDocs identifier pair (%@, %@)%@", buf, 0x20u);
    }
    v11 = 0;
  }

  __brc_leave_section((uint64_t)v15);
  return v11;
}

- (void)addObserver:(id)a3 forContainerID:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  BRContainersMonitor *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  const char *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSMutableDictionary *notifyTokenByContainerID;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *queue;
  id v29;
  id v30;
  void *v31;
  _QWORD block[4];
  id v33;
  int v34;
  _QWORD v35[5];
  id v36;
  id v37;
  int out_token;
  _QWORD v39[3];
  _BYTE handler[32];
  id v41;
  id v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v6 = a4;
  memset(v39, 0, sizeof(v39));
  __brc_create_section(0, (uint64_t)"-[BRContainersMonitor addObserver:forContainerID:]", 151, v39);
  brc_bread_crumbs((uint64_t)"-[BRContainersMonitor addObserver:forContainerID:]", 151);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)handler = 134218498;
    *(_QWORD *)&handler[4] = v39[0];
    *(_WORD *)&handler[12] = 2112;
    *(_QWORD *)&handler[14] = v6;
    *(_WORD *)&handler[22] = 2112;
    *(_QWORD *)&handler[24] = v7;
    _os_log_debug_impl(&dword_19CBF0000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx adding observer for %@%@", handler, 0x20u);
  }

  v9 = self;
  objc_sync_enter(v9);
  out_token = 0;
  -[NSMutableDictionary objectForKey:](v9->_observersByContainerID, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    -[NSMutableDictionary setObject:forKey:](v9->_observersByContainerID, "setObject:forKey:", v10, v6);
  }
  objc_msgSend(v10, "addObject:", v30, v30);
  notifyNameWithPrefixedContainerID(v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __50__BRContainersMonitor_addObserver_forContainerID___block_invoke;
  v35[3] = &unk_1E3DA5730;
  v35[4] = v9;
  v13 = v6;
  v36 = v13;
  v14 = v11;
  v37 = v14;
  v15 = (void *)MEMORY[0x1A1AD85E4](v35);
  v16 = objc_retainAutorelease(v14);
  v17 = (const char *)objc_msgSend(v16, "UTF8String");
  v18 = v9->_queue;
  v19 = v15;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "br_currentPersonaID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)handler = v12;
  *(_QWORD *)&handler[8] = 3221225472;
  *(_QWORD *)&handler[16] = __br_notify_register_dispatch_block_invoke_1;
  *(_QWORD *)&handler[24] = &unk_1E3DA49A8;
  v22 = v21;
  v41 = v22;
  v43 = v17;
  v23 = v19;
  v42 = v23;
  notify_register_dispatch(v17, &out_token, v18, handler);

  notifyTokenByContainerID = v9->_notifyTokenByContainerID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](notifyTokenByContainerID, "setObject:forKey:", v25, v13);

  brc_bread_crumbs((uint64_t)"-[BRContainersMonitor addObserver:forContainerID:]", 193);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)handler = 67109634;
    *(_DWORD *)&handler[4] = out_token;
    *(_WORD *)&handler[8] = 2112;
    *(_QWORD *)&handler[10] = v16;
    *(_WORD *)&handler[18] = 2112;
    *(_QWORD *)&handler[20] = v26;
    _os_log_debug_impl(&dword_19CBF0000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Registered token %d for %@%@", handler, 0x1Cu);
  }

  queue = v9->_queue;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __50__BRContainersMonitor_addObserver_forContainerID___block_invoke_13;
  block[3] = &unk_1E3DA5758;
  v33 = v23;
  v34 = out_token;
  v29 = v23;
  dispatch_async(queue, block);

  objc_sync_exit(v9);
  __brc_leave_section((uint64_t)v39);

}

uint64_t __50__BRContainersMonitor_addObserver_forContainerID___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (void)removeObserver:(id)a3 forContainerID:(id)a4
{
  id v6;
  id v7;
  BRContainersMonitor *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKey:](v8->_observersByContainerID, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "containsObject:", v6) & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"-[BRContainersMonitor removeObserver:forContainerID:]", 205);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRContainersMonitor removeObserver:forContainerID:].cold.1();

  }
  objc_msgSend(v9, "removeObject:", v6);
  if (!objc_msgSend(v9, "count"))
  {
    -[NSMutableDictionary removeObjectForKey:](v8->_observersByContainerID, "removeObjectForKey:", v7);
    -[NSMutableDictionary objectForKey:](v8->_notifyTokenByContainerID, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    notify_cancel(v11);
  }

  objc_sync_exit(v8);
}

+ (BOOL)isContainerIDForeground:(id)a3
{
  id v3;
  id v4;
  BOOL v5;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int val;

  v3 = a3;
  if (!+[BRContainersMonitor isContainerID:](BRContainersMonitor, "isContainerID:", v3))
  {
    brc_bread_crumbs((uint64_t)"+[BRContainersMonitor isContainerIDForeground:]", 218);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      +[BRContainersMonitor isContainerIDForeground:].cold.1();

  }
  val = -1;
  v9 = 0;
  notifyNameWithPrefixedContainerID(v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  brc_notify_register_check((const char *)objc_msgSend(v4, "UTF8String"), &val);
  if (notify_is_valid_token(val))
  {
    brc_notify_get_state(val, &v9, objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    v5 = v9 != 0;
    notify_cancel(val);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notifyTokenByContainerID, 0);
  objc_storeStrong((id *)&self->_observersByContainerID, 0);
}

+ (void)containerIDFromPrimaryIdentifier:secondaryIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] returning %@%@");
  OUTLINED_FUNCTION_1();
}

- (void)removeObserver:forContainerID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] API MISUSE: removed non existing observer%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)isContainerIDForeground:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: [BRContainersMonitor isContainerID:containerID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
