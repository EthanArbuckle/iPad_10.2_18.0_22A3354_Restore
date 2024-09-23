@implementation SOSCCGhostBustTriggerTimed

void __SOSCCGhostBustTriggerTimed_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope("ghostbust");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "API Trigger Timed returned: %d", (uint8_t *)v7, 8u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
