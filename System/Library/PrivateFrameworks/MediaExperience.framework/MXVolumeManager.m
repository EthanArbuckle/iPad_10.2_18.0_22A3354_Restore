@implementation MXVolumeManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11 != -1)
    dispatch_once(&sharedInstance_onceToken_11, &__block_literal_global_64);
  return (id)sharedInstance_sSharedInstance_9;
}

MXVolumeManager *__33__MXVolumeManager_sharedInstance__block_invoke()
{
  MXVolumeManager *result;

  result = objc_alloc_init(MXVolumeManager);
  sharedInstance_sSharedInstance_9 = (uint64_t)result;
  return result;
}

- (MXVolumeManager)init
{
  MXVolumeManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MXVolumeManager;
  result = -[MXVolumeManager init](&v3, sel_init);
  if (result)
    result->mTimerDuration = 3600;
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)MEMORY[0x194035B20](self, a2);
  v4.receiver = self;
  v4.super_class = (Class)MXVolumeManager;
  -[MXVolumeManager dealloc](&v4, sel_dealloc);
  objc_autoreleasePoolPop(v3);
}

+ (void)applyVolumeReductionToHeadphoneRoutes:(float)a3
{
  NSObject *v4;
  _QWORD v5[4];
  float v6;

  v4 = MXGetSerialQueue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__MXVolumeManager_applyVolumeReductionToHeadphoneRoutes___block_invoke;
  v5[3] = &__block_descriptor_36_e5_v8__0l;
  v6 = a3;
  MXDispatchAsyncAndWait((uint64_t)"+[MXVolumeManager applyVolumeReductionToHeadphoneRoutes:]", (uint64_t)"MXVolumeManager.m", 80, 0, 0, v4, (uint64_t)v5);
}

void __57__MXVolumeManager_applyVolumeReductionToHeadphoneRoutes___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  PVMApplyVolumeReductionToHeadphoneRoutes(*(float *)(a1 + 32));
}

@end
