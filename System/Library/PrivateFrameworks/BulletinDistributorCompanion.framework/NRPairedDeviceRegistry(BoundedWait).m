@implementation NRPairedDeviceRegistry(BoundedWait)

+ (id)blt_boundedWaitForActivePairedDevice
{
  id v0;
  NSObject *v1;
  void *v2;

  if (blt_boundedWaitForActivePairedDevice_onceToken != -1)
    dispatch_once(&blt_boundedWaitForActivePairedDevice_onceToken, &__block_literal_global_2);
  os_unfair_lock_lock((os_unfair_lock_t)&blt_boundedWaitForActivePairedDevice_deviceLock);
  v0 = (id)blt_boundedWaitForActivePairedDevice_device;
  os_unfair_lock_unlock((os_unfair_lock_t)&blt_boundedWaitForActivePairedDevice_deviceLock);
  if (!v0)
  {
    blt_general_log();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      +[NRPairedDeviceRegistry(BoundedWait) blt_boundedWaitForActivePairedDevice].cold.1(v1);

    objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "getActivePairedDevice");
    v0 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v0;
}

+ (void)blt_boundedWaitForActivePairedDevice
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2173D9000, log, OS_LOG_TYPE_ERROR, "Still waiting on active paired device. Checking NRPairedDeviceRegistry getActivePairedDevice instead.", v1, 2u);
}

@end
