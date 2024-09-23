@implementation BBSyncServiceXPC

+ (id)clientInterface
{
  if (clientInterface_onceToken_96 != -1)
    dispatch_once(&clientInterface_onceToken_96, &__block_literal_global_98);
  return (id)clientInterface___interface_97;
}

void __35__BBSyncServiceXPC_clientInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549972D8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientInterface___interface_97;
  clientInterface___interface_97 = v0;

}

@end
