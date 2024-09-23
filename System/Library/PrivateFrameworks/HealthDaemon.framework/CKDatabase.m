@implementation CKDatabase

void __64__CKDatabase_OperationAnalytics__hd_addOperationObserver_queue___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  _HKInitializeLogging();
  v0 = objc_alloc(MEMORY[0x1E0CB6988]);
  v1 = objc_msgSend(v0, "initWithName:loggingCategory:", CFSTR("CloudSyncOperationObservation"), *MEMORY[0x1E0CB5370]);
  v2 = (void *)qword_1ED5522F8;
  qword_1ED5522F8 = v1;

}

uint64_t __50__CKDatabase_OperationAnalytics__hd_addOperation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "database:didAddOperation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
