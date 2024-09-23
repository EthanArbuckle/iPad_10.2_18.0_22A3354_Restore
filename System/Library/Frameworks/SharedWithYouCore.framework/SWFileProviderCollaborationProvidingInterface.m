@implementation SWFileProviderCollaborationProvidingInterface

void __SWFileProviderCollaborationProvidingInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDFD3718);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SWFileProviderCollaborationProvidingInterface_interface;
  SWFileProviderCollaborationProvidingInterface_interface = v0;

}

@end
