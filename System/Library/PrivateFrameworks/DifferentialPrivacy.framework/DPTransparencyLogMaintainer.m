@implementation DPTransparencyLogMaintainer

void __69___DPTransparencyLogMaintainer_scheduleMaintenanceWithName_database___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)os_transaction_create();
  v4 = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend(*(id *)(a1 + 32), "doMaintenance");
  objc_autoreleasePoolPop(v4);

}

@end
