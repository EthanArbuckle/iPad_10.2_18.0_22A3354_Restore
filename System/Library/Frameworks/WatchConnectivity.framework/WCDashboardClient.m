@implementation WCDashboardClient

uint64_t __WCDashboardClient_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BE297A8]);
  v1 = (void *)WCDashboardClient_client;
  WCDashboardClient_client = (uint64_t)v0;

  return objc_msgSend((id)WCDashboardClient_client, "activate");
}

@end
