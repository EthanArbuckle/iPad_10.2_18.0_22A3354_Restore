@implementation ICAccount(Management)

+ (void)newAccountWithIdentifier:()Management type:context:persistentStore:.cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, v4, "nil context passed to %@, returning nil", v5);

  OUTLINED_FUNCTION_4_0();
}

+ (void)deleteAccount:()Management .cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, (uint64_t)v0, "Error removing account files subdirectory %@ %@", v1);
  OUTLINED_FUNCTION_1_0();
}

+ (void)deleteAccount:()Management .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, v4, "Deleting modern account %@", v5);

  OUTLINED_FUNCTION_4_0();
}

+ (void)deleteAccountWithBatchDelete:()Management .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error saving after account deletion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)deleteAccountWithBatchDelete:()Management .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Falling back to non-batch deletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)deleteAccountWithBatchDelete:()Management .cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error deleting account with batch deletion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)cloudKitAccountInContext:()Management .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Fetching account for primary iCloud Apple Account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)cloudKitAccountInContext:()Management .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Not fetching account for primary iCloud Apple Account because Notes data class is disabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)cloudKitAccountInContext:()Management .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Refetching account for primary iCloud Apple Account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)cloudKitAccountInContext:()Management .cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Account for primary iCloud Apple Account has been deleted — returning nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)cloudKitAccountInContext:()Management .cold.5(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a3, (uint64_t)a3, "Retrieved primary iCloud Apple Account {identifier: %@}", (uint8_t *)a2);

}

+ (void)defaultAccountInContext:()Management .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Default account (%@) via Settings didn't match CK Account or Local Account.", v2);
  OUTLINED_FUNCTION_1_0();
}

+ (void)defaultAccountInContext:()Management .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Overriding default account ID for testing {accountID: %@}", v2);
  OUTLINED_FUNCTION_1_0();
}

+ (void)defaultAccountInContext:()Management .cold.3(const __CFString *a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("NULL");
  if (a1)
    v3 = a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, a3, "Got account Id (%@) via Settings", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

+ (void)numberOfCloudKitAccountsInContext:()Management onlyMigrated:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error counting CK account: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)clearAccountForAppleCloudKitTable
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Clearing cache for account table.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
