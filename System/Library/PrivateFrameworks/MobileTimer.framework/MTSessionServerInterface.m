@implementation MTSessionServerInterface

void __MTSessionServerInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3DB400);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MTSessionServerInterface_sessionServerInterface;
  MTSessionServerInterface_sessionServerInterface = v0;

}

@end
