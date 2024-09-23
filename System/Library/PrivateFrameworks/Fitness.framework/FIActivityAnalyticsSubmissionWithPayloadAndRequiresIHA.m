@implementation FIActivityAnalyticsSubmissionWithPayloadAndRequiresIHA

id __FIActivityAnalyticsSubmissionWithPayloadAndRequiresIHA_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_21168F000, v2, OS_LOG_TYPE_DEFAULT, "[#analytics] submission for event: %@, payload: %@", (uint8_t *)&v6, 0x16u);
  }
  return *(id *)(a1 + 40);
}

@end
