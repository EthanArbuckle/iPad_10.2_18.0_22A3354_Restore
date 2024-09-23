@implementation SGDataDetectorsRunWithSharedScanner

uint64_t __SGDataDetectorsRunWithSharedScanner_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __SGDataDetectorsRunWithSharedScanner_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E0]), "initWithBlock:idleTimeout:", &__block_literal_global_6_18471, 10.0);
  v2 = (void *)SGDataDetectorsRunWithSharedScanner__pasExprOnceResult;
  SGDataDetectorsRunWithSharedScanner__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id __SGDataDetectorsRunWithSharedScanner_block_invoke_2()
{
  void *ScannerOrFail;
  id v1;
  void *v2;
  void *v3;

  ScannerOrFail = (void *)SGDataDetectorsCreateScannerOrFail();
  v1 = objc_alloc(MEMORY[0x1E0D81600]);
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "SGDataDetectors-SharedScanner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithGuardedData:serialQueue:", ScannerOrFail, v2);

  return v3;
}

@end
