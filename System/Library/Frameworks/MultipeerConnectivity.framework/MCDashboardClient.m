@implementation MCDashboardClient

uint64_t __MCDashboardClient_block_invoke()
{
  MCDashboardClient_client = (uint64_t)objc_alloc_init(MEMORY[0x24BE297A8]);
  return objc_msgSend((id)MCDashboardClient_client, "activate");
}

@end
