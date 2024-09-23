@implementation FIUIStateMachineExporter

+ (void)exportWithName:(id)a3 graphDescription:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall"))
  {
    dispatch_get_global_queue(17, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__FIUIStateMachineExporter_exportWithName_graphDescription___block_invoke;
    v8[3] = &unk_24CF305D8;
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, v8);

  }
}

void __60__FIUIStateMachineExporter_exportWithName_graphDescription___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  os_log_t *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (uint64_t *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%@.dot"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v7 = (os_log_t *)MEMORY[0x24BDD3078];
  v8 = *MEMORY[0x24BDD3078];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
  {
    v9 = *v4;
    *(_DWORD *)buf = 138412546;
    v15 = v9;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_21307C000, v8, OS_LOG_TYPE_DEFAULT, "[%@] Writing finite state machine dot file to: %@", buf, 0x16u);
  }
  v10 = *(void **)(a1 + 40);
  v13 = 0;
  objc_msgSend(v10, "writeToFile:atomically:encoding:error:", v6, 0, 4, &v13);
  v11 = v13;
  if (v11)
  {
    _HKInitializeLogging();
    v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      __60__FIUIStateMachineExporter_exportWithName_graphDescription___block_invoke_cold_1(v4, (uint64_t)v11, v12);
  }

}

void __60__FIUIStateMachineExporter_exportWithName_graphDescription___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_21307C000, log, OS_LOG_TYPE_ERROR, "[%@] Could not write finite state machine dot file with error: %@", (uint8_t *)&v4, 0x16u);
}

@end
