@implementation FPXOperationServiceXPCInterface

void __FPXOperationServiceXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5CF740);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FPXOperationServiceXPCInterface_interface;
  FPXOperationServiceXPCInterface_interface = v0;

  FPXSetOperationServiceOnXPCInterface((void *)FPXOperationServiceXPCInterface_interface);
}

@end
