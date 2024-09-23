@implementation MCMUserIdentitySharedCache

+ (id)sharedInstance
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__MCMUserIdentitySharedCache_sharedInstance__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  if (sharedInstance_onceToken_9030 != -1)
    dispatch_once(&sharedInstance_onceToken_9030, v3);
  return (id)sharedInstance_instance;
}

void __44__MCMUserIdentitySharedCache_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = v0;

}

@end
