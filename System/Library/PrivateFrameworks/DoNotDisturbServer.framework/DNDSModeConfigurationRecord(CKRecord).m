@implementation DNDSModeConfigurationRecord(CKRecord)

+ (void)dictionaryRepresentationWithCKRecord:()CKRecord partitionType:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_1CB895000, v5, OS_LOG_TYPE_ERROR, "%@ partition data is nil in record data %{public}@", (uint8_t *)&v8, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

- (void)populateCKRecord:()CKRecord lastChanceRecord:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1CB895000, v0, v1, "Partition: %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)populateCKRecord:()CKRecord lastChanceRecord:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1CB895000, v0, v1, "Dictionary: %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)populateCKRecord:()CKRecord lastChanceRecord:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1CB895000, v0, v1, "Configuration: %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)populateCKRecord:()CKRecord lastChanceRecord:.cold.4(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1CB895000, v3, v6, "Record %{public}@ is not valid JSON", v7);

  OUTLINED_FUNCTION_1_1();
}

@end
