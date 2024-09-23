@implementation APGetReadServiceInterface

uint64_t __APGetReadServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2563DE2A0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)APGetReadServiceInterface_interface;
  APGetReadServiceInterface_interface = v0;

  objc_msgSend((id)APGetReadServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getConfiguration_, 0, 1);
  return objc_msgSend((id)APGetReadServiceInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getConfiguration_, 1, 1);
}

@end
