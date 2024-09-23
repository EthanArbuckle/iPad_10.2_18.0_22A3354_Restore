@implementation NFCHardwareManagerCallbacks

+ (id)interface
{
  if (interface_onceToken_87 != -1)
    dispatch_once(&interface_onceToken_87, &__block_literal_global_88);
  return (id)interface_interface_86;
}

void __40__NFCHardwareManagerCallbacks_interface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E00AA8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interface_interface_86;
  interface_interface_86 = v0;

}

@end
