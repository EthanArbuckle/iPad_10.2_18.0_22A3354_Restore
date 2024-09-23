@implementation SHShazamKitUIClientInterface

void __SHShazamKitUIClientInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25500C580);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SHShazamKitUIClientInterface_interface;
  SHShazamKitUIClientInterface_interface = v0;

}

@end
