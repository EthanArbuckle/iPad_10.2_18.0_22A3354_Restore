@implementation CLKComplicationServerInterface

void __CLKComplicationServerInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AC2BA0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CLKComplicationServerInterface_interface;
  CLKComplicationServerInterface_interface = v0;

}

@end
