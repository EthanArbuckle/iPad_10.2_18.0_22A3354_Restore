@implementation BRCMetricEndpoint

- (BRCMetricEndpoint)initWithSession:(id)a3
{
  void *v4;
  NSObject *v5;

  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[BRCMetricEndpoint initWithSession:].cold.1();

  return 0;
}

- (void)initWithSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: needs override%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
