@implementation RegisterForLockedStatusChangeIfNecessary

uint64_t ___RegisterForLockedStatusChangeIfNecessary_block_invoke()
{
  return notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)&_RegisterForLockedStatusChangeIfNecessary_notifyToken, MEMORY[0x24BDAC9B8], &__block_literal_global_499);
}

void ___RegisterForLockedStatusChangeIfNecessary_block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[CLKDevice currentDevice](CLKDevice, "currentDevice");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = MKBGetDeviceLockState();
  if ((_DWORD)v0 != objc_msgSend(v2, "cachedKeybagLockState"))
  {
    objc_msgSend(v2, "setCachedKeybagLockState:", v0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "postNotificationName:object:", CFSTR("CLKDeviceLockStateChangedNotification"), 0);

  }
}

@end
