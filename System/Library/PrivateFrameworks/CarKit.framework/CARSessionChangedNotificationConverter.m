@implementation CARSessionChangedNotificationConverter

void __56__CARSessionChangedNotificationConverter_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;

}

- (CARSessionChangedNotificationConverter)init
{
  CARSessionChangedNotificationConverter *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CARSessionChangedNotificationConverter;
  v2 = -[CARSessionChangedNotificationConverter init](&v13, sel_init);
  if (v2)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    v3 = CMNotificationCenterAddListener();
    if ((_DWORD)v3)
    {
      v4 = v3;
      CarGeneralLogging();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[CARSessionChangedNotificationConverter init].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    }
  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CARSessionChangedNotificationConverter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance_instance;
}

- (void)dealloc
{
  objc_super v3;

  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  v3.receiver = self;
  v3.super_class = (Class)CARSessionChangedNotificationConverter;
  -[CARSessionChangedNotificationConverter dealloc](&v3, sel_dealloc);
}

- (void)init
{
  OUTLINED_FUNCTION_11(&dword_1A83A2000, a2, a3, "failed to register with CMNotificationCenter, error %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
