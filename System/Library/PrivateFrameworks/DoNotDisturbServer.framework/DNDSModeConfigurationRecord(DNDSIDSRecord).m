@implementation DNDSModeConfigurationRecord(DNDSIDSRecord)

+ (void)newWithDNDSIDSRecord:()DNDSIDSRecord currentRecord:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend(a2, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1CB895000, v3, v6, "Record data is nil in record data %{public}@", v7);

  OUTLINED_FUNCTION_1_1();
}

+ (void)newWithDNDSIDSRecord:()DNDSIDSRecord currentRecord:.cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend(a2, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1CB895000, v3, v6, "Partioned record data is nil in record data %{public}@", v7);

  OUTLINED_FUNCTION_1_1();
}

+ (void)newWithDNDSIDSRecord:()DNDSIDSRecord currentRecord:.cold.3(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend(a2, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1CB895000, v6, v7, "Failed to decode partitioned record data %{public}@: %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

+ (void)newWithDNDSIDSRecord:()DNDSIDSRecord currentRecord:.cold.4(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend(a2, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1CB895000, v6, v7, "Failed to decode record data %{public}@: %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

- (void)populateDNDSIDSRecord:()DNDSIDSRecord .cold.4(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend(a2, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1CB895000, v3, v6, "Record %{public}@ is not valid JSON", v7);

  OUTLINED_FUNCTION_1_1();
}

@end
