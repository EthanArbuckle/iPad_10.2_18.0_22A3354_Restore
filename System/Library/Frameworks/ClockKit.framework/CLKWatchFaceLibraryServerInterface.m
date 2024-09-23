@implementation CLKWatchFaceLibraryServerInterface

void __CLKWatchFaceLibraryServerInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254ABB628);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CLKWatchFaceLibraryServerInterface_interface;
  CLKWatchFaceLibraryServerInterface_interface = v0;

}

@end
