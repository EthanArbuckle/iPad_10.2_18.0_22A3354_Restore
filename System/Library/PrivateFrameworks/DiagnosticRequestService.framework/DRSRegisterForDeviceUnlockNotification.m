@implementation DRSRegisterForDeviceUnlockNotification

uint64_t __DRSRegisterForDeviceUnlockNotification_block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(0);
  v1 = (void *)gDRSServiceFirstUnlockSem;
  gDRSServiceFirstUnlockSem = (uint64_t)v0;

  return notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &_block_invoke_firstUnlockToken, MEMORY[0x1E0C80D38], &__block_literal_global_8);
}

uint64_t __DRSRegisterForDeviceUnlockNotification_block_invoke_2()
{
  NSObject *v0;
  uint8_t v2[16];

  DPLogHandle_ServiceLifecycle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v0, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FirstUnlockNotification", (const char *)&unk_1DBC04191, v2, 2u);
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)gDRSServiceFirstUnlockSem);
  return notify_cancel(_block_invoke_firstUnlockToken);
}

@end
