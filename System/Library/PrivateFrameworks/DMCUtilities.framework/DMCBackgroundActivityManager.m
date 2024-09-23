@implementation DMCBackgroundActivityManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  return (id)sharedInstance_instance;
}

void __46__DMCBackgroundActivityManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[DMCBackgroundActivityManager initPrivate]([DMCBackgroundActivityManager alloc], "initPrivate");
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (id)initPrivate
{
  DMCBackgroundActivityManager *v2;
  uint64_t v3;
  NSMutableDictionary *activities;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMCBackgroundActivityManager;
  v2 = -[DMCBackgroundActivityManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    activities = v2->_activities;
    v2->_activities = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (void)scheduleOneShotActivity:(id)a3 interval:(double)a4 gracePeriod:(double)a5 callback:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  int64_t v18;
  xpc_object_t v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = DMCLogObjects()[1];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v26 = v9;
    v27 = 2048;
    v28 = a4;
    v29 = 2048;
    v30 = a5;
    _os_log_impl(&dword_1A4951000, v11, OS_LOG_TYPE_DEBUG, "Background activity registered. name %@ interval %f tolerance %f", buf, 0x20u);
  }
  v12 = objc_retainAutorelease(v9);
  v13 = (const char *)objc_msgSend(v12, "cStringUsingEncoding:", 4);
  v14 = (void *)MEMORY[0x1A85A3C10](v10);
  +[DMCBackgroundActivityManager sharedInstance](DMCBackgroundActivityManager, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, v12);

  if (a5 <= 9.22337204e18)
    v17 = (uint64_t)a5;
  else
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  if (a4 <= 9.22337204e18)
    v18 = (uint64_t)a4;
  else
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  v19 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v19, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  xpc_dictionary_set_int64(v19, (const char *)*MEMORY[0x1E0C80760], v18);
  xpc_dictionary_set_int64(v19, (const char *)*MEMORY[0x1E0C80790], v17);
  xpc_dictionary_set_BOOL(v19, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(v19, (const char *)*MEMORY[0x1E0C808D0], 1);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __86__DMCBackgroundActivityManager_scheduleOneShotActivity_interval_gracePeriod_callback___block_invoke;
  v22[3] = &unk_1E4D36FF0;
  v23 = v12;
  v24 = v10;
  v20 = v10;
  v21 = v12;
  xpc_activity_register(v13, v19, v22);

}

void __86__DMCBackgroundActivityManager_scheduleOneShotActivity_interval_gracePeriod_callback___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (xpc_activity_should_defer(v3))
  {
    v4 = xpc_activity_set_state(v3, 3);
    v5 = DMCLogObjects()[1];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v6;
      v14 = 1024;
      v15 = v4;
      v7 = "Background activity fired but deferred. name %@ result %i";
LABEL_9:
      _os_log_impl(&dword_1A4951000, v5, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v12, 0x12u);
    }
  }
  else if (xpc_activity_get_state(v3) == 2)
  {
    v8 = DMCLogObjects()[1];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_1A4951000, v8, OS_LOG_TYPE_INFO, "Background activity ready to run. name %@", (uint8_t *)&v12, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v10 = xpc_activity_set_state(v3, 5);
    v5 = DMCLogObjects()[1];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v11;
      v14 = 1024;
      v15 = v10;
      v7 = "Background activity done. name %@ result %i";
      goto LABEL_9;
    }
  }

}

+ (void)cancelActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[DMCBackgroundActivityManager sharedInstance](DMCBackgroundActivityManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v3);

  v6 = objc_retainAutorelease(v3);
  v7 = (const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4);
  v8 = DMCLogObjects()[1];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1A4951000, v8, OS_LOG_TYPE_DEBUG, "Background activity canceled. name %@", (uint8_t *)&v9, 0xCu);
  }
  xpc_activity_unregister(v7);

}

- (NSMutableDictionary)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
  objc_storeStrong((id *)&self->_activities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activities, 0);
}

@end
