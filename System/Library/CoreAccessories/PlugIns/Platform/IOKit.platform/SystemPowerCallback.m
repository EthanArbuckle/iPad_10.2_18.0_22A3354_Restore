@implementation SystemPowerCallback

void ____SystemPowerCallback_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "sleepNotificationClients");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "setClientsPreventingSleep:", v2);

}

uint64_t ____SystemPowerCallback_block_invoke_182(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setClientsPreventingSleep:", 0);
}

@end
