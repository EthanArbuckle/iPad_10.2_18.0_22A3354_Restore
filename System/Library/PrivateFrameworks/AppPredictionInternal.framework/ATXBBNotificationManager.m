@implementation ATXBBNotificationManager

- (ATXBBNotificationManager)init
{
  return -[ATXBBNotificationManager initWithDebugOutput:](self, "initWithDebugOutput:", 0);
}

- (ATXBBNotificationManager)initWithDebugOutput:(BOOL)a3
{
  ATXBBNotificationManager *v4;
  objc_class *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  NSMutableDictionary *recentNotifications;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ATXBBNotificationManager;
  v4 = -[ATXBBNotificationManager init](&v14, sel_init);
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create(v7, v8);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v9;

    v4->_debugOutput = a3;
    v11 = objc_opt_new();
    recentNotifications = v4->_recentNotifications;
    v4->_recentNotifications = (NSMutableDictionary *)v11;

  }
  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1)
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_165);
  return (id)sharedInstance_instance_3;
}

void __42__ATXBBNotificationManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance_3;
  sharedInstance_instance_3 = v0;

}

- (void)addNotificationForBundleId:(id)a3 withPublicationDate:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  ATXBBNotificationManager *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__ATXBBNotificationManager_addNotificationForBundleId_withPublicationDate___block_invoke;
  block[3] = &unk_1E82DB9D8;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __75__ATXBBNotificationManager_addNotificationForBundleId_withPublicationDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BYTE *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  FILE **v8;
  FILE *v9;
  id v10;
  FILE **v11;
  FILE *v12;
  id v13;
  FILE **v14;
  FILE *v15;
  id v16;
  id v17;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -600.0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(*(id *)(a1 + 40), "compare:");
    v3 = *(_BYTE **)(a1 + 48);
    if (v2 == -1)
    {
      if (v3[16])
      {
        v11 = (FILE **)MEMORY[0x1E0C80C20];
        v12 = (FILE *)*MEMORY[0x1E0C80C20];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rejecting old notification for %@"), *(_QWORD *)(a1 + 32));
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        fprintf(v12, "%s\n", (const char *)objc_msgSend(v13, "UTF8String"));

        fflush(*v11);
      }
      goto LABEL_19;
    }
    if (objc_msgSend(v3, "_purgeNotificationsWithMinDate:", v17)
      && (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "count") > 0x3E8)
    {
LABEL_19:

      return;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = objc_msgSend(v4, "compare:", *(_QWORD *)(a1 + 40));
      v7 = *(_QWORD *)(a1 + 48);
      if (v6 != -1)
      {
        if (*(_BYTE *)(v7 + 16))
        {
          v8 = (FILE **)MEMORY[0x1E0C80C20];
          v9 = (FILE *)*MEMORY[0x1E0C80C20];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("not updating notification for %@"), *(_QWORD *)(a1 + 32));
          v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          fprintf(v9, "%s\n", (const char *)objc_msgSend(v10, "UTF8String"));

          fflush(*v8);
        }
        goto LABEL_18;
      }
      if (*(_BYTE *)(v7 + 16))
      {
        v14 = (FILE **)MEMORY[0x1E0C80C20];
        v15 = (FILE *)*MEMORY[0x1E0C80C20];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updating notification for %@"), *(_QWORD *)(a1 + 32));
        goto LABEL_16;
      }
    }
    else
    {
      v7 = *(_QWORD *)(a1 + 48);
      if (*(_BYTE *)(v7 + 16))
      {
        v14 = (FILE **)MEMORY[0x1E0C80C20];
        v15 = (FILE *)*MEMORY[0x1E0C80C20];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setting notification date for %@"), *(_QWORD *)(a1 + 32));
LABEL_16:
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        fprintf(v15, "%s\n", (const char *)objc_msgSend(v16, "UTF8String"));

        fflush(*v14);
        v7 = *(_QWORD *)(a1 + 48);
      }
    }
    objc_msgSend(*(id *)(v7 + 24), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
LABEL_18:

    goto LABEL_19;
  }
}

- (BOOL)_purgeNotificationsWithMinDate:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  NSMutableDictionary *recentNotifications;
  void *v8;
  FILE **v9;
  FILE *v10;
  id v11;
  NSMutableDictionary *v12;
  void *v13;
  FILE *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  BOOL (*v19)(uint64_t, uint64_t, void *);
  void *v20;
  id v21;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[NSMutableDictionary count](self->_recentNotifications, "count");
  if (v5 >= 0x64)
  {
    v6 = (void *)MEMORY[0x1CAA48B6C]();
    recentNotifications = self->_recentNotifications;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __59__ATXBBNotificationManager__purgeNotificationsWithMinDate___block_invoke;
    v20 = &unk_1E82E6E08;
    v21 = v4;
    -[NSMutableDictionary keysOfEntriesPassingTest:](recentNotifications, "keysOfEntriesPassingTest:", &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (FILE **)MEMORY[0x1E0C80C20];
    if (self->_debugOutput)
    {
      v10 = (FILE *)*MEMORY[0x1E0C80C20];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleIdsToRemove: %@"), v8, v17, v18, v19, v20);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      fprintf(v10, "%s\n", (const char *)objc_msgSend(v11, "UTF8String"));

      fflush(*v9);
    }
    v12 = self->_recentNotifications;
    objc_msgSend(v8, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectsForKeys:](v12, "removeObjectsForKeys:", v13);

    if (self->_debugOutput)
    {
      v14 = *v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entries remaining after purge: %lu"), -[NSMutableDictionary count](self->_recentNotifications, "count"));
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      fprintf(v14, "%s\n", (const char *)objc_msgSend(v15, "UTF8String"));

      fflush(*v9);
    }

    objc_autoreleasePoolPop(v6);
  }

  return v5 > 0x63;
}

BOOL __59__ATXBBNotificationManager__purgeNotificationsWithMinDate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", *(_QWORD *)(a1 + 32)) == 1;
}

- (id)recentNotifications
{
  void *v3;
  NSObject *queue;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -600.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13[0] = &v12;
  v13[1] = 0x3032000000;
  v13[2] = __Block_byref_object_copy__75;
  v13[3] = __Block_byref_object_dispose__75;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ATXBBNotificationManager_recentNotifications__block_invoke;
  block[3] = &unk_1E82DCC50;
  block[4] = self;
  v5 = v3;
  v10 = v5;
  v11 = &v12;
  dispatch_sync(queue, block);
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ATXBBNotificationManager recentNotifications].cold.1((uint64_t)v13, v6);

  v7 = *(id *)(v13[0] + 40);
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __47__ATXBBNotificationManager_recentNotifications__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_purgeNotificationsWithMinDate:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentNotifications, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)recentNotifications
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "Recent notifications: %@", (uint8_t *)&v3, 0xCu);
}

@end
