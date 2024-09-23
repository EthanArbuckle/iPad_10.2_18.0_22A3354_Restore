@implementation AXPutPidOnTimeoutProbation

void ___AXPutPidOnTimeoutProbation_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = *(unsigned int *)(a1 + 32);
  v2 = *(unsigned int *)(a1 + 36);
  os_unfair_lock_lock(&gAXTimeoutProbationPidsLock);
  +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeoutProbationPidsForDisplay:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (v6)
  {
    +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeoutProbationPidsForDisplay:", v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v9);

    AXRuntimeLogPID();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11[0] = 67109120;
      v11[1] = v1;
      _os_log_impl(&dword_1B54A6000, v10, OS_LOG_TYPE_INFO, "Pid off timeout probation %d", (uint8_t *)v11, 8u);
    }

  }
  os_unfair_lock_unlock(&gAXTimeoutProbationPidsLock);
}

@end
