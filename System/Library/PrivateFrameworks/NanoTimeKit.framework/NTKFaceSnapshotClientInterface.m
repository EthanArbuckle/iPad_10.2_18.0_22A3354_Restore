@implementation NTKFaceSnapshotClientInterface

void __NTKFaceSnapshotClientInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F8E9D840);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKFaceSnapshotClientInterface_interface;
  NTKFaceSnapshotClientInterface_interface = v0;

}

@end
