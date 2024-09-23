@implementation BRCAccountSession(DatabaseAdditions)

- (void)_getFPFSMigrationStatus:()DatabaseAdditions withError:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _clientState%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)dumpFPFSMigrationStatusToFileHandle:()DatabaseAdditions tracker:includeNonMigratedItems:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx dumping FPFS migration status%@");
  OUTLINED_FUNCTION_2();
}

- (void)enumerateSharedToMeItemsWithBlock:()DatabaseAdditions error:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_1CBD43000, a2, a3, "[ERROR] Command is not supported for FPFS databases%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)dumpDatabaseToFileHandle:()DatabaseAdditions zoneName:includeAllItems:verbose:tracker:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx dumping database%@");
  OUTLINED_FUNCTION_2();
}

@end
