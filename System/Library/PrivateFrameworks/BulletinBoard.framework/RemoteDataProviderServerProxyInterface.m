@implementation RemoteDataProviderServerProxyInterface

void __RemoteDataProviderServerProxyInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549A4058);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)RemoteDataProviderServerProxyInterface___interface;
  RemoteDataProviderServerProxyInterface___interface = v0;

}

@end
