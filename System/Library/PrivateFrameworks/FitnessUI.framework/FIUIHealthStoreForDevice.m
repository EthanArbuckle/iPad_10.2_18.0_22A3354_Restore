@implementation FIUIHealthStoreForDevice

void __FIUIHealthStoreForDevice_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x24BDD3078];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
      __FIUIHealthStoreForDevice_block_invoke_cold_1((uint64_t)v6, v7);
  }
  else if (!v5)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x24BDD3078];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_21307C000, v8, OS_LOG_TYPE_DEFAULT, "Profile identifier for satellite paired watch is nil with no error.  Guardian health cloud sharing disabled.", v12, 2u);
    }
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __FIUIHealthStoreForDevice_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21307C000, a2, OS_LOG_TYPE_ERROR, "Error reading profile identifier for satellite paired watch. error=%@", (uint8_t *)&v2, 0xCu);
}

@end
