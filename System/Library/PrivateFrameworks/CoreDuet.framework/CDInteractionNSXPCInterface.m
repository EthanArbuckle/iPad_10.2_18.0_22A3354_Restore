@implementation CDInteractionNSXPCInterface

void ___CDInteractionNSXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE109AA8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_CDInteractionNSXPCInterface_interface;
  _CDInteractionNSXPCInterface_interface = v0;

  setClassesForCDInteractionXPCInterface((void *)_CDInteractionNSXPCInterface_interface);
}

@end
