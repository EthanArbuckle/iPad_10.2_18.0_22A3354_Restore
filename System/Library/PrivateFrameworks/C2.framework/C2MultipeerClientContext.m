@implementation C2MultipeerClientContext

- (C2MultipeerClientContext)init
{
  C2MultipeerClientContext *v2;
  os_activity_t v3;
  OS_os_activity *osActivity;
  NSMutableSet *v5;
  NSMutableSet *discoveryPeers;
  NSString *chunkDataRequestedFromPeer;
  id chunkDataCallback;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)C2MultipeerClientContext;
  v2 = -[C2MultipeerClientContext init](&v10, sel_init);
  if (v2)
  {
    v3 = _os_activity_create(&dword_1D4DC3000, "c2-chunk-client", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    osActivity = v2->_osActivity;
    v2->_osActivity = (OS_os_activity *)v3;

    v2->_startTimestamp = mach_continuous_time();
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    discoveryPeers = v2->_discoveryPeers;
    v2->_discoveryPeers = v5;

    chunkDataRequestedFromPeer = v2->_chunkDataRequestedFromPeer;
    v2->_chunkDataRequestedFromPeer = 0;

    chunkDataCallback = v2->_chunkDataCallback;
    v2->_chunkDataCallback = 0;

  }
  return v2;
}

- (void)startTimerOnQueue:(id)a3
{
  OS_dispatch_source *v4;
  OS_dispatch_source *timeoutTrigger;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD handler[5];

  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)a3);
  timeoutTrigger = self->_timeoutTrigger;
  self->_timeoutTrigger = v4;

  v6 = self->_timeoutTrigger;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __46__C2MultipeerClientContext_startTimerOnQueue___block_invoke;
  handler[3] = &unk_1E98986D0;
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);
  v7 = self->_timeoutTrigger;
  v8 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_timeoutTrigger);
}

void __46__C2MultipeerClientContext_startTimerOnQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[8];
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    if (C2_MULTIPEER_LOG_BLOCK != -1)
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK, &__block_literal_global_0);
    v2 = C2_MULTIPEER_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D4DC3000, v2, OS_LOG_TYPE_INFO, "timeout triggered while waiting for chunk data response.", v11, 2u);
    }
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2D50];
      v15[0] = CFSTR("timeout triggered while waiting for chunk data response.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v4;
      v7 = 201;
LABEL_14:
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("C2MultipeerErrorDomain"), v7, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v10);

    }
  }
  else
  {
    if (C2_MULTIPEER_LOG_BLOCK != -1)
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK, &__block_literal_global_9);
    v8 = C2_MULTIPEER_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D4DC3000, v8, OS_LOG_TYPE_INFO, "timeout triggered while waiting for discovery response.", v11, 2u);
    }
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    if (v3)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2D50];
      v13 = CFSTR("timeout triggered while waiting for discovery response.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      v7 = 200;
      goto LABEL_14;
    }
  }
}

void __46__C2MultipeerClientContext_startTimerOnQueue___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL;
  C2_MULTIPEER_LOG_INTERNAL = (uint64_t)v0;

}

void __46__C2MultipeerClientContext_startTimerOnQueue___block_invoke_8()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL;
  C2_MULTIPEER_LOG_INTERNAL = (uint64_t)v0;

}

- (void)resetTimerForDiscovery
{
  NSObject *timeoutTrigger;
  dispatch_time_t v3;

  timeoutTrigger = self->_timeoutTrigger;
  v3 = dispatch_time(0, 200000000);
  dispatch_source_set_timer(timeoutTrigger, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)resetTimerForChunkData
{
  NSObject *timeoutTrigger;
  dispatch_time_t v3;

  timeoutTrigger = self->_timeoutTrigger;
  v3 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(timeoutTrigger, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)stopTimer
{
  NSObject *timeoutTrigger;

  timeoutTrigger = self->_timeoutTrigger;
  if (timeoutTrigger)
    dispatch_source_cancel(timeoutTrigger);
}

- (BOOL)hadFailedToDiscover
{
  BOOL v3;
  void (**chunkDataCallback)(id, _QWORD, void *);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_discoveryPeers, "count") || self->_chunkDataRequestedFromPeer)
    return 0;
  chunkDataCallback = (void (**)(id, _QWORD, void *))self->_chunkDataCallback;
  if (!chunkDataCallback)
    return 1;
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = CFSTR("no peers had requested chunk data.");
  v3 = 1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("C2MultipeerErrorDomain"), 101, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  chunkDataCallback[2](chunkDataCallback, 0, v8);

  return v3;
}

- (OS_os_activity)osActivity
{
  return self->_osActivity;
}

- (void)setOsActivity:(id)a3
{
  objc_storeStrong((id *)&self->_osActivity, a3);
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(unint64_t)a3
{
  self->_startTimestamp = a3;
}

- (NSMutableSet)discoveryPeers
{
  return self->_discoveryPeers;
}

- (void)setDiscoveryPeers:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryPeers, a3);
}

- (NSString)chunkDataRequestedFromPeer
{
  return self->_chunkDataRequestedFromPeer;
}

- (void)setChunkDataRequestedFromPeer:(id)a3
{
  objc_storeStrong((id *)&self->_chunkDataRequestedFromPeer, a3);
}

- (OS_dispatch_source)timeoutTrigger
{
  return self->_timeoutTrigger;
}

- (void)setTimeoutTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTrigger, a3);
}

- (BOOL)hasReplied
{
  return self->_hasReplied;
}

- (void)setHasReplied:(BOOL)a3
{
  self->_hasReplied = a3;
}

- (id)chunkDataCallback
{
  return self->_chunkDataCallback;
}

- (void)setChunkDataCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_chunkDataCallback, 0);
  objc_storeStrong((id *)&self->_timeoutTrigger, 0);
  objc_storeStrong((id *)&self->_chunkDataRequestedFromPeer, 0);
  objc_storeStrong((id *)&self->_discoveryPeers, 0);
  objc_storeStrong((id *)&self->_osActivity, 0);
}

@end
