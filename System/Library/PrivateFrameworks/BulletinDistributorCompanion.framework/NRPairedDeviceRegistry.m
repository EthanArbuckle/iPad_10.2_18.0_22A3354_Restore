@implementation NRPairedDeviceRegistry

void __75__NRPairedDeviceRegistry_BoundedWait__blt_boundedWaitForActivePairedDevice__block_invoke()
{
  dispatch_semaphore_t v0;
  NSObject *v1;
  NSObject *v2;
  dispatch_time_t v3;
  NSObject *v4;
  uint8_t v5[8];
  _QWORD block[4];
  NSObject *v7;

  v0 = dispatch_semaphore_create(0);
  v1 = dispatch_queue_create("BLTBoundedWaitForActivePairedDevice", 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__NRPairedDeviceRegistry_BoundedWait__blt_boundedWaitForActivePairedDevice__block_invoke_2;
  block[3] = &unk_24D761AD0;
  v2 = v0;
  v7 = v2;
  dispatch_async(v1, block);
  v3 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v2, v3))
  {
    blt_general_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2173D9000, v4, OS_LOG_TYPE_FAULT, "Timed out calling -[NRPairedDeviceRegistry waitForActivePairedDevice].", v5, 2u);
    }

  }
}

void __75__NRPairedDeviceRegistry_BoundedWait__blt_boundedWaitForActivePairedDevice__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitForActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock((os_unfair_lock_t)&blt_boundedWaitForActivePairedDevice_deviceLock);
  v4 = (void *)blt_boundedWaitForActivePairedDevice_device;
  blt_boundedWaitForActivePairedDevice_device = (uint64_t)v3;
  v5 = v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&blt_boundedWaitForActivePairedDevice_deviceLock);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
