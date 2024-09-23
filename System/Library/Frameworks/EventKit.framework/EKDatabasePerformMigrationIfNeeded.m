@implementation EKDatabasePerformMigrationIfNeeded

void __EKDatabasePerformMigrationIfNeeded_block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;

  if (a2)
  {
    v3 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __EKDatabasePerformMigrationIfNeeded_block_invoke_cold_1(a2, v3);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
}

void __EKDatabasePerformMigrationIfNeeded_block_invoke_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A2318000, a2, OS_LOG_TYPE_ERROR, "Migration returned error code %d", (uint8_t *)v2, 8u);
}

@end
