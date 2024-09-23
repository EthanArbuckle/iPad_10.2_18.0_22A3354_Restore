@implementation NTKDActivityTracker

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11 != -1)
    dispatch_once(&sharedInstance_onceToken_11, &__block_literal_global_80_0);
  return (id)sharedInstance___tracker;
}

void __37__NTKDActivityTracker_sharedInstance__block_invoke()
{
  NTKDActivityTracker *v0;
  void *v1;

  v0 = objc_alloc_init(NTKDActivityTracker);
  v1 = (void *)sharedInstance___tracker;
  sharedInstance___tracker = (uint64_t)v0;

}

- (NTKDActivityTracker)init
{
  NTKDActivityTracker *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSMutableSet *v5;
  NSMutableSet *activityIdentifiers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKDActivityTracker;
  v2 = -[NTKDActivityTracker init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.nanotimekit.daemon-activity-queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activityIdentifiers = v2->_activityIdentifiers;
    v2->_activityIdentifiers = v5;

  }
  return v2;
}

- (void)beginActivity:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__NTKDActivityTracker_beginActivity___block_invoke;
  v7[3] = &unk_1E6BCD778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __37__NTKDActivityTracker_beginActivity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_beginActivity:", *(_QWORD *)(a1 + 40));
}

- (void)endActivity:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__NTKDActivityTracker_endActivity___block_invoke;
  v7[3] = &unk_1E6BCD778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __35__NTKDActivityTracker_endActivity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_endActivity:", *(_QWORD *)(a1 + 40));
}

- (void)checkin
{
  NSObject *queue;
  _QWORD block[5];

  xpc_activity_register("com.apple.nanotimekit.daemon-activity", (xpc_object_t)*MEMORY[0x1E0C80748], &__block_literal_global_85);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__NTKDActivityTracker_checkin__block_invoke_91;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __30__NTKDActivityTracker_checkin__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v2;
  NSObject *v3;
  xpc_activity_state_t state;
  const char *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _NTKLoggingObjectForDomain(16, (uint64_t)"NTKLoggingDomainDaemonActivity");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    state = xpc_activity_get_state(v2);
    v5 = "checkin";
    if (state == 2)
      v5 = "run";
    v6 = 136315138;
    v7 = v5;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "checkin complete with state = %s", (uint8_t *)&v6, 0xCu);
  }

}

void __30__NTKDActivityTracker_checkin__block_invoke_91(uint64_t a1)
{
  dispatch_source_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD handler[5];

  objc_msgSend(*(id *)(a1 + 32), "_queue_beginActivity:", CFSTR("guard-early-jetsam"));
  v2 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v6 = dispatch_time(0, 15000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 32);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __30__NTKDActivityTracker_checkin__block_invoke_2;
  handler[3] = &unk_1E6BCD5F0;
  handler[4] = v7;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 32));
}

uint64_t __30__NTKDActivityTracker_checkin__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_queue_endActivity:", CFSTR("guard-early-jetsam"));
}

- (void)_queue_beginActivity:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(16, (uint64_t)"NTKLoggingDomainDaemonActivity");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "begin activity '%@'", (uint8_t *)&v6, 0xCu);
  }

  -[NSMutableSet addObject:](self->_activityIdentifiers, "addObject:", v4);
  if (!self->_xpcActivityRegistered)
    -[NTKDActivityTracker _queue_setOrUpdateActivityAndTimer](self, "_queue_setOrUpdateActivityAndTimer");

}

- (void)_queue_endActivity:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *adjustCriteriaTimer;
  OS_dispatch_source *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(16, (uint64_t)"NTKLoggingDomainDaemonActivity");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "end activity '%@'", (uint8_t *)&v9, 0xCu);
  }

  -[NSMutableSet removeObject:](self->_activityIdentifiers, "removeObject:", v4);
  if (self->_xpcActivityRegistered && !-[NSMutableSet count](self->_activityIdentifiers, "count"))
  {
    _NTKLoggingObjectForDomain(16, (uint64_t)"NTKLoggingDomainDaemonActivity");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "unregistering xpc activity", (uint8_t *)&v9, 2u);
    }

    xpc_activity_unregister("com.apple.nanotimekit.daemon-activity");
    self->_xpcActivityRegistered = 0;
    adjustCriteriaTimer = self->_adjustCriteriaTimer;
    if (adjustCriteriaTimer)
    {
      dispatch_source_cancel(adjustCriteriaTimer);
      v8 = self->_adjustCriteriaTimer;
      self->_adjustCriteriaTimer = 0;

    }
  }

}

- (void)_queue_setOrUpdateActivityAndTimer
{
  NSObject *v3;
  xpc_object_t v4;
  uint64_t v5;
  NSObject *adjustCriteriaTimer;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD handler[5];
  uint8_t buf[16];

  _NTKLoggingObjectForDomain(16, (uint64_t)"NTKLoggingDomainDaemonActivity");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "scheduling xpc activity for 5 minutes from now", buf, 2u);
  }

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C80760], *MEMORY[0x1E0C807E0]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80898], 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C80790], *MEMORY[0x1E0C807C8]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  v5 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __57__NTKDActivityTracker__queue_setOrUpdateActivityAndTimer__block_invoke;
  handler[3] = &unk_1E6BD3168;
  handler[4] = self;
  xpc_activity_register("com.apple.nanotimekit.daemon-activity", v4, handler);
  self->_xpcActivityRegistered = 1;
  adjustCriteriaTimer = self->_adjustCriteriaTimer;
  if (adjustCriteriaTimer)
  {
    dispatch_source_cancel(adjustCriteriaTimer);
    v7 = self->_adjustCriteriaTimer;
    self->_adjustCriteriaTimer = 0;

  }
  v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  v9 = self->_adjustCriteriaTimer;
  self->_adjustCriteriaTimer = v8;

  v10 = self->_adjustCriteriaTimer;
  v11 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  v12 = self->_adjustCriteriaTimer;
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __57__NTKDActivityTracker__queue_setOrUpdateActivityAndTimer__block_invoke_2;
  v13[3] = &unk_1E6BCD5F0;
  v13[4] = self;
  dispatch_source_set_event_handler(v12, v13);
  dispatch_resume((dispatch_object_t)self->_adjustCriteriaTimer);

}

void __57__NTKDActivityTracker__queue_setOrUpdateActivityAndTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  _NTKLoggingObjectForDomain(16, (uint64_t)"NTKLoggingDomainDaemonActivity");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "xpc activity handler unexpectedly invoked -- we should have adjusted it further into the future before it fired", buf, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__NTKDActivityTracker__queue_setOrUpdateActivityAndTimer__block_invoke_92;
  block[3] = &unk_1E6BCD5F0;
  block[4] = v3;
  dispatch_async(v4, block);
}

uint64_t __57__NTKDActivityTracker__queue_setOrUpdateActivityAndTimer__block_invoke_92(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setOrUpdateActivityAndTimer");
}

_BYTE *__57__NTKDActivityTracker__queue_setOrUpdateActivityAndTimer__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _BYTE *result;
  uint8_t v6[16];

  _NTKLoggingObjectForDomain(16, (uint64_t)"NTKLoggingDomainDaemonActivity");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "adjust xpc activity criteria timer fired", v6, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;

  result = *(_BYTE **)(a1 + 32);
  if (result[40])
    return (_BYTE *)objc_msgSend(result, "_queue_setOrUpdateActivityAndTimer");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removePostWakeActivityTimer, 0);
  objc_storeStrong((id *)&self->_adjustCriteriaTimer, 0);
  objc_storeStrong((id *)&self->_activityIdentifiers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
