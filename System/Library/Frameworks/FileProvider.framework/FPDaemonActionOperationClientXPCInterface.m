@implementation FPDaemonActionOperationClientXPCInterface

void __FPDaemonActionOperationClientXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5E00D8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FPDaemonActionOperationClientXPCInterface_interface;
  FPDaemonActionOperationClientXPCInterface_interface = v0;

  FPSetOperationClientOnXPCInterface((void *)FPDaemonActionOperationClientXPCInterface_interface);
}

@end
