@implementation BMLoadBehaviorStoragePersistentContainer

void __BMLoadBehaviorStoragePersistentContainer_block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  BOOL v3;
  uint64_t v4;
  NSObject *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("BehaviorMiner"), CFSTR("momd"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  BMLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __BMLoadBehaviorStoragePersistentContainer_block_invoke_cold_2();

  if (v0)
    v3 = v1 == 0;
  else
    v3 = 1;
  if (v3)
  {
    BMLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __BMLoadBehaviorStoragePersistentContainer_block_invoke_cold_1(v5);
  }
  else
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB6B0]), "initWithContentsOfURL:", v1);
    v5 = BMLoadBehaviorStoragePersistentContainer_model;
    BMLoadBehaviorStoragePersistentContainer_model = v4;
  }

}

void __BMLoadBehaviorStoragePersistentContainer_block_invoke_178(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

void __BMLoadBehaviorStoragePersistentContainer_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2147C2000, log, OS_LOG_TYPE_FAULT, "Error initializing CoreBehavior storage: missing BehaviorMiner.momd from BehaviorMiner.framework resources", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void __BMLoadBehaviorStoragePersistentContainer_block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_2147C2000, v0, OS_LOG_TYPE_DEBUG, "Loading managed object model from bundle: %@ URL: %@", v1, 0x16u);
  OUTLINED_FUNCTION_1_1();
}

@end
