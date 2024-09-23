@implementation ABDeviceRegisterCallbackForFirstUnlock

uint64_t __ABDeviceRegisterCallbackForFirstUnlock_block_invoke(uint64_t result)
{
  uint64_t v1;
  const char *v2;
  NSObject *global_queue;
  _QWORD v4[5];
  int out_token;

  if (__isBeforeFirstUnlockWithDataProtected)
  {
    v1 = result;
    result = objc_msgSend(MEMORY[0x1E0D13AB8], "isDevicePasscodeProtected");
    if ((result & 1) != 0)
    {
      result = objc_msgSend(MEMORY[0x1E0D13AB8], "isDeviceUnlockedSinceBoot");
      __isBeforeFirstUnlockWithDataProtected = result ^ 1;
      if ((result & 1) == 0)
      {
        out_token = 0;
        v2 = (const char *)objc_msgSend(MEMORY[0x1E0D13AB8], "firstUnlockNotificationID");
        global_queue = dispatch_get_global_queue(0, 0);
        v4[0] = MEMORY[0x1E0C809B0];
        v4[1] = 3221225472;
        v4[2] = __ABDeviceRegisterCallbackForFirstUnlock_block_invoke_2;
        v4[3] = &__block_descriptor_40_e8_v12__0i8l;
        v4[4] = *(_QWORD *)(v1 + 32);
        return notify_register_dispatch(v2, &out_token, global_queue, v4);
      }
    }
    else
    {
      __isBeforeFirstUnlockWithDataProtected = 0;
    }
  }
  return result;
}

uint64_t __ABDeviceRegisterCallbackForFirstUnlock_block_invoke_2(uint64_t a1, int token)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t state64;

  state64 = 0;
  notify_get_state(token, &state64);
  if (!__isBeforeFirstUnlockWithDataProtected)
    goto LABEL_6;
  if ((objc_msgSend(MEMORY[0x1E0D13AB8], "isDevicePasscodeProtected") & 1) == 0)
  {
    __isBeforeFirstUnlockWithDataProtected = 0;
    goto LABEL_6;
  }
  result = objc_msgSend(MEMORY[0x1E0D13AB8], "isDeviceUnlockedSinceBoot");
  __isBeforeFirstUnlockWithDataProtected = result ^ 1;
  if (((result ^ 1) & 1) == 0)
  {
LABEL_6:
    ABDiagnosticsEnabled();
    _ABLog2(4, (uint64_t)"void ABDeviceRegisterCallbackForFirstUnlock(void (*)(void))_block_invoke_2", 42, 0, (uint64_t)CFSTR("Invoking callback for first unlock"), v4, v5, v6, v7);
    return (*(uint64_t (**)(void))(a1 + 32))();
  }
  return result;
}

@end
