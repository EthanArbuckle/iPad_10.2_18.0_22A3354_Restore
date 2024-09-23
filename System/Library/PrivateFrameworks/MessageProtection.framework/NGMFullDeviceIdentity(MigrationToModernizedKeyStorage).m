@implementation NGMFullDeviceIdentity(MigrationToModernizedKeyStorage)

- (void)deleteKeyWithTag:()MigrationToModernizedKeyStorage .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_20BABB000, a2, OS_LOG_TYPE_FAULT, "Deletion of a keychain item failed for after migration with error: %i", (uint8_t *)v2, 8u);
}

- (void)postMigrationKeychainCleanup
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20BABB000, log, OS_LOG_TYPE_ERROR, "Migration to CTKOID failed.", v1, 2u);
}

@end
