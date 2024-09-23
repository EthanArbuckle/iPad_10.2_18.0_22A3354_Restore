@implementation DPBlacklistManager

void __55___DPBlacklistManager_createRuntimeBlacklistDirectory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", *(_QWORD *)(a1 + 32), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  createRuntimeBlacklistDirectory__created = objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, 0);

}

void __60___DPBlacklistManager_scheduleMaintenanceWithName_database___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  v2 = (void *)os_transaction_create();
  v3 = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend((id)objc_opt_class(), "processRuntimeBlacklist");
  objc_autoreleasePoolPop(v3);

}

@end
