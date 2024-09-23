@implementation SYChange(SYSessionAdditions)

+ (void)changeWithChangeObject:()SYSessionAdditions serializer:encodeUsingVersion:.cold.1(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = 1;
  _os_log_error_impl(&dword_211704000, log, OS_LOG_TYPE_ERROR, "SYChangeSerializer doesn't support -encodeSYChangeForBackwardCompatibility:protocolVersion:, but I'm being asked to encode a change for version %d", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_3_1();
}

+ (void)changeWithChangeObject:()SYSessionAdditions serializer:encodeUsingVersion:.cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  _SYObfuscate(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_211704000, v3, OS_LOG_TYPE_ERROR, "SYChange object %{public}@ does not provide the required objectIdentifier!", (uint8_t *)&v5, 0xCu);

}

- (void)changeObjectWithSerializer:()SYSessionAdditions .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_211704000, a1, a3, "Nil data for SYObject, cannot decode", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_1();
}

@end
