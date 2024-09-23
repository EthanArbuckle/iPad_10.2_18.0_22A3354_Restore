@implementation BLTCaptureBug

void ___BLTCaptureBug_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BEB3478]);
  v1 = (void *)_BLTCaptureBug__diagnosticReporter;
  _BLTCaptureBug__diagnosticReporter = (uint64_t)v0;

}

void ___BLTCaptureBug_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  blt_general_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_2173D9000, v3, OS_LOG_TYPE_DEFAULT, "Received response from Diagnostic Reporter - %@", (uint8_t *)&v4, 0xCu);
  }

}

@end
