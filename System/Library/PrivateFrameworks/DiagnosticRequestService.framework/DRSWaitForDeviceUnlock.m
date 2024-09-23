@implementation DRSWaitForDeviceUnlock

uint64_t __DRSWaitForDeviceUnlock_block_invoke()
{
  uint64_t result;
  NSObject *v1;
  NSObject *v2;
  uint8_t v3[16];

  result = MKBDeviceUnlockedSinceBoot();
  if ((_DWORD)result != 1)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)gDRSServiceFirstUnlockSem, 0xFFFFFFFFFFFFFFFFLL);
    result = MKBDeviceUnlockedSinceBoot();
    if ((_DWORD)result != 1)
    {
      DPLogHandle_ServiceXPCError();
      v1 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v1))
      {
        *(_WORD *)v3 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v1, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UnexpectedFirstUnlockNotification", "FATAL ERROR: Service was notified of device unlock, but confirmation of unlock failed", v3, 2u);
      }

      DPLogHandle_ServiceXPCError();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
        __DRSWaitForDeviceUnlock_block_invoke_cold_1(v2);

      exit(1);
    }
  }
  return result;
}

void __DRSWaitForDeviceUnlock_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DBB92000, log, OS_LOG_TYPE_FAULT, "FATAL ERROR: Service was notified of device unlock, but confirmation of unlock failed", v1, 2u);
}

@end
