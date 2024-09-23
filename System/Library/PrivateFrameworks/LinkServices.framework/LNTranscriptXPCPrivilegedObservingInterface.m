@implementation LNTranscriptXPCPrivilegedObservingInterface

void __LNTranscriptXPCPrivilegedObservingInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  LNTranscriptXPCPrivilegedInterface();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LNTranscriptXPCPrivilegedObservingInterface_interface;
  LNTranscriptXPCPrivilegedObservingInterface_interface = v0;

  objc_msgSend((id)LNTranscriptXPCPrivilegedObservingInterface_interface, "setProtocol:", &unk_1EE662748);
  LNConfigureStartObservingNextActionXPCMethod((void *)LNTranscriptXPCPrivilegedObservingInterface_interface);
}

@end
