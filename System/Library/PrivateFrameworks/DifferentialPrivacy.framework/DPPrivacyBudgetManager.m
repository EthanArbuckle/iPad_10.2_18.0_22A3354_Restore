@implementation DPPrivacyBudgetManager

void __64___DPPrivacyBudgetManager_scheduleMaintenanceWithName_database___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)os_transaction_create();
  v4 = (void *)MEMORY[0x1D8256B78]();
  +[_DPPrivacyBudget updateAllBudgetsIn:](_DPPrivacyBudget, "updateAllBudgetsIn:", *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v4);

}

@end
