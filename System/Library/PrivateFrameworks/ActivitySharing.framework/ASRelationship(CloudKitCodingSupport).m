@implementation ASRelationship(CloudKitCodingSupport)

+ (void)_relationshipWithRecord:()CloudKitCodingSupport relationshipEventRecords:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 134218496;
  v3 = a1;
  v4 = 2048;
  v5 = 2;
  v6 = 2048;
  v7 = 3;
  _os_log_error_impl(&dword_21381F000, a2, OS_LOG_TYPE_ERROR, "Relationship record schema version (%ld) is incompatible (compatible versions: %ld, %ld), ignoring.", (uint8_t *)&v2, 0x20u);
}

+ (void)_relationshipWithRecord:()CloudKitCodingSupport relationshipEventRecords:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21381F000, v0, v1, "Relationship does not have any encrypted data, not decoding.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)_relationshipWithRecord:()CloudKitCodingSupport relationshipEventRecords:completion:.cold.3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "relationshipEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "count");
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_3(&dword_21381F000, v3, v5, "Recieved a mismatched number of relationship events when creating relationship, relationship has a count of %lu events and %lu events were found.", v6);

  OUTLINED_FUNCTION_5();
}

+ (void)_relationshipWithRecord:()CloudKitCodingSupport relationshipEventRecords:completion:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_21381F000, v0, v1, "Error decoding system fields: %@", v2);
  OUTLINED_FUNCTION_6();
}

+ (void)relationshipWithCodableRelationship:()CloudKitCodingSupport version:.cold.1(uint8_t *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  NSObject *v6;
  void *v7;
  id v8;

  v6 = a2;
  v7 = (void *)objc_opt_class();
  *(_DWORD *)a1 = 138543362;
  *a4 = v7;
  v8 = v7;
  _os_log_error_impl(&dword_21381F000, v6, OS_LOG_TYPE_ERROR, "Codable relationship contained an event that has class %{public}@", a1, 0xCu);

}

+ (void)relationshipsWithRelationshipAndEventRecords:()CloudKitCodingSupport .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_21381F000, v0, v1, "Unused relationship event records when creating relationship objects: %@", v2);
  OUTLINED_FUNCTION_6();
}

@end
