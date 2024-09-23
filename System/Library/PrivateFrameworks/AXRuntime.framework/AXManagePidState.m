@implementation AXManagePidState

void ___AXManagePidState_block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = *(unsigned int *)(a1 + 40);
  v2 = *(id *)(a1 + 32);
  os_unfair_lock_lock(&gAXSuspendedPidsLock);
  +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tentativeSuspendedPidsForDisplay:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v2);

  if (v5)
  {
    +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tentativeSuspendedPidsForDisplay:", v1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v2);

    _AXRemoveSuspendedPid(objc_msgSend(v2, "intValue"), v1);
  }
  os_unfair_lock_unlock(&gAXSuspendedPidsLock);
  AXRuntimeLogPID();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = v5;
    _os_log_impl(&dword_1B54A6000, v8, OS_LOG_TYPE_INFO, "Should unsuspend tentative PID? %ld", (uint8_t *)&v9, 0xCu);
  }

}

@end
