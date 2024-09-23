@implementation MX_NetworkObserver

- (MX_NetworkObserver)init
{
  MX_NetworkObserver *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MX_NetworkObserver;
  v2 = -[MX_NetworkObserver init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_create("com.apple.coremedia.networkobserver", v3);
    v2->mAccessQueue = (OS_dispatch_queue *)v4;
    v5 = MEMORY[0x1E0C809B0];
    v2->mNetworkReachable = 0;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __26__MX_NetworkObserver_init__block_invoke;
    block[3] = &unk_1E3099900;
    block[4] = v2;
    dispatch_async(v4, block);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  OS_nw_path_monitor *mMonitor;
  void *v5;
  void *v6;
  OS_nw_path *mCurrentPath;
  NSObject *mAccessQueue;
  _Unwind_Exception *v9;
  objc_super v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  v3 = (void *)MEMORY[0x194035B20](self, a2);
  mMonitor = self->mMonitor;
  if (mMonitor)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v5 = getnw_path_monitor_cancelSymbolLoc_ptr;
    v14 = getnw_path_monitor_cancelSymbolLoc_ptr;
    if (!getnw_path_monitor_cancelSymbolLoc_ptr)
    {
      v6 = (void *)NetworkLibrary();
      v5 = dlsym(v6, "nw_path_monitor_cancel");
      v12[3] = (uint64_t)v5;
      getnw_path_monitor_cancelSymbolLoc_ptr = v5;
    }
    _Block_object_dispose(&v11, 8);
    if (!v5)
    {
      v9 = (_Unwind_Exception *)__68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke_cold_1();
      _Block_object_dispose(&v11, 8);
      _Unwind_Resume(v9);
    }
    ((void (*)(OS_nw_path_monitor *))v5)(mMonitor);
    soft_nw_release((uint64_t)self->mMonitor);
  }
  mCurrentPath = self->mCurrentPath;
  if (mCurrentPath)
    soft_nw_release((uint64_t)mCurrentPath);
  mAccessQueue = self->mAccessQueue;
  if (mAccessQueue)
    dispatch_release(mAccessQueue);
  v10.receiver = self;
  v10.super_class = (Class)MX_NetworkObserver;
  -[MX_NetworkObserver dealloc](&v10, sel_dealloc);
  objc_autoreleasePoolPop(v3);
}

- (void)networkPathUpdate:(id)a3
{
  int mNetworkReachable;
  OS_nw_path *mCurrentPath;
  void *v7;
  void *v8;
  OS_nw_path *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    mNetworkReachable = self->mNetworkReachable;
    mCurrentPath = self->mCurrentPath;
    if (mCurrentPath)
    {
      soft_nw_release((uint64_t)mCurrentPath);
      self->mCurrentPath = 0;
    }
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v7 = getnw_retainSymbolLoc_ptr;
    v18 = getnw_retainSymbolLoc_ptr;
    if (!getnw_retainSymbolLoc_ptr)
    {
      v8 = (void *)NetworkLibrary();
      v7 = dlsym(v8, "nw_retain");
      v16[3] = (uint64_t)v7;
      getnw_retainSymbolLoc_ptr = v7;
    }
    _Block_object_dispose(&v15, 8);
    if (!v7)
      goto LABEL_16;
    v9 = (OS_nw_path *)((uint64_t (*)(id))v7)(a3);
    self->mCurrentPath = v9;
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v10 = getnw_path_get_statusSymbolLoc_ptr;
    v18 = getnw_path_get_statusSymbolLoc_ptr;
    if (!getnw_path_get_statusSymbolLoc_ptr)
    {
      v11 = (void *)NetworkLibrary();
      v10 = dlsym(v11, "nw_path_get_status");
      v16[3] = (uint64_t)v10;
      getnw_path_get_statusSymbolLoc_ptr = v10;
    }
    _Block_object_dispose(&v15, 8);
    if (!v10)
    {
LABEL_16:
      __68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke_cold_1();
      __break(1u);
    }
    v12 = (((uint64_t (*)(OS_nw_path *))v10)(v9) & 0xFFFFFFFD) == 1;
    self->mNetworkReachable = v12;
    if (mNetworkReachable != v12 && dword_1EE2B3F38 != 0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (BOOL)isCarrierNetworkReachable
{
  NSObject *mAccessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  mAccessQueue = self->mAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__MX_NetworkObserver_isCarrierNetworkReachable__block_invoke;
  v5[3] = &unk_1E309CCA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_async_and_wait(mAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end
