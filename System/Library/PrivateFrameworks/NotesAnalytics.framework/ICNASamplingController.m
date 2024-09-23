@implementation ICNASamplingController

+ (id)sharedController
{
  if (s_onceToken_1 != -1)
    dispatch_once(&s_onceToken_1, &__block_literal_global_5);
  return (id)sharedController_s_instance;
}

void __42__ICNASamplingController_sharedController__block_invoke()
{
  ICNASamplingController *v0;
  void *v1;

  v0 = objc_alloc_init(ICNASamplingController);
  v1 = (void *)sharedController_s_instance;
  sharedController_s_instance = (uint64_t)v0;

}

- (ICNASamplingController)init
{
  ICNASamplingController *v2;
  uint32_t v3;
  NSObject *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNASamplingController;
  v2 = -[ICNASamplingController init](&v6, sel_init);
  if (v2)
  {
    v3 = arc4random();
    v2->_shouldTrackSyncHealth = 1;
    v4 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[ICNASamplingController init].cold.1(v3, (unsigned __int8 *)&v2->_shouldTrackSyncHealth, v4);

  }
  return v2;
}

- (BOOL)shouldTrackSyncHealth
{
  return self->_shouldTrackSyncHealth;
}

- (void)init
{
  int v3;
  const __CFString *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v6 = 0x3FF0000000000000;
  v5 = 134218498;
  if (v3)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v7 = 2048;
  v8 = a1 % 0x64;
  v9 = 2112;
  v10 = v4;
  _os_log_debug_impl(&dword_1BDCEC000, log, OS_LOG_TYPE_DEBUG, "Sync Health Tracking Sampling Ratio = %f, generated random number %lu, decision = %@", (uint8_t *)&v5, 0x20u);
}

@end
