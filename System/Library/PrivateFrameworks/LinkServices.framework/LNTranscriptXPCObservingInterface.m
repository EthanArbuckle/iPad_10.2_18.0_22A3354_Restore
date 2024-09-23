@implementation LNTranscriptXPCObservingInterface

void __LNTranscriptXPCObservingInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE65F700);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LNTranscriptXPCObservingInterface_interface;
  LNTranscriptXPCObservingInterface_interface = v0;

  LNConfigureStartObservingNextActionXPCMethod((void *)LNTranscriptXPCObservingInterface_interface);
}

@end
